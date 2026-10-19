import { useState, useEffect } from 'react';
import { User, Product, BatchItem } from '@/app/App';
import { Button } from '@/app/components/ui/button';
import { Input } from '@/app/components/ui/input';
import { Label } from '@/app/components/ui/label';
import { Card, CardContent, CardHeader, CardTitle } from '@/app/components/ui/card';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/app/components/ui/table';
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from '@/app/components/ui/dialog';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/app/components/ui/select';
import { Badge } from '@/app/components/ui/badge';
import { toast } from 'sonner';
import { Plus, Edit, Trash2, Search, Package, ChevronLeft, ChevronRight, Layers, ArrowUpDown, ArrowUp, ArrowDown, ChevronDown, ArrowDownAZ, RotateCcw, Boxes, Lock, Upload, Image as ImageIcon, X, AlertCircle } from 'lucide-react';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuRadioGroup,
  DropdownMenuRadioItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/app/components/ui/dropdown-menu';
import { cn } from '@/app/components/ui/utils';
import { ErrorBoundary } from '@/app/components/ErrorBoundary';
import { logAuditAction } from '@/app/utils/auditUtils';
import { isRxProduct } from '@/app/utils/rxUtils';
import { OwnerPasscodeModal } from '@/app/components/OwnerPasscodeModal';
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle
} from '@/app/components/ui/alert-dialog';

interface InventoryManagementProps {
  currentUser: User;
  products: Product[];
  onProductsChange: (products: Product[]) => void;
}

const categories = ['Pharmaceutical', 'Non-pharmaceutical'];

export const QUICK_SUPPLIERS = ['UNILAB', 'SANOFI', 'PFIZER', 'WYETH', 'IPI', 'GSK', 'PASCUAL', 'RHEA', 'GEN-MERCH'];

export const formatBatchCode = (arrivalDate?: string, supplier?: string) => {
  if (arrivalDate && arrivalDate.includes('-')) {
    const cleanDate = arrivalDate.replace(/-/g, '').slice(0, 8);
    return `${cleanDate}-${(supplier || 'UNILAB').toUpperCase().trim()}`;
  }
  const now = new Date();
  const yyyy = now.getFullYear();
  const mm = String(now.getMonth() + 1).padStart(2, '0');
  const dd = String(now.getDate()).padStart(2, '0');
  return `${yyyy}${mm}${dd}-${(supplier || 'UNILAB').toUpperCase().trim()}`;
};

export const extractArrivalDate = (batchNumber?: string | null, explicitDate?: string | null, fallback?: string): string => {
  if (batchNumber) {
    const m = batchNumber.trim().match(/^(\d{4})(\d{2})(\d{2})/);
    if (m) {
      const y = parseInt(m[1], 10);
      const mon = parseInt(m[2], 10);
      const d = parseInt(m[3], 10);
      if (y >= 2000 && y <= 2100 && mon >= 1 && mon <= 12 && d >= 1 && d <= 31) {
        return `${m[1]}-${m[2]}-${m[3]}`;
      }
    }
  }
  if (explicitDate && /^\d{4}-\d{2}-\d{2}/.test(explicitDate)) {
    return explicitDate.slice(0, 10);
  }
  return fallback || new Date().toISOString().split('T')[0];
};

export const getTodayBatchCode = (supplier?: string) => {
  return formatBatchCode(undefined, supplier);
};

export interface ProcessBatchInput {
  oldQty: number;
  oldExp?: string | null;
  oldBatchNumber?: string | null;
  oldArrivalDate?: string;
  queue: BatchItem[];
  incomingQty: number;
  incomingExp?: string | null;
  incomingBatchNumber: string;
  incomingSupplier: string;
  incomingArrivalDate: string;
  dispensingMethod: 'FEFO' | 'FIFO';
}

export function processIncomingBatch(input: ProcessBatchInput) {
  const isFifo = input.dispensingMethod === 'FIFO';
  const todayStr = new Date().toISOString().split('T')[0];
  const bInc = (input.incomingBatchNumber || '').trim().toUpperCase();
  const expInc = isFifo ? undefined : (input.incomingExp ? input.incomingExp.slice(0, 10).trim() : undefined);
  const arrOld = extractArrivalDate(input.oldBatchNumber, input.oldArrivalDate, todayStr);
  const arrInc = extractArrivalDate(bInc, input.incomingArrivalDate, todayStr);

  let curOld = {
    quantity: Number(input.oldQty || 0),
    expiryDate: isFifo ? undefined : (input.oldExp || undefined),
    batchNumber: input.oldBatchNumber || undefined,
    arrivalDate: arrOld,
    supplier: input.incomingSupplier
  };
  let curQueue = Array.isArray(input.queue) ? [...input.queue] : [];
  let actionTaken: 'combined_old' | 'swapped_old' | 'combined_queue' | 'queued' | 'set_initial' = 'queued';
  let message = '';

  // If active Old batch is empty or has no batch number:
  if (curOld.quantity <= 0 || !curOld.batchNumber) {
    curOld = {
      batchNumber: bInc,
      quantity: Number(input.incomingQty),
      expiryDate: expInc,
      arrivalDate: arrInc,
      supplier: input.incomingSupplier
    };
    actionTaken = 'set_initial';
    message = `Set initial active Old Batch: ${bInc} (${input.incomingQty} pcs)`;
  } else {
    const bOld = (curOld.batchNumber || '').trim().toUpperCase();
    const expOld = isFifo ? undefined : (curOld.expiryDate ? curOld.expiryDate.slice(0, 10).trim() : undefined);

    if (isFifo) {
      // FIFO Logic:
      // Same batch number -> Combine into Old
      if (bOld === bInc) {
        curOld.quantity += Number(input.incomingQty);
        actionTaken = 'combined_old';
        message = `Combined +${input.incomingQty} pcs into active Old Batch ${bInc} (Same Batch Number)`;
      } else {
        // Different batch number: Compare arrival dates
        if (arrInc < arrOld) {
          // Incoming batch actually arrived EARLIER than active Old batch!
          const formerOld: BatchItem = {
            batchNumber: curOld.batchNumber || formatBatchCode(curOld.arrivalDate, curOld.supplier),
            quantity: curOld.quantity,
            expiryDate: undefined,
            arrivalDate: arrOld,
            supplier: curOld.supplier
          };

          curOld = {
            batchNumber: bInc,
            quantity: Number(input.incomingQty),
            expiryDate: undefined,
            arrivalDate: arrInc,
            supplier: input.incomingSupplier
          };

          const fCode = (formerOld.batchNumber || '').trim().toUpperCase();
          const qIdx = curQueue.findIndex(b => (b.batchNumber || '').trim().toUpperCase() === fCode);
          if (qIdx >= 0) {
            curQueue[qIdx].quantity = Number(curQueue[qIdx].quantity) + Number(formerOld.quantity);
          } else {
            curQueue.push(formerOld);
          }

          actionTaken = 'swapped_old';
          message = `FIFO Rotation Applied: Incoming batch ${bInc} arrived earlier (${arrInc} vs ${arrOld}). Swapped into active Old Batch; former batch moved to queue.`;
        } else {
          // Incoming batch arrived later or same day -> Add to queue (Old batch stays as active)
          const qIdx = curQueue.findIndex(b => (b.batchNumber || '').trim().toUpperCase() === bInc);
          if (qIdx >= 0) {
            curQueue[qIdx].quantity = Number(curQueue[qIdx].quantity) + Number(input.incomingQty);
            actionTaken = 'combined_queue';
            message = `Combined +${input.incomingQty} pcs into queued batch ${bInc}`;
          } else {
            curQueue.push({
              batchNumber: bInc,
              quantity: Number(input.incomingQty),
              expiryDate: undefined,
              arrivalDate: arrInc,
              supplier: input.incomingSupplier
            });
            actionTaken = 'queued';
            message = `Queued incoming batch ${bInc} (${input.incomingQty} pcs, Arrived: ${arrInc}) in FIFO order`;
          }
        }

        // Sort FIFO queue chronologically by arrival date
        curQueue.sort((a, b) => {
          const aArr = extractArrivalDate(a.batchNumber, a.arrivalDate, todayStr);
          const bArr = extractArrivalDate(b.batchNumber, b.arrivalDate, todayStr);
          if (aArr !== bArr) return aArr.localeCompare(bArr);
          return (a.batchNumber || '').localeCompare(b.batchNumber || '');
        });
      }
    } else {
      // FEFO Logic:
      // 1. Same batch number AND same expiration date -> Combine into Old!
      if (bOld === bInc && expOld === expInc) {
        curOld.quantity += Number(input.incomingQty);
        actionTaken = 'combined_old';
        message = `Combined +${input.incomingQty} pcs into active Old Batch ${bInc} (Same Batch Number & Expiry: ${expInc || 'N/A'})`;
      } else {
        // 2. Different expiration date or different batch number:
        // Check if incoming batch expires SOONER than Old batch
        const isSooner = (expInc && expOld) ? expInc < expOld : Boolean(expInc && !expOld);

        if (isSooner) {
          // SWAP: Incoming becomes Old; former Old goes into queue!
          const formerOld: BatchItem = {
            batchNumber: curOld.batchNumber || formatBatchCode(curOld.arrivalDate, curOld.supplier),
            quantity: curOld.quantity,
            expiryDate: curOld.expiryDate,
            arrivalDate: curOld.arrivalDate,
            supplier: curOld.supplier
          };

          curOld = {
            batchNumber: bInc,
            quantity: Number(input.incomingQty),
            expiryDate: expInc,
            arrivalDate: input.incomingArrivalDate,
            supplier: input.incomingSupplier
          };

          // Place former Old into queue (merge if same batch # & same exp exists in queue)
          const fCode = (formerOld.batchNumber || '').trim().toUpperCase();
          const fExp = (formerOld.expiryDate || '').slice(0, 10).trim();
          const qIdx = curQueue.findIndex(b => 
            (b.batchNumber || '').trim().toUpperCase() === fCode &&
            (b.expiryDate || '').slice(0, 10).trim() === fExp
          );
          if (qIdx >= 0) {
            curQueue[qIdx].quantity = Number(curQueue[qIdx].quantity) + Number(formerOld.quantity);
          } else {
            curQueue.push(formerOld);
          }

          actionTaken = 'swapped_old';
          message = `FEFO Rotation Applied: Incoming batch ${bInc} (EXP: ${expInc || 'N/A'}) expires earlier! Swapped into active Old Batch; previous batch (${formerOld.batchNumber}) moved to queue.`;
        } else {
          // Incoming batch expires later or equal -> Add to queue!
          const qIdx = curQueue.findIndex(b => 
            (b.batchNumber || '').trim().toUpperCase() === bInc &&
            (b.expiryDate || '').slice(0, 10).trim() === (expInc || '')
          );
          if (qIdx >= 0) {
            curQueue[qIdx].quantity = Number(curQueue[qIdx].quantity) + Number(input.incomingQty);
            actionTaken = 'combined_queue';
            message = `Combined +${input.incomingQty} pcs into queued batch ${bInc} (Same Batch Number & Expiry)`;
          } else {
            curQueue.push({
              batchNumber: bInc,
              quantity: Number(input.incomingQty),
              expiryDate: expInc,
              arrivalDate: input.incomingArrivalDate,
              supplier: input.incomingSupplier
            });
            actionTaken = 'queued';
            message = `Queued incoming batch ${bInc} (${input.incomingQty} pcs, EXP: ${expInc || 'N/A'}) into queue`;
          }
        }

        // Sort queue by FEFO (earliest expiry first)
        curQueue.sort((a, b) => {
          const ea = (a.expiryDate || '').slice(0, 10).trim() || '9999-12-31';
          const eb = (b.expiryDate || '').slice(0, 10).trim() || '9999-12-31';
          if (ea !== eb) return ea.localeCompare(eb);
          return (a.arrivalDate || '').localeCompare(b.arrivalDate || '');
        });
      }
    }
  }

  // Auto-depletion rotation: if Old reached 0, rotate next batch from queue
  if (curOld.quantity <= 0 && curQueue.length > 0) {
    const next = curQueue.shift()!;
    curOld = {
      batchNumber: next.batchNumber,
      quantity: Number(next.quantity),
      expiryDate: isFifo ? undefined : next.expiryDate,
      arrivalDate: next.arrivalDate,
      supplier: next.supplier
    };
  }

  const totalRemainingQty = curQueue.reduce((sum, b) => sum + Number(b.quantity || 0), 0);
  const remExpList = curQueue.map(b => b.expiryDate).filter(Boolean) as string[];
  const earliestRemExp = (!isFifo && remExpList.length > 0) ? [...remExpList].sort()[0] : undefined;

  return {
    quantity: curOld.quantity,
    expiryDate: curOld.expiryDate,
    batchNumber: curOld.batchNumber,
    newBatchQueue: curQueue,
    newStockQuantity: totalRemainingQty,
    newStockExpiry: earliestRemExp,
    actionTaken,
    message
  };
}

export function alignBatchesFEFO(
  oldQty: number,
  oldExp: string | undefined | null,
  oldBatchNumber: string | undefined,
  queue: BatchItem[],
  defaultSupplier: string,
  todayStr: string,
  dispensingMethod: 'FEFO' | 'FIFO' = 'FEFO'
) {
  const isFifo = dispensingMethod === 'FIFO';
  const allBatches: BatchItem[] = [];

  if (Number(oldQty) > 0) {
    const bCode = oldBatchNumber || formatBatchCode(todayStr, defaultSupplier);
    const arrDate = extractArrivalDate(bCode, undefined, todayStr);
    allBatches.push({
      batchNumber: bCode,
      supplier: defaultSupplier,
      quantity: Number(oldQty),
      expiryDate: isFifo ? undefined : (oldExp || undefined),
      arrivalDate: arrDate
    });
  }

  if (Array.isArray(queue)) {
    for (const item of queue) {
      if (Number(item.quantity) > 0) {
        const bCode = item.batchNumber || formatBatchCode(item.arrivalDate || todayStr, item.supplier || defaultSupplier);
        const arrDate = extractArrivalDate(bCode, item.arrivalDate, todayStr);
        allBatches.push({
          batchNumber: bCode,
          supplier: item.supplier || defaultSupplier,
          quantity: Number(item.quantity),
          expiryDate: isFifo ? undefined : (item.expiryDate || undefined),
          arrivalDate: arrDate
        });
      }
    }
  }

  if (allBatches.length === 0) {
    return {
      quantity: 0,
      expiryDate: undefined,
      batchNumber: undefined,
      newBatchQueue: [] as BatchItem[],
      newStockQuantity: 0,
      newStockExpiry: undefined,
      wasPromoted: false
    };
  }

  // Merge batches with SAME batch number AND SAME expiry (or FIFO same batch number)
  const merged: BatchItem[] = [];
  for (const b of allBatches) {
    const bCode = (b.batchNumber || '').trim().toUpperCase();
    const bExp = isFifo ? '' : (b.expiryDate || '').slice(0, 10).trim();
    const existing = merged.find(m => {
      const mCode = (m.batchNumber || '').trim().toUpperCase();
      const mExp = isFifo ? '' : (m.expiryDate || '').slice(0, 10).trim();
      return bCode === mCode && (isFifo || bExp === mExp);
    });

    if (existing) {
      existing.quantity = Number(existing.quantity) + Number(b.quantity);
    } else {
      merged.push({ ...b });
    }
  }

  if (isFifo) {
    // FIFO order: Earliest arrival date first (First In, First Out)
    merged.sort((a, b) => {
      const arrA = extractArrivalDate(a.batchNumber, a.arrivalDate, todayStr);
      const arrB = extractArrivalDate(b.batchNumber, b.arrivalDate, todayStr);
      if (arrA !== arrB) {
        return arrA.localeCompare(arrB);
      }
      return (a.batchNumber || '').localeCompare(b.batchNumber || '');
    });
  } else {
    // FEFO order: Earliest expiration date first
    merged.sort((a, b) => {
      const expA = a.expiryDate && a.expiryDate.trim() ? a.expiryDate.trim() : '9999-12-31';
      const expB = b.expiryDate && b.expiryDate.trim() ? b.expiryDate.trim() : '9999-12-31';
      if (expA !== expB) {
        return expA.localeCompare(expB);
      }
      const arrA = extractArrivalDate(a.batchNumber, a.arrivalDate, todayStr);
      const arrB = extractArrivalDate(b.batchNumber, b.arrivalDate, todayStr);
      return arrA.localeCompare(arrB);
    });
  }

  const primary = merged[0];
  const remaining = merged.slice(1);
  const totalRemainingQty = remaining.reduce((sum, b) => sum + Number(b.quantity || 0), 0);
  const remExpList = remaining.map(b => b.expiryDate).filter(Boolean) as string[];
  const earliestRemExp = (!isFifo && remExpList.length > 0) ? [...remExpList].sort()[0] : undefined;

  const wasPromoted = primary.batchNumber !== oldBatchNumber;

  return {
    quantity: primary.quantity,
    expiryDate: isFifo ? undefined : primary.expiryDate,
    batchNumber: primary.batchNumber,
    newBatchQueue: remaining,
    newStockQuantity: totalRemainingQty,
    newStockExpiry: earliestRemExp,
    wasPromoted
  };
}

export function InventoryManagement({ currentUser, products, onProductsChange }: InventoryManagementProps) {
  const [searchQuery, setSearchQuery] = useState('');
  const [filterCategory, setFilterCategory] = useState('all');
  const [filterStockStatus, setFilterStockStatus] = useState('all');
  const [sortName, setSortName] = useState<'none' | 'a-z' | 'z-a'>('none');
  const [sortStock, setSortStock] = useState<'none' | 'low-high' | 'high-low'>('none');
  const [primarySort, setPrimarySort] = useState<'name' | 'stock' | 'none'>('none');
  const [currentPage, setCurrentPage] = useState(1);
  const [isAddDialogOpen, setIsAddDialogOpen] = useState(false);
  const [isAuthAddOpen, setIsAuthAddOpen] = useState(false);
  const [showAddConfirm, setShowAddConfirm] = useState(false);
  const [isEditDialogOpen, setIsEditDialogOpen] = useState(false);
  const [showSaveConfirm, setShowSaveConfirm] = useState(false);
  const [editingProduct, setEditingProduct] = useState<Product | null>(null);
  const [formData, setFormData] = useState<Partial<Product>>({});
  const [productToDelete, setProductToDelete] = useState<Product | null>(null);
  const [isDeleting, setIsDeleting] = useState(false);
  const [productToAuthEdit, setProductToAuthEdit] = useState<Product | null>(null);
  const [productToAuthDelete, setProductToAuthDelete] = useState<Product | null>(null);
  const [viewingQueueProduct, setViewingQueueProduct] = useState<Product | null>(null);
  const [incomingBatchQty, setIncomingBatchQty] = useState<number | ''>('');
  const [incomingBatchExp, setIncomingBatchExp] = useState<string>('');
  const [incomingBatchArrivalDate, setIncomingBatchArrivalDate] = useState<string>(() => new Date().toISOString().split('T')[0]);
  const [incomingBatchNumber, setIncomingBatchNumber] = useState<string>('');
  const [incomingBatchSupplier, setIncomingBatchSupplier] = useState<string>('UNILAB');
  const [isUploadingImage, setIsUploadingImage] = useState<boolean>(false);

  const handleImageUpload = async (file: File) => {
    if (!file) return;
    if (!file.type.startsWith('image/')) {
      toast.error('Please upload an image file (PNG, JPG, WEBP, GIF)');
      return;
    }
    setIsUploadingImage(true);
    try {
      const fd = new FormData();
      fd.append('image', file);
      const res = await fetch('/api/upload_image.php', {
        method: 'POST',
        headers: {
          'X-User-Name': currentUser.name
        },
        body: fd
      });
      const data = await res.json();
      if (data.success && data.url) {
        setFormData(prev => ({ ...prev, imageUrl: data.url }));
        toast.success('Product image uploaded successfully!');
      } else {
        toast.error(data.message || 'Image upload failed');
      }
    } catch (err) {
      console.error(err);
      toast.error('Network error during image upload');
    } finally {
      setIsUploadingImage(false);
    }
  };

  const handleAddBatchToQueue = () => {
    if (!incomingBatchQty || Number(incomingBatchQty) <= 0) {
      toast.error('Please enter a valid incoming batch quantity');
      return;
    }
    const sup = (incomingBatchSupplier || (formData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH')).toUpperCase().trim();
    const arrDate = incomingBatchArrivalDate || new Date().toISOString().split('T')[0];
    const code = (incomingBatchNumber.trim() || formatBatchCode(arrDate, sup)).toUpperCase();
    const method = (formData.dispensingMethod || 'FEFO') as 'FEFO' | 'FIFO';

    const result = processIncomingBatch({
      oldQty: Number(formData.quantity ?? 0),
      oldExp: formData.expiryDate,
      oldBatchNumber: formData.batchNumber,
      oldArrivalDate: extractArrivalDate(formData.batchNumber),
      queue: Array.isArray(formData.newBatchQueue) ? [...formData.newBatchQueue] : [],
      incomingQty: Number(incomingBatchQty),
      incomingExp: incomingBatchExp,
      incomingBatchNumber: code,
      incomingSupplier: sup,
      incomingArrivalDate: arrDate,
      dispensingMethod: method
    });

    setFormData({
      ...formData,
      quantity: result.quantity,
      expiryDate: result.expiryDate,
      batchNumber: result.batchNumber,
      newBatchQueue: result.newBatchQueue,
      newStockQuantity: result.newStockQuantity,
      newStockExpiry: result.newStockExpiry
    });

    toast.success(result.message);

    setIncomingBatchQty('');
    setIncomingBatchExp('');
    setIncomingBatchNumber(formatBatchCode(arrDate, sup));
  };

  const onTriggerAddConfirm = () => {
    if (!formData.name || !formData.sku || !formData.category || !formData.price || !formData.cost || !formData.quantity || !formData.reorderLevel) {
      toast.error('Please fill in all required fields');
      return;
    }
    setShowAddConfirm(true);
  };

  const handleAddProduct = async () => {
    if (!formData.name || !formData.sku || !formData.category || !formData.price || !formData.cost || !formData.quantity || !formData.reorderLevel) {
      toast.error('Please fill in all required fields');
      return;
    }

    const sup = formData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH';
    const batchNumber = formData.batchNumber?.trim() || getTodayBatchCode(sup);
    const method = formData.dispensingMethod || 'FEFO';

    try {
      const response = await fetch('/api/products.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-User-Name': currentUser.name
        },
        body: JSON.stringify({
          ...formData,
          dispensingMethod: method,
          imageUrl: formData.imageUrl || null,
          batchNumber,
          newStockQuantity: 0,
          newStockExpiry: null,
          newBatchQueue: []
        })
      });
      const data = await response.json();
      if (data.success) {
        toast.success('Product added successfully');
        logAuditAction(
          currentUser.name,
          'Inventory Add',
          `Added New Product: ${formData.name} [SKU: ${formData.sku}, Category: ${formData.category}, Method: ${method}] | Initial Old Batch: ${batchNumber} (${formData.quantity} pcs, EXP: ${formData.expiryDate || 'N/A'}, Supplier: ${sup}) | Cost: ₱${Number(formData.cost).toFixed(2)} | Price: ₱${Number(formData.price).toFixed(2)} | Reorder Level: ${formData.reorderLevel}`
        );
        setIsAddDialogOpen(false);
        setFormData({});
        const updatedProducts = await fetch('/api/products.php').then(res => res.json());
        onProductsChange(updatedProducts);
      } else {
        toast.error('Failed to add product: ' + data.message);
      }
    } catch (error) {
      console.error(error);
      toast.error('Error connecting to API');
    }
  };

  const openEditDialog = (p: Product) => {
    const sup = p.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH';
    const todayStr = new Date().toISOString().split('T')[0];
    const initialArrDate = p.createdAt ? p.createdAt.slice(0, 10) : todayStr;
    const method = (p.dispensingMethod || 'FEFO') as 'FEFO' | 'FIFO';

    const initialQueue: BatchItem[] = Array.isArray(p.newBatchQueue) && p.newBatchQueue.length > 0
      ? p.newBatchQueue.map(b => ({
          ...b,
          batchNumber: (b.batchNumber && !b.batchNumber.startsWith('20261014-'))
            ? b.batchNumber
            : formatBatchCode(b.arrivalDate || todayStr, b.supplier || sup),
          expiryDate: method === 'FIFO' ? undefined : b.expiryDate,
          arrivalDate: b.arrivalDate || todayStr
        }))
      : (p.newStockQuantity && p.newStockQuantity > 0
          ? [{
              batchNumber: formatBatchCode(todayStr, sup),
              supplier: sup,
              quantity: p.newStockQuantity,
              expiryDate: method === 'FIFO' ? undefined : p.newStockExpiry,
              arrivalDate: todayStr
            }]
          : []);

    const oldBatchNumber = Number(p.quantity) > 0
      ? ((p.batchNumber && !p.batchNumber.startsWith('20261014-'))
          ? p.batchNumber
          : formatBatchCode(initialArrDate, sup))
      : undefined;

    // Apply alignment
    const aligned = alignBatchesFEFO(
      Number(p.quantity ?? 0),
      method === 'FIFO' ? undefined : p.expiryDate,
      oldBatchNumber,
      initialQueue,
      sup,
      todayStr,
      method
    );

    setEditingProduct(p);
    setFormData({
      ...p,
      dispensingMethod: method,
      imageUrl: p.imageUrl || (p as any).image_url,
      quantity: aligned.quantity,
      expiryDate: aligned.expiryDate,
      batchNumber: aligned.batchNumber,
      newBatchQueue: aligned.newBatchQueue,
      newStockQuantity: aligned.newStockQuantity,
      newStockExpiry: aligned.newStockExpiry
    });
    setIncomingBatchQty('');
    setIncomingBatchExp('');
    setIncomingBatchArrivalDate(todayStr);
    setIncomingBatchSupplier(sup);
    setIncomingBatchNumber(formatBatchCode(todayStr, sup));
    setIsEditDialogOpen(true);
  };

  const handleEditProduct = async () => {
    if (!editingProduct) return;

    let workingData = { ...formData };
    const sup = (incomingBatchSupplier || (workingData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH')).toUpperCase().trim();
    const arrDate = incomingBatchArrivalDate || new Date().toISOString().split('T')[0];
    const method = (workingData.dispensingMethod || 'FEFO') as 'FEFO' | 'FIFO';

    let newlyAddedBatchSummary = '';

    if (incomingBatchQty && Number(incomingBatchQty) > 0) {
      const code = (incomingBatchNumber.trim() || formatBatchCode(arrDate, sup)).toUpperCase();
      const result = processIncomingBatch({
        oldQty: Number(workingData.quantity ?? 0),
        oldExp: workingData.expiryDate,
        oldBatchNumber: workingData.batchNumber,
        oldArrivalDate: extractArrivalDate(workingData.batchNumber),
        queue: Array.isArray(workingData.newBatchQueue) ? [...workingData.newBatchQueue] : [],
        incomingQty: Number(incomingBatchQty),
        incomingExp: incomingBatchExp,
        incomingBatchNumber: code,
        incomingSupplier: sup,
        incomingArrivalDate: arrDate,
        dispensingMethod: method
      });

      workingData = {
        ...workingData,
        quantity: result.quantity,
        expiryDate: result.expiryDate,
        batchNumber: result.batchNumber,
        newBatchQueue: result.newBatchQueue,
        newStockQuantity: result.newStockQuantity,
        newStockExpiry: result.newStockExpiry
      };
      newlyAddedBatchSummary = ` | ${result.message}`;
    }

    const payload = {
      ...editingProduct,
      ...workingData,
      dispensingMethod: method,
      imageUrl: workingData.imageUrl || null,
      quantity: Math.max(0, parseInt(String(workingData.quantity ?? 0), 10) || 0),
      expiryDate: method === 'FIFO' ? null : (workingData.expiryDate || null),
      batchNumber: workingData.batchNumber?.trim() || null,
      newBatchQueue: workingData.newBatchQueue || [],
      newStockQuantity: workingData.newStockQuantity || 0,
      newStockExpiry: method === 'FIFO' ? null : (workingData.newStockExpiry || null)
    };

    const currentQ = workingData.newBatchQueue || [];
    const queueDetails = currentQ.length > 0
      ? ` | Queued Batches (${currentQ.length}): [${currentQ.map(b => `${b.batchNumber}: ${b.quantity} pcs (EXP: ${b.expiryDate || 'N/A'})`).join(', ')}]`
      : ' | Queued Batches: None';

    const totalCombinedStock = Number(workingData.quantity || 0) + Number(workingData.newStockQuantity || 0);
    const auditDetails = `Updated Product: ${payload.name} [SKU: ${payload.sku}, Method: ${method}]${newlyAddedBatchSummary} | Active Old Batch: ${workingData.batchNumber} (${workingData.quantity} pcs, EXP: ${workingData.expiryDate || 'N/A'}) | New Batch Total: ${workingData.newStockQuantity} pcs${queueDetails} | Total Combined Stock: ${totalCombinedStock} pcs | Price: ₱${Number(payload.price).toFixed(2)}`;

    try {
      const response = await fetch(`/api/products.php?id=${editingProduct.id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'X-User-Name': currentUser.name
        },
        body: JSON.stringify(payload)
      });
      const data = await response.json();
      if (data.success) {
        toast.success(`Product updated successfully! Total Stock: ${totalCombinedStock} pcs.`);
        logAuditAction(
          currentUser.name,
          'Inventory Update',
          auditDetails
        );
        setIsEditDialogOpen(false);
        setEditingProduct(null);
        setFormData({});
        setIncomingBatchQty('');
        setIncomingBatchExp('');
        setIncomingBatchNumber('');

        // Immediate fetch of fresh products from backend
        const res = await fetch('/api/products.php');
        const updatedProducts = await res.json();
        if (Array.isArray(updatedProducts)) {
          onProductsChange(updatedProducts);
        }
      } else {
        toast.error('Failed to update product: ' + data.message);
      }
    } catch (e) {
      console.error(e);
      toast.error('Error connecting to API');
    }
  };

  const handleDeleteProduct = (product: Product) => {
    setProductToDelete(product);
  };

  const confirmDelete = async () => {
    if (!productToDelete) return;
    setIsDeleting(true);
    try {
      const response = await fetch(`/api/products.php?id=${productToDelete.id}`, {
        method: 'DELETE',
        headers: { 'X-User-Name': currentUser.name }
      });
      const data = await response.json();
      if (data.success) {
        toast.success(`"${productToDelete.name}" deleted successfully`);
        logAuditAction(
          currentUser.name,
          'Inventory Delete',
          `Deleted Product: ${productToDelete.name} [SKU: ${productToDelete.sku}, Category: ${productToDelete.category}] | Active Old Batch: ${productToDelete.quantity} pcs [Batch: ${productToDelete.batchNumber || 'N/A'}, EXP: ${productToDelete.expiryDate || 'N/A'}] | Queued Stock: ${productToDelete.newStockQuantity || 0} pcs | Price: ₱${productToDelete.price.toFixed(2)}`
        );
        const updatedProducts = await fetch('/api/products.php').then(res => res.json());
        onProductsChange(updatedProducts);
      } else {
        toast.error('Failed to delete: ' + data.message);
      }
    } catch (e) {
      console.error(e);
      toast.error('Error connecting to API');
    } finally {
      setIsDeleting(false);
      setProductToDelete(null);
    }
  };

  const checkStockStatus = (p: Product) => {
    const total = Number(p.quantity) + Number(p.newStockQuantity || 0);
    if (total === 0) return 'out';
    if (total <= Number(p.reorderLevel)) return 'low';
    return 'in';
  };

  const filteredProducts = products
    .filter(product => {
      const matchesSearch = product.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        product.sku.toLowerCase().includes(searchQuery.toLowerCase());
      const matchesCategory = filterCategory === 'all' || product.category === filterCategory;
      const matchesStock = filterStockStatus === 'all' || checkStockStatus(product) === filterStockStatus;
      return matchesSearch && matchesCategory && matchesStock;
    })
    .sort((a, b) => {
      const stockA = Number(a.quantity) + Number(a.newStockQuantity || 0);
      const stockB = Number(b.quantity) + Number(b.newStockQuantity || 0);

      // If Stock sorting was prioritized
      if (primarySort === 'stock' && sortStock !== 'none') {
        const stockDiff = sortStock === 'low-high' ? stockA - stockB : stockB - stockA;
        if (stockDiff !== 0) return stockDiff;
        if (sortName === 'a-z') return a.name.localeCompare(b.name, undefined, { sensitivity: 'base' });
        if (sortName === 'z-a') return b.name.localeCompare(a.name, undefined, { sensitivity: 'base' });
        return 0;
      }

      // If Name sorting was prioritized
      if (primarySort === 'name' && sortName !== 'none') {
        const nameDiff = sortName === 'a-z'
          ? a.name.localeCompare(b.name, undefined, { sensitivity: 'base' })
          : b.name.localeCompare(a.name, undefined, { sensitivity: 'base' });
        if (nameDiff !== 0) return nameDiff;
        if (sortStock === 'low-high') return stockA - stockB;
        if (sortStock === 'high-low') return stockB - stockA;
        return 0;
      }

      // If only one of the sorts is active
      if (sortStock !== 'none') {
        const stockDiff = sortStock === 'low-high' ? stockA - stockB : stockB - stockA;
        if (stockDiff !== 0) return stockDiff;
      }

      if (sortName !== 'none') {
        return sortName === 'a-z'
          ? a.name.localeCompare(b.name, undefined, { sensitivity: 'base' })
          : b.name.localeCompare(a.name, undefined, { sensitivity: 'base' });
      }

      return 0;
    });

  const itemsPerPage = 10;
  const totalPages = Math.max(1, Math.ceil(filteredProducts.length / itemsPerPage));
  const startIndex = (currentPage - 1) * itemsPerPage;
  const paginatedProducts = filteredProducts.slice(startIndex, startIndex + itemsPerPage);

  useEffect(() => {
    if (currentPage > totalPages) {
      setCurrentPage(totalPages);
    }
  }, [filteredProducts.length]);


  const isDateExpired = (dateStr?: string | null): boolean => {
    if (!dateStr) return false;
    const cleanDate = dateStr.includes('T') ? dateStr : dateStr + 'T00:00:00';
    const expiry = new Date(cleanDate);
    expiry.setHours(0, 0, 0, 0);
    const now = new Date();
    now.setHours(0, 0, 0, 0);
    return expiry.getTime() < now.getTime();
  };

  const getStockStatus = (product: Product) => {
    const isFIFO = product.dispensingMethod === 'FIFO';
    const oldQty = Math.max(0, Number(product.quantity));
    const newQty = Math.max(0, Number(product.newStockQuantity || 0));
    const total = oldQty + newQty;

    const oldExpired = isFIFO ? false : isDateExpired(product.expiryDate);
    const newExpired = isFIFO ? false : isDateExpired(product.newStockExpiry);

    const sellable = (oldExpired ? 0 : oldQty) + (newExpired ? 0 : newQty);

    if (total === 0) return { label: 'Out of Stock', color: 'bg-red-100 text-red-800' };
    if (!isFIFO && sellable === 0) return { label: 'Expired', color: 'bg-red-600 text-white animate-pulse' };
    if (!isFIFO && sellable < total) return { label: 'Partial Expired', color: 'bg-amber-100 text-amber-800' };
    if (sellable <= product.reorderLevel) return { label: 'Low Stock', color: 'bg-orange-100 text-orange-800' };
    return { label: 'In Stock', color: 'bg-green-100 text-green-800' };
  };

  return (
    <ErrorBoundary fallbackTitle="Inventory Management Module Error">
      <div className="space-y-6">
        {/* Delete Confirmation Dialog */}
        <Dialog open={!!productToDelete} onOpenChange={(open) => { if (!open && !isDeleting) setProductToDelete(null); }}>
          <DialogContent className="max-w-md">
            <DialogHeader>
              <DialogTitle className="flex items-center gap-2 text-red-600">
                <Trash2 className="size-5" />
                Delete Product
              </DialogTitle>
              <DialogDescription className="pt-2">
                Are you sure you want to delete <span className="font-bold text-gray-900">&ldquo;{productToDelete?.name}&rdquo;</span>?
                <br />
                <span className="text-red-500 text-xs mt-1 block">This action cannot be undone. Product will be removed and archived in deleted products records.</span>
              </DialogDescription>
            </DialogHeader>
            <DialogFooter className="mt-4 gap-2">
              <Button variant="outline" onClick={() => setProductToDelete(null)} disabled={isDeleting}>Cancel</Button>
              <Button
                variant="destructive"
                onClick={confirmDelete}
                disabled={isDeleting}
                className="bg-red-600 hover:bg-red-700 text-white"
              >
                {isDeleting ? 'Deleting...' : 'Yes, Delete'}
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>

        {/* Inventory Summary Cards */}
        <ErrorBoundary fallbackTitle="Inventory Summary Error">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Card className="bg-white border-2 border-blue-100 shadow-sm transition-all hover:scale-[1.01]">
              <CardHeader className="flex flex-row items-center justify-between pb-2">
                <CardTitle className="text-sm font-bold text-blue-900 uppercase tracking-wider">Total Products</CardTitle>
                <Package className="size-5 text-blue-600" />
              </CardHeader>
              <CardContent>
                <div className="text-3xl font-black text-blue-700">{products.length}</div>
                <p className="text-xs font-semibold text-blue-600 mt-1 uppercase tracking-wider">Unique items</p>
              </CardContent>
            </Card>

            <Card className="bg-white border-2 border-green-100 shadow-sm transition-all hover:scale-[1.01]">
              <CardHeader className="flex flex-row items-center justify-between pb-2">
                <CardTitle className="text-sm font-bold text-green-900 uppercase tracking-wider">Total Units</CardTitle>
                <Layers className="size-5 text-green-600" />
              </CardHeader>
              <CardContent>
                <div className="text-3xl font-black text-green-700">
                  {products.reduce((sum, p) => sum + (Number(p.quantity) + Number(p.newStockQuantity || 0)), 0)}
                </div>
                <p className="text-xs font-semibold text-green-600 mt-1 uppercase tracking-wider">Aggregate Stock Count</p>
              </CardContent>
            </Card>
          </div>
        </ErrorBoundary>

        {/* Header */}
        <ErrorBoundary fallbackTitle="Inventory Header Error">
          <div className="flex items-center justify-between">
            <div>
              <h2 className="text-2xl font-bold text-gray-900">Inventory Management</h2>
              <p className="text-sm text-gray-700 font-semibold mt-1">Manage your products and stock levels</p>
            </div>
            <Button onClick={() => setIsAuthAddOpen(true)}>
              <Plus className="size-4 mr-2" />
              Add Product
            </Button>
            <Dialog open={isAddDialogOpen} onOpenChange={setIsAddDialogOpen}>
              <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
                <DialogHeader>
                  <DialogTitle>Add New Product</DialogTitle>
                  <DialogDescription>Enter the details of the new product</DialogDescription>
                </DialogHeader>
                <div className="grid grid-cols-2 gap-4 py-4">
                  {/* Product Image Attachment */}
                  <div className="space-y-2 col-span-2">
                    <Label className="text-xs font-bold text-gray-700 flex items-center justify-between">
                      <span className="flex items-center gap-1.5">
                        <ImageIcon className="size-4 text-emerald-600" /> Product Image (Para sa POS at Inventory)
                      </span>
                      {isUploadingImage && <span className="text-xs text-blue-600 animate-pulse font-medium">Uploading image...</span>}
                    </Label>
                    {formData.imageUrl ? (
                      <div className="flex items-center gap-4 p-3 bg-emerald-50/60 border border-emerald-200 rounded-xl">
                        <div className="size-16 rounded-lg bg-white border border-emerald-200 p-1 flex items-center justify-center overflow-hidden shrink-0 shadow-2xs">
                          <img src={formData.imageUrl} alt="Product Preview" className="size-full object-contain mix-blend-multiply" />
                        </div>
                        <div className="flex-1 min-w-0">
                          <p className="text-xs font-bold text-emerald-900 truncate">Image Attached</p>
                          <p className="text-[10px] text-emerald-700 truncate font-mono">{formData.imageUrl}</p>
                        </div>
                        <div className="flex items-center gap-2">
                          <label className="cursor-pointer px-3 py-1.5 text-xs font-bold bg-white text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors shadow-2xs">
                            Change
                            <input
                              type="file"
                              accept="image/*"
                              className="hidden"
                              onChange={(e) => {
                                const file = e.target.files?.[0];
                                if (file) handleImageUpload(file);
                              }}
                            />
                          </label>
                          <Button
                            type="button"
                            variant="ghost"
                            size="sm"
                            onClick={() => setFormData({ ...formData, imageUrl: undefined })}
                            className="h-8 px-2 text-red-600 hover:text-red-700 hover:bg-red-50"
                          >
                            <X className="size-4" />
                          </Button>
                        </div>
                      </div>
                    ) : (
                      <label className="flex flex-col items-center justify-center p-4 border-2 border-dashed border-gray-200 hover:border-emerald-500 rounded-xl bg-gray-50/50 hover:bg-emerald-50/30 transition-all cursor-pointer group">
                        <Upload className="size-6 text-gray-400 group-hover:text-emerald-600 group-hover:scale-110 transition-transform mb-1.5" />
                        <span className="text-xs font-bold text-gray-700 group-hover:text-emerald-800">
                          Click to upload product image
                        </span>
                        <span className="text-[10px] text-gray-400 mt-0.5">PNG, JPG, WEBP, GIF up to 10MB</span>
                        <input
                          type="file"
                          accept="image/*"
                          className="hidden"
                          onChange={(e) => {
                            const file = e.target.files?.[0];
                            if (file) handleImageUpload(file);
                          }}
                        />
                      </label>
                    )}
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="name">Product Name *</Label>
                    <Input id="name" value={formData.name || ''} onChange={(e) => setFormData({ ...formData, name: e.target.value })} />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="sku">SKU *</Label>
                    <Input id="sku" value={formData.sku || ''} onChange={(e) => setFormData({ ...formData, sku: e.target.value })} />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="category">Category *</Label>
                    <Select
                      value={formData.category || ''}
                      onValueChange={(value) => {
                        setFormData({
                          ...formData,
                          category: value
                        });
                      }}
                    >
                      <SelectTrigger><SelectValue placeholder="Select category" /></SelectTrigger>
                      <SelectContent>
                        {categories.map(cat => (<SelectItem key={cat} value={cat}>{cat}</SelectItem>))}
                      </SelectContent>
                    </Select>
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="dispensingMethod">Dispensing Method *</Label>
                    <Select
                      value={formData.dispensingMethod || 'FEFO'}
                      onValueChange={(value: 'FEFO' | 'FIFO') => {
                        setFormData({
                          ...formData,
                          dispensingMethod: value,
                          expiryDate: value === 'FIFO' ? undefined : formData.expiryDate
                        });
                      }}
                    >
                      <SelectTrigger><SelectValue placeholder="Select method" /></SelectTrigger>
                      <SelectContent>
                        <SelectItem value="FEFO">FEFO (First Expired, First Out)</SelectItem>
                        <SelectItem value="FIFO">FIFO (First In, First Out - No Expiry)</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="quantity">Old Batch Qty *</Label>
                    <Input id="quantity" type="number" value={formData.quantity || ''} onChange={(e) => setFormData({ ...formData, quantity: Number(e.target.value) })} />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="expiryDate" className="flex items-center justify-between">
                      <span>Old Batch Expiry {formData.dispensingMethod === 'FIFO' ? '(N/A - FIFO)' : '*'}</span>
                      {formData.dispensingMethod === 'FIFO' && <span className="text-[9px] font-bold text-sky-600 bg-sky-50 px-1 rounded">Walang Expiry</span>}
                    </Label>
                    <Input
                      id="expiryDate"
                      type="date"
                      disabled={formData.dispensingMethod === 'FIFO'}
                      value={formData.dispensingMethod === 'FIFO' ? '' : (formData.expiryDate || '')}
                      onChange={(e) => setFormData({ ...formData, expiryDate: e.target.value })}
                      placeholder={formData.dispensingMethod === 'FIFO' ? 'No Expiry (FIFO)' : ''}
                    />
                  </div>
                  <div className="space-y-2 col-span-2">
                    <div className="flex items-center justify-between">
                      <Label htmlFor="batchNumber">Old Batch Number (Format: YYYYMMDD-SUPPLIER)</Label>
                      <span className="text-[10px] text-gray-400">Default: Today's Date</span>
                    </div>
                    <div className="flex gap-2">
                      <Input
                        id="batchNumber"
                        value={formData.batchNumber || ''}
                        placeholder={getTodayBatchCode(formData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH')}
                        onChange={(e) => setFormData({ ...formData, batchNumber: e.target.value })}
                        className="font-mono"
                      />
                      <Button
                        type="button"
                        variant="outline"
                        size="sm"
                        onClick={() => setFormData({ ...formData, batchNumber: getTodayBatchCode(formData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH') })}
                        className="text-xs shrink-0"
                      >
                        Auto-Format
                      </Button>
                    </div>
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="price">Selling Price (₱) *</Label>
                    <Input id="price" type="number" step="0.01" value={formData.price || ''} onChange={(e) => setFormData({ ...formData, price: Number(e.target.value) })} />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="cost">Cost Price (₱) *</Label>
                    <Input id="cost" type="number" step="0.01" value={formData.cost || ''} onChange={(e) => setFormData({ ...formData, cost: Number(e.target.value) })} />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="reorderLevel">Reorder Level *</Label>
                    <Input id="reorderLevel" type="number" value={formData.reorderLevel || ''} onChange={(e) => setFormData({ ...formData, reorderLevel: Number(e.target.value) })} />
                  </div>
                  <div className="space-y-2 col-span-2">
                    <Label htmlFor="description">Description</Label>
                    <Input id="description" value={formData.description || ''} onChange={(e) => setFormData({ ...formData, description: e.target.value })} />
                  </div>
                </div>
                <DialogFooter>
                  <Button variant="outline" onClick={() => { setIsAddDialogOpen(false); setFormData({}); }}>Cancel</Button>
                  <Button onClick={onTriggerAddConfirm}>Add Product</Button>
                </DialogFooter>
              </DialogContent>
            </Dialog>
          </div>
        </ErrorBoundary>

        <ErrorBoundary fallbackTitle="Inventory Table Error">
          <Card>
            {/* INLINE COMPACT DROPDOWN FILTERS (Matching user's requested segmented bar style) */}
            <CardContent className="p-3.5 border-b border-gray-100 bg-gray-50/40">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <div className="flex flex-wrap items-center gap-2.5">
                  {/* SEGMENTED DROPDOWNS BAR */}
                  <div className="inline-flex flex-wrap items-center rounded-lg border border-gray-200 bg-white shadow-2xs divide-x divide-gray-200 overflow-hidden">
                    {/* Category Dropdown */}
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <button
                          type="button"
                          className={cn(
                            "h-9 px-3.5 text-xs font-semibold flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-700 transition-colors focus:outline-none select-none",
                            filterCategory !== 'all' && "bg-green-50/90 text-green-900 font-bold hover:bg-green-100/80"
                          )}
                        >
                          <Package className={cn("size-3.5 shrink-0", filterCategory !== 'all' ? "text-green-600" : "text-gray-400")} />
                          <span>
                            {filterCategory === 'all' ? 'Category' : `Category: ${filterCategory}`}
                          </span>
                          {filterCategory === 'all' && (
                            <span className="text-[10px] text-gray-400 font-normal">({products.length})</span>
                          )}
                          <ChevronDown className={cn("size-3.5 shrink-0 opacity-60 ml-0.5", filterCategory !== 'all' && "text-green-700 opacity-100")} />
                        </button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent align="start" className="w-56 p-1 bg-white border border-gray-200 shadow-lg rounded-lg z-50">
                        <DropdownMenuLabel className="text-[10px] font-black uppercase text-gray-400 tracking-wider px-2 py-1.5">
                          Filter by Category
                        </DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuRadioGroup value={filterCategory} onValueChange={(val) => { setFilterCategory(val); setCurrentPage(1); }}>
                          <DropdownMenuRadioItem value="all" className="text-xs cursor-pointer py-2 font-medium">
                            All Categories ({products.length})
                          </DropdownMenuRadioItem>
                          {categories.map((cat) => {
                            const count = products.filter((p) => p.category === cat).length;
                            return (
                              <DropdownMenuRadioItem key={cat} value={cat} className="text-xs cursor-pointer py-2 font-medium">
                                {cat} ({count})
                              </DropdownMenuRadioItem>
                            );
                          })}
                        </DropdownMenuRadioGroup>
                      </DropdownMenuContent>
                    </DropdownMenu>

                    {/* Stock Status Dropdown */}
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <button
                          type="button"
                          className={cn(
                            "h-9 px-3.5 text-xs font-semibold flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-700 transition-colors focus:outline-none select-none",
                            filterStockStatus !== 'all' && "bg-green-50/90 text-green-900 font-bold hover:bg-green-100/80"
                          )}
                        >
                          <Layers className={cn("size-3.5 shrink-0", filterStockStatus !== 'all' ? "text-green-600" : "text-gray-400")} />
                          <span>
                            {filterStockStatus === 'all'
                              ? 'Stock Status'
                              : `Stock: ${filterStockStatus === 'in' ? 'In Stock' : filterStockStatus === 'low' ? 'Low Stock' : 'Out of Stock'}`}
                          </span>
                          <ChevronDown className={cn("size-3.5 shrink-0 opacity-60 ml-0.5", filterStockStatus !== 'all' && "text-green-700 opacity-100")} />
                        </button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent align="start" className="w-52 p-1 bg-white border border-gray-200 shadow-lg rounded-lg z-50">
                        <DropdownMenuLabel className="text-[10px] font-black uppercase text-gray-400 tracking-wider px-2 py-1.5">
                          Filter by Stock Status
                        </DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuRadioGroup value={filterStockStatus} onValueChange={(val) => { setFilterStockStatus(val); setCurrentPage(1); }}>
                          <DropdownMenuRadioItem value="all" className="text-xs cursor-pointer py-2 font-medium">
                            All Stock Levels
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="in" className="text-xs cursor-pointer py-2 font-medium">
                            In Stock
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="low" className="text-xs cursor-pointer py-2 font-medium">
                            Low Stock
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="out" className="text-xs cursor-pointer py-2 font-medium">
                            Out of Stock
                          </DropdownMenuRadioItem>
                        </DropdownMenuRadioGroup>
                      </DropdownMenuContent>
                    </DropdownMenu>

                    {/* Alphabetical Order Dropdown */}
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <button
                          type="button"
                          className={cn(
                            "h-9 px-3.5 text-xs font-semibold flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-700 transition-colors focus:outline-none select-none",
                            sortName !== 'none' && "bg-green-50/90 text-green-900 font-bold hover:bg-green-100/80"
                          )}
                        >
                          <ArrowDownAZ className={cn("size-3.5 shrink-0", sortName !== 'none' ? "text-green-600" : "text-gray-400")} />
                          <span>
                            {sortName === 'none' ? 'Alphabetical' : `Sort: ${sortName === 'a-z' ? 'A → Z' : 'Z → A'}`}
                          </span>
                          <ChevronDown className={cn("size-3.5 shrink-0 opacity-60 ml-0.5", sortName !== 'none' && "text-green-700 opacity-100")} />
                        </button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent align="start" className="w-52 p-1 bg-white border border-gray-200 shadow-lg rounded-lg z-50">
                        <DropdownMenuLabel className="text-[10px] font-black uppercase text-gray-400 tracking-wider px-2 py-1.5">
                          Alphabetical Sorting
                        </DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuRadioGroup
                          value={sortName}
                          onValueChange={(val: any) => {
                            setSortName(val);
                            setPrimarySort(val === 'none' ? (sortStock !== 'none' ? 'stock' : 'none') : 'name');
                            setCurrentPage(1);
                          }}
                        >
                          <DropdownMenuRadioItem value="none" className="text-xs cursor-pointer py-2 font-medium">
                            Default (Original Order)
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="a-z" className="text-xs cursor-pointer py-2 font-medium">
                            A → Z (Alphabetical)
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="z-a" className="text-xs cursor-pointer py-2 font-medium">
                            Z → A (Reverse Alphabetical)
                          </DropdownMenuRadioItem>
                        </DropdownMenuRadioGroup>
                      </DropdownMenuContent>
                    </DropdownMenu>

                    {/* Stock Level Order Dropdown */}
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <button
                          type="button"
                          className={cn(
                            "h-9 px-3.5 text-xs font-semibold flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-700 transition-colors focus:outline-none select-none",
                            sortStock !== 'none' && "bg-green-50/90 text-green-900 font-bold hover:bg-green-100/80"
                          )}
                        >
                          <ArrowUpDown className={cn("size-3.5 shrink-0", sortStock !== 'none' ? "text-green-600" : "text-gray-400")} />
                          <span>
                            {sortStock === 'none'
                              ? 'Stock Level Order'
                              : `Stock: ${sortStock === 'low-high' ? 'Lowest → Highest' : 'Highest → Lowest'}`}
                          </span>
                          <ChevronDown className={cn("size-3.5 shrink-0 opacity-60 ml-0.5", sortStock !== 'none' && "text-green-700 opacity-100")} />
                        </button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent align="start" className="w-56 p-1 bg-white border border-gray-200 shadow-lg rounded-lg z-50">
                        <DropdownMenuLabel className="text-[10px] font-black uppercase text-gray-400 tracking-wider px-2 py-1.5">
                          Stock Quantity Sorting
                        </DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuRadioGroup
                          value={sortStock}
                          onValueChange={(val: any) => {
                            setSortStock(val);
                            setPrimarySort(val === 'none' ? (sortName !== 'none' ? 'name' : 'none') : 'stock');
                            setCurrentPage(1);
                          }}
                        >
                          <DropdownMenuRadioItem value="none" className="text-xs cursor-pointer py-2 font-medium">
                            Default (Original Order)
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="low-high" className="text-xs cursor-pointer py-2 font-medium">
                            Lowest → Highest Stock
                          </DropdownMenuRadioItem>
                          <DropdownMenuRadioItem value="high-low" className="text-xs cursor-pointer py-2 font-medium">
                            Highest → Lowest Stock
                          </DropdownMenuRadioItem>
                        </DropdownMenuRadioGroup>
                      </DropdownMenuContent>
                    </DropdownMenu>
                  </div>

                  {/* Reset button if any filter/sort is active */}
                  {(filterCategory !== 'all' || filterStockStatus !== 'all' || sortName !== 'none' || sortStock !== 'none') && (
                    <Button
                      variant="ghost"
                      size="sm"
                      onClick={() => {
                        setFilterCategory('all');
                        setFilterStockStatus('all');
                        setSortName('none');
                        setSortStock('none');
                        setPrimarySort('none');
                        setCurrentPage(1);
                      }}
                      className="h-9 px-3 text-xs text-red-600 hover:text-red-700 hover:bg-red-50 font-bold gap-1.5"
                    >
                      <RotateCcw className="size-3.5" />
                      Reset Filters
                    </Button>
                  )}
                </div>
              </div>

              {/* Active Filter Indicators */}
              {(filterCategory !== 'all' || filterStockStatus !== 'all' || sortName !== 'none' || sortStock !== 'none' || searchQuery !== '') && (
                <div className="flex items-center gap-1.5 pt-3 mt-3 border-t border-gray-200/60 text-xs text-gray-500 flex-wrap">
                  <span className="font-semibold text-gray-400 text-[11px] uppercase tracking-wider">Active:</span>
                  {filterCategory !== 'all' && (
                    <Badge variant="outline" className="text-[10px] bg-green-50 text-green-700 border-green-200 font-semibold">
                      Category: {filterCategory}
                    </Badge>
                  )}
                  {filterStockStatus !== 'all' && (
                    <Badge variant="outline" className="text-[10px] bg-green-50 text-green-700 border-green-200 font-semibold">
                      Stock: {filterStockStatus === 'in' ? 'In Stock' : filterStockStatus === 'low' ? 'Low Stock' : 'Out of Stock'}
                    </Badge>
                  )}
                  {sortName !== 'none' && (
                    <Badge variant="outline" className="text-[10px] bg-green-50 text-green-700 border-green-200 font-semibold">
                      Alphabetical: {sortName === 'a-z' ? 'A → Z' : 'Z → A'}
                    </Badge>
                  )}
                  {sortStock !== 'none' && (
                    <Badge variant="outline" className="text-[10px] bg-green-50 text-green-700 border-green-200 font-semibold">
                      Stock Order: {sortStock === 'low-high' ? 'Lowest → Highest' : 'Highest → Lowest'}
                    </Badge>
                  )}
                  {searchQuery && (
                    <Badge variant="outline" className="text-[10px] bg-gray-100 text-gray-700 border-gray-300 font-semibold">
                      Search: "{searchQuery}"
                    </Badge>
                  )}
                </div>
              )}
            </CardContent>

            <CardHeader className="flex flex-row items-center justify-between space-y-0 p-6">
              <CardTitle className="flex items-center gap-2 text-lg font-bold">
                <Package className="size-5 text-gray-700" />
                Products ({filteredProducts.length})
              </CardTitle>
              <div className="max-w-xs relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 size-4 text-gray-400" />
                <Input
                  placeholder="Search products..."
                  value={searchQuery}
                  onChange={(e) => { setSearchQuery(e.target.value); setCurrentPage(1); }}
                  className="h-10 pl-10 bg-white border-gray-200"
                />
              </div>
            </CardHeader>
            <CardContent>
              <div className="overflow-x-auto w-full">
                <Table className="min-w-[800px]">
                  <TableHeader>
                    <TableRow className="bg-gray-50 border-b border-gray-200">
                      <TableHead
                        onClick={() => {
                          const next = sortName === 'a-z' ? 'z-a' : sortName === 'z-a' ? 'none' : 'a-z';
                          setSortName(next);
                          setPrimarySort(next === 'none' ? (sortStock !== 'none' ? 'stock' : 'none') : 'name');
                          setCurrentPage(1);
                        }}
                        className="px-6 py-4 font-bold text-gray-700 uppercase text-xs tracking-wider border-r border-gray-200 cursor-pointer hover:bg-gray-100/80 transition-colors select-none"
                        title="Click to sort by Name (A-Z / Z-A)"
                      >
                        <div className="flex items-center gap-1.5">
                          <span>Product Details</span>
                          {sortName === 'a-z' && <span className="text-green-600 font-bold text-[10px] flex items-center gap-0.5"><ArrowUp className="size-3" /> A-Z</span>}
                          {sortName === 'z-a' && <span className="text-green-600 font-bold text-[10px] flex items-center gap-0.5"><ArrowDown className="size-3" /> Z-A</span>}
                          {sortName === 'none' && <ArrowUpDown className="size-3 text-gray-400 opacity-60" />}
                        </div>
                      </TableHead>
                      <TableHead
                        onClick={() => {
                          const next = sortStock === 'low-high' ? 'high-low' : sortStock === 'high-low' ? 'none' : 'low-high';
                          setSortStock(next);
                          setPrimarySort(next === 'none' ? (sortName !== 'none' ? 'name' : 'none') : 'stock');
                          setCurrentPage(1);
                        }}
                        className="px-6 py-4 font-bold text-gray-700 uppercase text-xs tracking-wider border-r border-gray-200 text-center cursor-pointer hover:bg-gray-100/80 transition-colors select-none"
                        title="Click to sort by Stock Quantity (Lowest-Highest / Highest-Lowest)"
                      >
                        <div className="flex items-center justify-center gap-1.5">
                          <span>Old Batch</span>
                          {sortStock === 'low-high' && <span className="text-green-600 font-bold text-[10px] flex items-center gap-0.5"><ArrowUp className="size-3" /> Low</span>}
                          {sortStock === 'high-low' && <span className="text-green-600 font-bold text-[10px] flex items-center gap-0.5"><ArrowDown className="size-3" /> High</span>}
                          {sortStock === 'none' && <ArrowUpDown className="size-3 text-gray-400 opacity-60" />}
                        </div>
                      </TableHead>
                      <TableHead className="px-6 py-4 font-bold text-gray-700 uppercase text-xs tracking-wider border-r border-gray-200 text-center">New Batch</TableHead>
                      <TableHead className="px-6 py-4 font-bold text-gray-700 uppercase text-xs tracking-wider border-r border-gray-200">Price/Cost</TableHead>
                      <TableHead className="px-6 py-4 font-bold text-gray-700 uppercase text-xs tracking-wider border-r border-gray-200">Status</TableHead>
                      <TableHead className="px-6 py-4 font-bold text-gray-700 uppercase text-xs tracking-wider text-center">Actions</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody className="divide-y divide-gray-200">
                    {paginatedProducts.map((product) => {
                      const status = getStockStatus(product);
                      const isFIFO = product.dispensingMethod === 'FIFO';
                      return (
                        <TableRow key={product.id} className="hover:bg-gray-50/50 transition-colors">
                          <TableCell className="px-6 py-4 border-r border-gray-200">
                            <div className="flex flex-col min-w-0">
                              <div className="flex items-center gap-1.5 flex-wrap">
                                <span className="font-bold text-gray-900 truncate max-w-[280px]" title={product.name}>
                                  {product.name.replace(/\*/g, '')}
                                </span>
                                {isRxProduct(product) && (
                                  <span
                                    className="inline-flex items-center px-1.5 py-0.5 rounded text-[10px] font-black uppercase tracking-wider text-white shadow-xs"
                                    style={{ backgroundColor: '#dc2626', color: '#ffffff' }}
                                    title="Prescription Required (Rx)"
                                  >
                                    Rx
                                  </span>
                                )}
                              </div>
                              <div className="flex items-center gap-2 mt-1">
                                <span className="text-[10px] text-gray-400 font-black uppercase tracking-tighter bg-gray-100 px-1 rounded">{product.sku}</span>
                                <span className="text-[10px] text-blue-500 font-bold uppercase">{product.category}</span>
                                {isFIFO ? (
                                  <span className="text-[9px] font-black uppercase px-1.5 py-0.2 rounded bg-sky-100 text-sky-800 border border-sky-200" title="First In, First Out (Walang Expiration)">
                                    FIFO
                                  </span>
                                ) : (
                                  <span className="text-[9px] font-black uppercase px-1.5 py-0.2 rounded bg-emerald-100 text-emerald-800 border border-emerald-200" title="First Expired, First Out">
                                    FEFO
                                  </span>
                                )}
                              </div>
                            </div>
                          </TableCell>
                          <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                            {Number(product.quantity) <= 0 ? (
                              <div className="flex flex-col items-center justify-center">
                                <span className="text-md font-black text-red-600">-</span>
                              </div>
                            ) : (
                              <div className="flex flex-col items-center justify-center">
                                <span className={`text-md font-black ${!isFIFO && isDateExpired(product.expiryDate) ? 'text-red-600' : 'text-gray-900'}`}>{product.quantity}</span>
                                {isFIFO ? (
                                  <span className="text-[9px] font-bold uppercase text-sky-700 bg-sky-50 px-1.5 py-0.5 rounded border border-sky-200 mt-0.5">No Expiry (FIFO)</span>
                                ) : (
                                  <span className={`text-[9px] font-bold uppercase ${isDateExpired(product.expiryDate) ? 'text-red-500 font-black' : 'text-gray-400'}`}>EXP: {product.expiryDate || 'N/A'}</span>
                                )}
                                {product.batchNumber && (
                                  <span className="text-[9px] font-mono font-bold text-gray-600 bg-gray-100 px-1.5 py-0.5 rounded mt-1 border border-gray-200 shadow-2xs">
                                    {product.batchNumber}
                                  </span>
                                )}
                              </div>
                            )}
                          </TableCell>
                          <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                            {(() => {
                              const queueBatches = Array.isArray(product.newBatchQueue) ? product.newBatchQueue : [];
                              const queueTotalQty = queueBatches.reduce((acc, b) => acc + Number(b.quantity || 0), 0);
                              const effectiveNewQty = Number(product.newStockQuantity || 0) > 0 ? Number(product.newStockQuantity) : queueTotalQty;
                              const effectiveNewExpiry = isFIFO ? null : (product.newStockExpiry || (queueBatches.find(b => b.expiryDate)?.expiryDate));

                              if (effectiveNewQty <= 0) {
                                return <span className="text-[10px] text-gray-400 font-bold">-</span>;
                              }

                              const defaultSup = product.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH';
                              const defaultCode = formatBatchCode(undefined, defaultSup);
                              const firstBatchCode = (queueBatches[0]?.batchNumber && !queueBatches[0].batchNumber.startsWith('20261014-'))
                                ? queueBatches[0].batchNumber
                                : (product.batchNumber && !product.batchNumber.startsWith('20261014-') ? product.batchNumber : defaultCode);

                              return (
                                <div className="flex flex-col items-center justify-center">
                                  <span className={`text-sm font-black ${!isFIFO && isDateExpired(effectiveNewExpiry) ? 'text-red-600' : 'text-blue-800'}`}>{effectiveNewQty}</span>
                                  {isFIFO ? (
                                    <span className="text-[9px] font-bold uppercase text-sky-700 bg-sky-50 px-1.5 py-0.5 rounded border border-sky-200 mt-0.5">No Expiry (FIFO)</span>
                                  ) : (
                                    <span className={`text-[9px] font-bold uppercase ${isDateExpired(effectiveNewExpiry) ? 'text-red-500 font-black' : 'text-gray-400'}`}>EXP: {effectiveNewExpiry || 'N/A'}</span>
                                  )}
                                  {queueBatches.length > 1 ? (
                                    <Button
                                      variant="ghost"
                                      size="sm"
                                      onClick={() => setViewingQueueProduct(product)}
                                      className="h-5 px-1.5 py-0 text-[10px] font-black text-blue-700 bg-blue-100 hover:bg-blue-200 rounded mt-1 flex items-center gap-1 border border-blue-200 cursor-pointer shadow-xs"
                                      title="Click to view all queued batches"
                                    >
                                      <Layers className="size-3 text-blue-600" />
                                      {queueBatches.length} Batches ▾
                                    </Button>
                                  ) : (
                                    <button
                                      type="button"
                                      onClick={() => setViewingQueueProduct(product)}
                                      className="text-[9px] font-mono font-bold text-blue-700 bg-blue-50 hover:bg-blue-100 px-1.5 py-0.5 rounded mt-1 border border-blue-200 tracking-tight transition-colors cursor-pointer truncate max-w-[140px]"
                                      title="Click to inspect batch details"
                                    >
                                      {firstBatchCode}
                                    </button>
                                  )}
                                </div>
                              );
                            })()}
                          </TableCell>
                          <TableCell className="px-6 py-4 border-r border-gray-200 text-sm">
                            <div className="flex flex-col">
                              <span className="font-bold text-green-700">₱{product.price.toFixed(2)}</span>
                              <span className="text-[10px] text-gray-400 font-bold italic">Cost: ₱{product.cost.toFixed(2)}</span>
                            </div>
                          </TableCell>
                          <TableCell className="px-6 py-4 border-r border-gray-200">
                            <Badge className={`${status.color} border-none font-black text-[10px] uppercase tracking-widest leading-none`}>{status.label}</Badge>
                          </TableCell>
                          <TableCell className="px-6 py-4 text-center">
                            <div className="flex items-center justify-center gap-1.5">
                              <Button variant="ghost" size="sm" onClick={() => setProductToAuthEdit(product)} className="h-8 w-8 p-0" title="Edit Product (Requires Owner Passcode)">
                                <Edit className="size-4 text-blue-600" />
                              </Button>
                              <Button variant="ghost" size="sm" onClick={() => setProductToAuthDelete(product)} className="h-8 w-8 p-0" title="Delete Product (Requires Owner Passcode)">
                                <Trash2 className="size-4 text-red-600" />
                              </Button>
                            </div>
                          </TableCell>
                        </TableRow>
                      );
                    })}
                    {filteredProducts.length === 0 && (
                      <TableRow>
                        <TableCell colSpan={7} className="text-center py-8 text-gray-500">No products found</TableCell>
                      </TableRow>
                    )}
                  </TableBody>
                </Table>
              </div>
            </CardContent>
            <div className="bg-gray-50 border-t border-gray-200 px-6 py-4 flex flex-col sm:flex-row items-center justify-between gap-4 rounded-b-xl">
              <div className="text-sm text-gray-500 font-medium">
                Showing <span className="text-gray-900 font-bold">{filteredProducts.length === 0 ? 0 : startIndex + 1}</span> to <span className="text-gray-900 font-bold">{Math.min(startIndex + itemsPerPage, filteredProducts.length)}</span> of <span className="text-gray-900 font-bold">{filteredProducts.length}</span> products
              </div>
              <div className="flex items-center gap-2">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                  disabled={currentPage === 1}
                  className="bg-white border-gray-200 hover:bg-gray-100 disabled:opacity-50"
                >
                  <ChevronLeft className="size-4 mr-1" />
                  Previous
                </Button>
                <div className="flex items-center gap-1 hidden sm:flex">
                  {(() => {
                    const pages = [];
                    let start = Math.max(1, currentPage - 1);
                    if (start + 2 > totalPages) start = Math.max(1, totalPages - 2);
                    let end = Math.min(totalPages, start + 2);

                    for (let i = start; i <= end; i++) {
                      pages.push(i);
                    }

                    return (
                      <>
                        {start > 1 && <span className="text-gray-400 px-1">...</span>}
                        {pages.map(page => (
                          <Button
                            key={page}
                            variant={currentPage === page ? "default" : "outline"}
                            size="sm"
                            onClick={() => setCurrentPage(page)}
                            className={`size-8 p-0 font-bold ${currentPage === page ? "bg-gray-900 text-white" : "bg-white border-gray-200"}`}
                          >
                            {page}
                          </Button>
                        ))}
                        {end < totalPages && <span className="text-gray-400 px-1">...</span>}
                      </>
                    );
                  })()}
                </div>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                  disabled={currentPage >= totalPages}
                  className="bg-white border-gray-200 hover:bg-gray-100 disabled:opacity-50"
                >
                  Next
                  <ChevronRight className="size-4 ml-1" />
                </Button>
              </div>
            </div>
          </Card>
        </ErrorBoundary>

        {/* Edit Dialog */}
        <ErrorBoundary fallbackTitle="Edit Dialog Error">
          <Dialog open={isEditDialogOpen} onOpenChange={setIsEditDialogOpen}>
            <DialogContent
              className="max-w-6xl w-[96vw] max-h-[96vh] overflow-y-auto p-4 sm:p-5 bg-white rounded-2xl shadow-2xl"
              style={{ maxWidth: '1120px', width: '96vw' }}
            >
              <DialogHeader className="pb-2 border-b border-gray-100 flex flex-row items-center justify-between">
                <div>
                  <DialogTitle className="text-lg font-black text-gray-900 flex items-center gap-2">
                    <Package className="size-4.5 text-blue-600" />
                    Edit Product & Batches
                  </DialogTitle>
                  <DialogDescription className="text-xs text-gray-500 mt-0.5">
                    Product details on the left, and New Batch Restocking Queue on the right side.
                  </DialogDescription>
                </div>
                <div className="flex items-center gap-2">
                  <Badge variant="outline" className="font-mono text-xs font-bold text-gray-600 bg-gray-50">
                    SKU: {formData.sku || editingProduct?.sku}
                  </Badge>
                  <Badge className="bg-blue-100 text-blue-800 border-none text-xs font-bold">
                    {formData.category || editingProduct?.category}
                  </Badge>
                </div>
              </DialogHeader>

              <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 py-2.5 items-stretch">
                {/* LEFT COLUMN: Product Details & Old Batch (6 cols) */}
                <div className="lg:col-span-6 flex flex-col gap-2.5">
                  {/* Product Info Card */}
                  <div className="p-3 bg-gray-50/80 border border-gray-200 rounded-xl space-y-2 shadow-2xs">
                    <div className="text-xs font-black text-gray-800 uppercase tracking-wider flex items-center gap-1.5 pb-1 border-b border-gray-200">
                      <Package className="size-3.5 text-gray-600" /> Product Information
                    </div>
                    <div className="space-y-1">
                      <Label htmlFor="edit-name" className="text-[11px] font-bold text-gray-700">Product Name *</Label>
                      <Input id="edit-name" value={formData.name || ''} onChange={(e) => setFormData({ ...formData, name: e.target.value })} className="h-8 text-xs bg-white font-medium" />
                    </div>
                    <div className="grid grid-cols-2 gap-2.5">
                      <div className="space-y-1">
                        <Label htmlFor="edit-sku" className="text-[11px] font-bold text-gray-700">SKU Code *</Label>
                        <Input id="edit-sku" value={formData.sku || ''} onChange={(e) => setFormData({ ...formData, sku: e.target.value })} className="h-8 text-xs bg-white font-mono" />
                      </div>
                      <div className="space-y-1">
                        <Label htmlFor="edit-category" className="text-[11px] font-bold text-gray-700">Category *</Label>
                        <Select
                          value={formData.category || ''}
                          onValueChange={(value) => {
                            setFormData({
                              ...formData,
                              category: value
                            });
                          }}
                        >
                          <SelectTrigger className="h-8 text-xs bg-white"><SelectValue /></SelectTrigger>
                          <SelectContent>
                            {categories.map(cat => (<SelectItem key={cat} value={cat}>{cat}</SelectItem>))}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-2.5">
                      <div className="space-y-1">
                        <Label htmlFor="edit-dispensingMethod" className="text-[11px] font-bold text-gray-700">Dispensing Method *</Label>
                        <Select
                          value={formData.dispensingMethod || 'FEFO'}
                          onValueChange={(value: 'FEFO' | 'FIFO') => {
                            setFormData({
                              ...formData,
                              dispensingMethod: value,
                              expiryDate: value === 'FIFO' ? undefined : formData.expiryDate
                            });
                          }}
                        >
                          <SelectTrigger className="h-8 text-xs bg-white"><SelectValue placeholder="Select method" /></SelectTrigger>
                          <SelectContent>
                            <SelectItem value="FEFO">FEFO (First Expired, First Out)</SelectItem>
                            <SelectItem value="FIFO">FIFO (First In, First Out - No Expiry)</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>
                      <div className="space-y-1">
                        <Label htmlFor="edit-reorderLevel" className="text-[11px] font-bold text-gray-700">Reorder Level *</Label>
                        <Input id="edit-reorderLevel" type="number" value={formData.reorderLevel || ''} onChange={(e) => setFormData({ ...formData, reorderLevel: Number(e.target.value) })} className="h-8 text-xs bg-white" />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-2.5">
                      <div className="space-y-1">
                        <Label htmlFor="edit-price" className="text-[11px] font-bold text-gray-700">Selling Price (₱) *</Label>
                        <Input id="edit-price" type="number" step="0.01" value={formData.price || ''} onChange={(e) => setFormData({ ...formData, price: Number(e.target.value) })} className="h-8 text-xs bg-white font-bold text-green-700" />
                      </div>
                      <div className="space-y-1">
                        <Label htmlFor="edit-cost" className="text-[11px] font-bold text-gray-700">Cost Price (₱) *</Label>
                        <Input id="edit-cost" type="number" step="0.01" value={formData.cost || ''} onChange={(e) => setFormData({ ...formData, cost: Number(e.target.value) })} className="h-8 text-xs bg-white" />
                      </div>
                    </div>
                    <div className="space-y-1">
                      <Label htmlFor="edit-description" className="text-[11px] font-bold text-gray-700">Description</Label>
                      <Input id="edit-description" value={formData.description || ''} onChange={(e) => setFormData({ ...formData, description: e.target.value })} className="h-8 text-xs bg-white" placeholder="Optional details..." />
                    </div>

                    {/* Product Image Attachment */}
                    <div className="space-y-1 pt-1.5 border-t border-gray-200">
                      <Label className="text-[11px] font-bold text-gray-700 flex items-center justify-between">
                        <span className="flex items-center gap-1.5">
                          <ImageIcon className="size-3.5 text-emerald-600" /> Attached Image (POS & Inventory)
                        </span>
                        {isUploadingImage && <span className="text-[10px] text-blue-600 animate-pulse font-medium">Uploading...</span>}
                      </Label>
                      {formData.imageUrl ? (
                        <div className="flex items-center gap-2.5 p-2 bg-emerald-50/60 border border-emerald-200 rounded-lg">
                          <div className="size-11 rounded bg-white border border-emerald-200 p-0.5 flex items-center justify-center overflow-hidden shrink-0 shadow-2xs">
                            <img src={formData.imageUrl} alt="Product Preview" className="size-full object-contain mix-blend-multiply" />
                          </div>
                          <div className="flex-1 min-w-0">
                            <p className="text-[11px] font-bold text-emerald-900 truncate">Image Attached</p>
                            <p className="text-[9px] text-emerald-700 truncate font-mono">{formData.imageUrl}</p>
                          </div>
                          <label className="cursor-pointer px-2 py-1 text-[10px] font-bold bg-white text-gray-700 border border-gray-300 rounded hover:bg-gray-50 transition-colors shadow-2xs">
                            Change
                            <input
                              type="file"
                              accept="image/*"
                              className="hidden"
                              onChange={(e) => {
                                const file = e.target.files?.[0];
                                if (file) handleImageUpload(file);
                              }}
                            />
                          </label>
                          <Button
                            type="button"
                            variant="ghost"
                            size="sm"
                            onClick={() => setFormData({ ...formData, imageUrl: undefined })}
                            className="h-6 w-6 p-0 text-red-600 hover:text-red-700 hover:bg-red-50"
                          >
                            <X className="size-3.5" />
                          </Button>
                        </div>
                      ) : (
                        <label className="flex items-center justify-center gap-2 p-2 border border-dashed border-gray-300 hover:border-emerald-500 rounded-lg bg-white hover:bg-emerald-50/20 transition-all cursor-pointer group">
                          <Upload className="size-3.5 text-gray-400 group-hover:text-emerald-600 transition-colors" />
                          <span className="text-[11px] font-semibold text-gray-600 group-hover:text-emerald-800">
                            Click to upload product image (PNG, JPG, WEBP)
                          </span>
                          <input
                            type="file"
                            accept="image/*"
                            className="hidden"
                            onChange={(e) => {
                              const file = e.target.files?.[0];
                              if (file) handleImageUpload(file);
                            }}
                          />
                        </label>
                      )}
                    </div>
                  </div>

                  {/* Old Batch Card (Editable) */}
                  <div className="p-3 bg-amber-50/70 border border-amber-200 rounded-xl space-y-2 shadow-2xs">
                    <div className="flex items-center justify-between pb-1 border-b border-amber-200">
                      <div className="text-xs font-black text-amber-900 uppercase tracking-wider flex items-center gap-1.5">
                        <Boxes className="size-3.5 text-amber-700" /> Old Batch (Active Stock in POS)
                      </div>
                      <div className="flex items-center gap-1.5">
                        <span className="inline-flex items-center gap-1 text-[10px] font-black text-amber-800 bg-amber-100/90 border border-amber-300 px-2 py-0.5 rounded shadow-2xs">
                          <Edit className="size-3 text-amber-700" /> Editable Primary Stock
                        </span>
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-2.5">
                      <div className="space-y-1">
                        <Label htmlFor="edit-old-qty" className="text-[11px] font-bold text-gray-700">Old Batch Quantity *</Label>
                        <Input
                          id="edit-old-qty"
                          type="number"
                          min="0"
                          value={formData.quantity !== undefined && formData.quantity !== null ? formData.quantity : ''}
                          onChange={(e) => setFormData({
                            ...formData,
                            quantity: e.target.value === '' ? ('' as any) : Math.max(0, parseInt(e.target.value, 10) || 0)
                          })}
                          className="h-8 text-xs bg-white font-bold text-gray-900 border-amber-300 focus-visible:ring-amber-500"
                          placeholder="e.g. 100"
                        />
                      </div>
                      <div className="space-y-1">
                        <Label htmlFor="edit-old-expiry" className="text-[11px] font-bold text-gray-700">
                          Old Batch Expiry {formData.dispensingMethod === 'FIFO' ? '(N/A - FIFO)' : '*'}
                        </Label>
                        {formData.dispensingMethod === 'FIFO' ? (
                          <div className="h-8 px-2.5 py-1 bg-amber-100/40 border border-amber-200/80 rounded-md flex items-center justify-between select-none text-xs font-bold text-sky-800">
                            <span>No Expiry (FIFO)</span>
                            <span className="text-[9px] font-black uppercase text-sky-700 bg-sky-100 px-1.5 py-0.5 rounded border border-sky-200">FIFO</span>
                          </div>
                        ) : (
                          <Input
                            id="edit-old-expiry"
                            type="date"
                            value={formData.expiryDate ? formData.expiryDate.slice(0, 10) : ''}
                            onChange={(e) => setFormData({ ...formData, expiryDate: e.target.value })}
                            className="h-8 text-xs bg-white font-medium border-amber-300 focus-visible:ring-amber-500"
                          />
                        )}
                      </div>
                    </div>
                    <div className="space-y-1">
                      <div className="flex items-center justify-between">
                        <Label htmlFor="edit-old-batch" className="text-[11px] font-bold text-gray-700">Old Batch Number / Code *</Label>
                        <span className="text-[10px] text-amber-800 font-medium">Active in POS system</span>
                      </div>
                      <Input
                        id="edit-old-batch"
                        type="text"
                        value={formData.batchNumber || ''}
                        onChange={(e) => setFormData({ ...formData, batchNumber: e.target.value.toUpperCase() })}
                        className="h-8 text-xs bg-white font-mono font-bold text-blue-900 border-amber-300 focus-visible:ring-amber-500"
                        placeholder="e.g. 20261018-UNILAB"
                      />
                    </div>
                    <div className="text-[10px] text-amber-900/90 bg-amber-100/60 p-1.5 rounded-lg border border-amber-200 flex items-center gap-1.5 leading-tight">
                      <Edit className="size-3 text-amber-700 shrink-0" />
                      <span>Maaari nang i-edit ang Old Batch details (quantity, expiry date, o batch code) kung nagkaroon ng pagkakamali.</span>
                    </div>
                  </div>
                </div>

                {/* RIGHT COLUMN (NASA GILID): New Batch Queue & Restocking (6 cols - Stretched to align with Old Batch) */}
                <div className="lg:col-span-6 flex flex-col">
                  <div className="h-full p-3.5 bg-blue-50/80 border-2 border-blue-200 rounded-xl flex flex-col justify-between shadow-xs">
                    <div>
                      <div className="flex flex-wrap items-center justify-between gap-2 pb-1.5 border-b border-blue-200">
                        <div className="text-xs font-black text-blue-950 uppercase tracking-wider flex items-center gap-1.5 shrink-0">
                          <Layers className="size-4 text-blue-600" /> New Batch Queue & Restocking
                        </div>
                        <Badge className="bg-blue-600 text-white font-black text-xs px-2.5 py-0.5 shadow-2xs shrink-0 whitespace-nowrap">
                          Total in Queue: {Number(formData.newStockQuantity || 0)} pcs
                        </Badge>
                      </div>

                      {/* Queued batches list */}
                      <div className="mt-1.5">
                        <div className="flex items-center justify-between mb-1">
                          <span className="text-[11px] font-black uppercase text-blue-900 tracking-wider">
                            Waiting in Queue ({Array.isArray(formData.newBatchQueue) ? formData.newBatchQueue.length : 0} batches)
                          </span>
                          <span className="text-[10px] text-gray-500 font-medium">Automatic FEFO/FIFO Depletion</span>
                        </div>

                        {Array.isArray(formData.newBatchQueue) && formData.newBatchQueue.length > 0 ? (
                          <div className="bg-white rounded-xl border border-blue-200 overflow-hidden divide-y divide-gray-100 max-h-[120px] overflow-y-auto shadow-2xs">
                            <div className="bg-blue-100/70 px-3 py-1 text-[10px] font-black uppercase text-blue-900 grid grid-cols-12 gap-1.5 sticky top-0 z-10">
                              <span className="col-span-1">#</span>
                              <span className="col-span-4">Batch Number</span>
                              <span className="col-span-2 text-center">Qty</span>
                              <span className="col-span-2 text-center">Arrived</span>
                              <span className="col-span-2 text-center">Expiry</span>
                              <span className="col-span-1 text-right">Del</span>
                            </div>
                            {formData.newBatchQueue.map((b, idx) => (
                              <div key={idx} className="px-3 py-1.5 text-xs grid grid-cols-12 gap-1.5 items-center hover:bg-blue-50/40">
                                <span className="col-span-1 font-bold text-gray-400">#{idx + 1}</span>
                                <span className="col-span-4 font-mono font-bold text-blue-900 truncate" title={b.batchNumber}>{b.batchNumber}</span>
                                <span className="col-span-2 text-center font-black text-gray-800">{b.quantity} pcs</span>
                                <span className="col-span-2 text-center text-[10px] font-medium text-gray-500 truncate" title={b.arrivalDate || 'N/A'}>{b.arrivalDate ? b.arrivalDate.slice(5) : 'N/A'}</span>
                                <span className="col-span-2 text-center text-[10px] font-medium text-gray-600 truncate" title={b.expiryDate || 'N/A'}>{b.expiryDate || 'N/A'}</span>
                                <div className="col-span-1 text-right">
                                  <button
                                    type="button"
                                    className="h-6 w-6 inline-flex items-center justify-center text-red-500 hover:text-red-700 hover:bg-red-50 rounded cursor-pointer transition-colors"
                                    onClick={() => {
                                      const q = [...(formData.newBatchQueue || [])];
                                      q.splice(idx, 1);
                                      const tot = q.reduce((s, itm) => s + Number(itm.quantity || 0), 0);
                                      const expArr = q.map(itm => itm.expiryDate).filter(Boolean) as string[];
                                      setFormData({
                                        ...formData,
                                        newBatchQueue: q,
                                        newStockQuantity: tot,
                                        newStockExpiry: expArr.length > 0 ? expArr.sort()[0] : undefined
                                      });
                                      toast.info(`Removed batch ${b.batchNumber} from queue`);
                                    }}
                                    title="Remove this batch"
                                  >
                                    <Trash2 className="size-3.5" />
                                  </button>
                                </div>
                              </div>
                            ))}
                          </div>
                        ) : (
                          <div className="p-2 text-center text-xs text-gray-500 bg-white rounded-xl border border-dashed border-blue-200">
                            No incoming batches in queue. Fill out the form below to add.
                          </div>
                        )}
                      </div>
                    </div>

                    {/* Add / Restock Batch Form - Flex stretched */}
                    <div className="p-3 bg-white border border-blue-200 rounded-xl flex-1 flex flex-col justify-between gap-2 shadow-2xs mt-2">
                      <div className="flex items-center justify-between pb-1 border-b border-gray-100">
                        <span className="text-[11px] font-black text-blue-800 uppercase tracking-wider flex items-center gap-1">
                          <Plus className="size-3.5 text-blue-600" /> Add Incoming Restock Batch
                        </span>
                        <span className="text-[9px] font-semibold text-gray-400">Same batch # auto-accumulates</span>
                      </div>

                      {/* Row 1: Arrival Date + Supplier */}
                      <div className="grid grid-cols-2 gap-2.5">
                        <div className="space-y-1">
                          <Label htmlFor="incoming-arrival" className="text-[10px] font-bold text-gray-700 flex items-center justify-between">
                            <span>Arrival Date (Dumating) *</span>
                          </Label>
                          <Input
                            id="incoming-arrival"
                            type="date"
                            value={incomingBatchArrivalDate}
                            onChange={(e) => {
                              const newDate = e.target.value;
                              setIncomingBatchArrivalDate(newDate);
                              setIncomingBatchNumber(formatBatchCode(newDate, incomingBatchSupplier));
                            }}
                            className="h-8 text-xs bg-gray-50/50"
                          />
                        </div>

                        <div className="space-y-1">
                          <Label htmlFor="incoming-supplier" className="text-[10px] font-bold text-gray-700">Supplier *</Label>
                          <Input
                            id="incoming-supplier"
                            value={incomingBatchSupplier}
                            placeholder="e.g. UNILAB"
                            onChange={(e) => {
                              const newSup = e.target.value.toUpperCase();
                              setIncomingBatchSupplier(newSup);
                              setIncomingBatchNumber(formatBatchCode(incomingBatchArrivalDate, newSup));
                            }}
                            className="h-8 text-xs uppercase font-bold bg-gray-50/50"
                          />
                        </div>
                      </div>

                      {/* Row 2: Incoming Qty + Expiry Date */}
                      <div className="grid grid-cols-2 gap-2.5">
                        <div className="space-y-1">
                          <Label htmlFor="incoming-qty" className="text-[10px] font-bold text-gray-700">Incoming Quantity *</Label>
                          <Input
                            id="incoming-qty"
                            type="number"
                            placeholder="e.g. 200"
                            value={incomingBatchQty}
                            onChange={(e) => setIncomingBatchQty(e.target.value === '' ? '' : Number(e.target.value))}
                            className="h-8 text-xs font-bold bg-gray-50/50"
                          />
                        </div>
                        <div className="space-y-1">
                          <Label htmlFor="incoming-exp" className="text-[10px] font-bold text-gray-700 flex items-center justify-between">
                            <span>Expiry Date {formData.dispensingMethod === 'FIFO' ? '(N/A - FIFO)' : ''}</span>
                            {formData.dispensingMethod === 'FIFO' && <span className="text-[9px] text-sky-600 font-bold">Walang Expiry</span>}
                          </Label>
                          <Input
                            id="incoming-exp"
                            type="date"
                            disabled={formData.dispensingMethod === 'FIFO'}
                            value={formData.dispensingMethod === 'FIFO' ? '' : incomingBatchExp}
                            placeholder={formData.dispensingMethod === 'FIFO' ? 'No Expiry (FIFO)' : ''}
                            onChange={(e) => setIncomingBatchExp(e.target.value)}
                            className="h-8 text-xs bg-gray-50/50"
                          />
                        </div>
                      </div>

                      {/* Row 3: Generated Batch Number Preview */}
                      <div className="space-y-1">
                        <div className="flex items-center justify-between">
                          <Label htmlFor="incoming-batch" className="text-[10px] font-bold text-gray-700">
                            Batch Code (Format: YYYYMMDD-Supplier)
                          </Label>
                          <span className="text-[9px] text-blue-600 font-bold">Auto-generated from arrival date</span>
                        </div>
                        <Input
                          id="incoming-batch"
                          placeholder="YYYYMMDD-SUPPLIER"
                          value={incomingBatchNumber}
                          onChange={(e) => setIncomingBatchNumber(e.target.value.toUpperCase())}
                          className="h-8 text-xs font-mono font-bold text-blue-900 bg-blue-50/30 border-blue-200"
                        />
                      </div>

                      {/* Row 4: Quick Supplier Chips */}
                      <div className="flex flex-wrap items-center gap-1 pt-0.5">
                        <span className="text-[9px] font-bold text-gray-400 mr-1">Quick Supplier:</span>
                        {QUICK_SUPPLIERS.map((sup) => (
                          <button
                            key={sup}
                            type="button"
                            onClick={() => {
                              setIncomingBatchSupplier(sup);
                              setIncomingBatchNumber(formatBatchCode(incomingBatchArrivalDate, sup));
                            }}
                            className={`text-[9px] font-black px-1.5 py-0.5 rounded border transition-colors cursor-pointer ${
                              incomingBatchSupplier === sup
                                ? 'bg-blue-600 text-white border-blue-600'
                                : 'bg-gray-100 text-gray-700 border-gray-200 hover:bg-gray-200'
                            }`}
                          >
                            {sup}
                          </button>
                        ))}
                      </div>

                      {/* Action Button: Queue Batch */}
                      <div className="pt-0.5">
                        <Button
                          type="button"
                          size="sm"
                          onClick={handleAddBatchToQueue}
                          className="w-full h-8.5 bg-blue-700 hover:bg-blue-800 text-white text-xs font-bold flex items-center justify-center gap-1.5 cursor-pointer shadow-xs"
                        >
                          <Plus className="size-3.5" />
                          Queue This Batch (Auto-accumulate if same batch #)
                        </Button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              {/* DIALOG FOOTER: Balanced and aligned at the bottom across full width */}
              <DialogFooter className="pt-2.5 border-t border-gray-100 flex flex-col sm:flex-row items-center justify-between gap-3">
                <div className="text-xs text-gray-600 flex items-center gap-2">
                  <span className="font-bold text-amber-800 bg-amber-100 px-2 py-0.5 rounded text-[11px]">
                    Old Batch: {formData.quantity || 0}
                  </span>
                  <span className="text-gray-400 font-bold">+</span>
                  <span className="font-bold text-blue-800 bg-blue-100 px-2 py-0.5 rounded text-[11px]">
                    New Batch Queue: {formData.newStockQuantity || 0}
                  </span>
                  <span className="text-gray-400 font-bold">=</span>
                  <span className="font-black text-gray-900 bg-gray-100 border border-gray-200 px-2 py-0.5 rounded text-[11px]">
                    Total: {Number(formData.quantity || 0) + Number(formData.newStockQuantity || 0)} units
                  </span>
                </div>
                <div className="flex items-center gap-2">
                  <Button
                    type="button"
                    variant="outline"
                    onClick={() => { setIsEditDialogOpen(false); setFormData({}); setEditingProduct(null); }}
                    className="h-8 px-4 text-xs font-semibold cursor-pointer"
                  >
                    Cancel
                  </Button>
                  <Button
                    type="button"
                    onClick={() => setShowSaveConfirm(true)}
                    className="h-8 px-5 bg-blue-700 hover:bg-blue-800 text-white font-bold text-xs cursor-pointer shadow-xs"
                  >
                    Save Changes
                  </Button>
                </div>
              </DialogFooter>
            </DialogContent>
          </Dialog>
        </ErrorBoundary>

        {/* Confirm Add New Product Dialog */}
        <AlertDialog open={showAddConfirm} onOpenChange={setShowAddConfirm}>
          <AlertDialogContent className="max-w-md bg-white border-0 shadow-2xl p-6 rounded-2xl">
            <AlertDialogHeader className="flex flex-col items-center text-center">
              <div className="size-14 rounded-full bg-emerald-100 flex items-center justify-center mb-3">
                <Package className="size-7 text-emerald-600" />
              </div>
              <AlertDialogTitle className="text-xl font-black text-gray-900">
                Confirm Add New Product?
              </AlertDialogTitle>
              <AlertDialogDescription className="text-sm text-gray-600 mt-2">
                Are you sure you want to add{' '}
                <span className="font-bold text-gray-900">"{formData.name}"</span> to the inventory?
              </AlertDialogDescription>
            </AlertDialogHeader>

            <div className="bg-emerald-50/60 border border-emerald-100 rounded-xl p-3.5 my-3 text-xs text-gray-700 space-y-1.5">
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Product Name:</span>
                <span className="font-bold text-gray-900">{formData.name}</span>
              </div>
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Category:</span>
                <span className="font-bold text-gray-900">{formData.category}</span>
              </div>
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">SKU:</span>
                <span className="font-bold text-gray-900">{formData.sku}</span>
              </div>
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Selling Price:</span>
                <span className="font-bold text-gray-900">₱{Number(formData.price || 0).toFixed(2)}</span>
              </div>
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Initial Quantity:</span>
                <span className="font-bold text-gray-900">{formData.quantity} units</span>
              </div>
              {formData.expiryDate && (
                <div className="flex justify-between">
                  <span className="font-medium text-gray-500">Expiry Date:</span>
                  <span className="font-bold text-gray-900">{formData.expiryDate}</span>
                </div>
              )}
            </div>

            <AlertDialogFooter className="flex gap-2 sm:gap-3 mt-4">
              <AlertDialogCancel
                onClick={() => setShowAddConfirm(false)}
                className="flex-1 font-bold rounded-xl"
              >
                Cancel
              </AlertDialogCancel>
              <AlertDialogAction
                onClick={() => {
                  setShowAddConfirm(false);
                  handleAddProduct();
                }}
                className="flex-1 bg-emerald-600 hover:bg-emerald-700 text-white font-bold rounded-xl"
              >
                Yes, Add Product
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>

        {/* Confirm Save Changes Dialog */}
        <AlertDialog open={showSaveConfirm} onOpenChange={setShowSaveConfirm}>
          <AlertDialogContent className="max-w-md bg-white border-0 shadow-2xl p-6 rounded-2xl">
            <AlertDialogHeader className="flex flex-col items-center text-center">
              <div className="size-14 rounded-full bg-indigo-100 flex items-center justify-center mb-3">
                <Package className="size-7 text-indigo-600" />
              </div>
              <AlertDialogTitle className="text-xl font-black text-gray-900">
                Save Product Changes?
              </AlertDialogTitle>
              <AlertDialogDescription className="text-sm text-gray-600 mt-2">
                Are you sure you want to save changes for{' '}
                <span className="font-bold text-gray-900">"{formData.name || editingProduct?.name}"</span>?
              </AlertDialogDescription>
            </AlertDialogHeader>

            <div className="bg-indigo-50/60 border border-indigo-100 rounded-xl p-3.5 my-3 text-xs text-gray-700 space-y-1.5">
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Product Name:</span>
                <span className="font-bold text-gray-900">{formData.name || editingProduct?.name}</span>
              </div>
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Selling Price:</span>
                <span className="font-bold text-gray-900">₱{Number(formData.price ?? editingProduct?.price ?? 0).toFixed(2)}</span>
              </div>
              <div className="flex justify-between">
                <span className="font-medium text-gray-500">Base Quantity:</span>
                <span className="font-bold text-gray-900">{formData.quantity ?? editingProduct?.quantity} units</span>
              </div>
            </div>

            <AlertDialogFooter className="flex gap-2 sm:gap-3 mt-4">
              <AlertDialogCancel
                onClick={() => setShowSaveConfirm(false)}
                className="flex-1 font-bold rounded-xl"
              >
                Cancel
              </AlertDialogCancel>
              <AlertDialogAction
                onClick={() => {
                  setShowSaveConfirm(false);
                  handleEditProduct();
                }}
                className="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white font-bold rounded-xl"
              >
                Yes, Save Changes
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>

        {/* Owner Passcode Authorization for Add */}
        <OwnerPasscodeModal
          isOpen={isAuthAddOpen}
          actionTitle="Add New Product"
          actionDescription="Owner authorization required before creating a new product in the inventory."
          onSuccess={() => {
            setIsAuthAddOpen(false);
            setFormData({});
            setIsAddDialogOpen(true);
          }}
          onClose={() => setIsAuthAddOpen(false)}
        />

        {/* Owner Passcode Authorization for Edit */}
        <OwnerPasscodeModal
          isOpen={!!productToAuthEdit}
          actionTitle={`Edit Product: ${productToAuthEdit?.name || ''}`}
          actionDescription="Owner authorization required to modify inventory product details or pricing."
          onSuccess={() => {
            if (productToAuthEdit) {
              const p = productToAuthEdit;
              setProductToAuthEdit(null);
              openEditDialog(p);
            }
          }}
          onClose={() => setProductToAuthEdit(null)}
        />

        {/* Owner Passcode Authorization for Delete */}
        <OwnerPasscodeModal
          isOpen={!!productToAuthDelete}
          actionTitle={`Delete Product: ${productToAuthDelete?.name || ''}`}
          actionDescription="Owner authorization required before deleting a product from inventory."
          onSuccess={() => {
            if (productToAuthDelete) {
              const p = productToAuthDelete;
              setProductToAuthDelete(null);
              setProductToDelete(p);
            }
          }}
          onClose={() => setProductToAuthDelete(null)}
        />

        {/* Queued Batches Modal */}
        {viewingQueueProduct && (
          <Dialog open={!!viewingQueueProduct} onOpenChange={() => setViewingQueueProduct(null)}>
            <DialogContent
              className="max-w-3xl w-[92vw] bg-white p-6 rounded-2xl shadow-2xl border border-gray-100"
              style={{ maxWidth: '850px', width: '92vw' }}
            >
              <DialogHeader>
                <DialogTitle className="text-lg font-black text-gray-900 flex items-center gap-2">
                  <Layers className="size-5 text-blue-600" />
                  Queued Batches — {viewingQueueProduct.name}
                </DialogTitle>
                <DialogDescription className="text-xs text-gray-500">
                  SKU: <span className="font-bold text-gray-700">{viewingQueueProduct.sku}</span> | Category: <span className="font-bold text-blue-600">{viewingQueueProduct.category}</span>
                </DialogDescription>
              </DialogHeader>

              <div className="space-y-4 my-3">
                {/* Active Old Batch Card */}
                <div className="p-3.5 bg-gray-50 border border-gray-200 rounded-xl flex items-center justify-between">
                  <div>
                    <div className="text-[10px] font-black uppercase text-gray-400 tracking-wider">Active Old Batch (Currently Selling in POS)</div>
                    <div className="text-sm font-black text-gray-900 mt-0.5">
                      {Number(viewingQueueProduct.quantity)} units
                      <span className="ml-2 text-xs font-bold text-gray-500">
                        {viewingQueueProduct.dispensingMethod === 'FIFO' ? 'No Expiry (FIFO)' : `EXP: ${viewingQueueProduct.expiryDate || 'N/A'}`}
                      </span>
                    </div>
                  </div>
                  <Badge className="bg-gray-200 text-gray-800 hover:bg-gray-200 text-xs font-mono font-black">
                    BATCH: {viewingQueueProduct.batchNumber || 'N/A'}
                  </Badge>
                </div>

                {/* Queued Batches Table */}
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <h4 className="text-xs font-black uppercase text-blue-800 tracking-wider flex items-center gap-1.5">
                      <Boxes className="size-3.5 text-blue-600" />
                      Incoming New Batches in Queue ({viewingQueueProduct.newBatchQueue?.length || 0})
                    </h4>
                    <span className="text-xs font-black text-blue-800 bg-blue-50 px-2.5 py-0.5 rounded-full border border-blue-200">
                      Total Queued: {Number(viewingQueueProduct.newStockQuantity || 0)} units
                    </span>
                  </div>

                  {(!viewingQueueProduct.newBatchQueue || viewingQueueProduct.newBatchQueue.length === 0) ? (
                    <div className="p-6 text-center text-xs text-gray-400 bg-gray-50 rounded-xl border border-dashed border-gray-200">
                      Walang naka-queue na bagong batch para sa produktong ito.
                    </div>
                  ) : (
                    <div className="border border-gray-200 rounded-xl overflow-x-auto shadow-2xs">
                      <table className="w-full text-left text-xs">
                        <thead className="bg-blue-50/80 text-[10px] uppercase font-black text-blue-900 tracking-wider border-b border-blue-100">
                          <tr>
                            <th className="p-2.5">Priority</th>
                            <th className="p-2.5">Batch Number</th>
                            <th className="p-2.5 text-center">Supplier</th>
                            <th className="p-2.5 text-center">Arrival Date</th>
                            <th className="p-2.5 text-center">Quantity</th>
                            <th className="p-2.5 text-center">Expiry Date</th>
                            <th className="p-2.5 text-center">{viewingQueueProduct.dispensingMethod === 'FIFO' ? 'Order' : 'FEFO Status'}</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-100 bg-white">
                          {viewingQueueProduct.newBatchQueue.map((b, idx) => (
                            <tr key={idx} className={idx === 0 ? "bg-blue-50/30" : "hover:bg-gray-50/50"}>
                              <td className="p-2.5 font-bold">
                                {idx === 0 ? (
                                  <Badge className="bg-blue-600 text-white text-[9px] font-black hover:bg-blue-600">
                                    #1 Next to Rotate
                                  </Badge>
                                ) : (
                                  <span className="text-gray-500 font-bold ml-1">#{idx + 1} In Queue</span>
                                )}
                              </td>
                              <td className="p-2.5 font-mono font-bold text-blue-900">{b.batchNumber}</td>
                              <td className="p-2.5 text-center">
                                <span className="text-[10px] font-black uppercase bg-gray-100 px-1.5 py-0.5 rounded text-gray-700">{b.supplier || 'N/A'}</span>
                              </td>
                              <td className="p-2.5 text-center text-gray-600 font-medium">{b.arrivalDate || 'N/A'}</td>
                              <td className="p-2.5 text-center font-black text-gray-900">{b.quantity} pcs</td>
                              <td className="p-2.5 text-center font-bold text-gray-700">
                                {viewingQueueProduct.dispensingMethod === 'FIFO' ? (
                                  <span className="text-[10px] text-sky-700 font-bold bg-sky-50 px-1 rounded">No Expiry (FIFO)</span>
                                ) : (
                                  b.expiryDate || 'N/A'
                                )}
                              </td>
                              <td className="p-2.5 text-center">
                                <Badge variant="outline" className="border-green-300 text-green-700 bg-green-50 text-[9px] font-bold">
                                  Standby
                                </Badge>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                  )}
                </div>
              </div>
            </DialogContent>
          </Dialog>
        )}
      </div>
    </ErrorBoundary>
  );
}
