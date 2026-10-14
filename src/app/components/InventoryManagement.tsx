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
import { Plus, Edit, Trash2, Search, Package, ChevronLeft, ChevronRight, Layers, ArrowUpDown, ArrowUp, ArrowDown, ChevronDown, ArrowDownAZ, RotateCcw, Boxes, Lock } from 'lucide-react';
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

export const getTodayBatchCode = (supplier?: string) => {
  return formatBatchCode(undefined, supplier);
};

export function alignBatchesFEFO(
  oldQty: number,
  oldExp: string | undefined | null,
  oldBatchNumber: string | undefined,
  queue: BatchItem[],
  defaultSupplier: string,
  todayStr: string
) {
  const allBatches: BatchItem[] = [];

  if (Number(oldQty) > 0) {
    allBatches.push({
      batchNumber: oldBatchNumber || formatBatchCode(todayStr, defaultSupplier),
      supplier: defaultSupplier,
      quantity: Number(oldQty),
      expiryDate: oldExp || undefined,
      arrivalDate: todayStr
    });
  }

  if (Array.isArray(queue)) {
    for (const item of queue) {
      if (Number(item.quantity) > 0) {
        allBatches.push({
          batchNumber: item.batchNumber || formatBatchCode(item.arrivalDate || todayStr, item.supplier || defaultSupplier),
          supplier: item.supplier || defaultSupplier,
          quantity: Number(item.quantity),
          expiryDate: item.expiryDate || undefined,
          arrivalDate: item.arrivalDate || todayStr
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

  // Strict FEFO: Earliest expiration date first
  allBatches.sort((a, b) => {
    const expA = a.expiryDate && a.expiryDate.trim() ? a.expiryDate.trim() : '9999-12-31';
    const expB = b.expiryDate && b.expiryDate.trim() ? b.expiryDate.trim() : '9999-12-31';
    if (expA !== expB) {
      return expA.localeCompare(expB);
    }
    const arrA = a.arrivalDate || '';
    const arrB = b.arrivalDate || '';
    return arrA.localeCompare(arrB);
  });

  const primary = allBatches[0];
  const remaining = allBatches.slice(1);
  const totalRemainingQty = remaining.reduce((sum, b) => sum + Number(b.quantity || 0), 0);
  const remExpList = remaining.map(b => b.expiryDate).filter(Boolean) as string[];
  const earliestRemExp = remExpList.length > 0 ? [...remExpList].sort()[0] : undefined;

  const wasPromoted = primary.batchNumber !== oldBatchNumber;

  return {
    quantity: primary.quantity,
    expiryDate: primary.expiryDate,
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

  const handleAddBatchToQueue = () => {
    if (!incomingBatchQty || Number(incomingBatchQty) <= 0) {
      toast.error('Please enter a valid incoming batch quantity');
      return;
    }
    const sup = (incomingBatchSupplier || (formData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH')).toUpperCase().trim();
    const arrDate = incomingBatchArrivalDate || new Date().toISOString().split('T')[0];
    const code = (incomingBatchNumber.trim() || formatBatchCode(arrDate, sup)).toUpperCase();
    const currentQueue = Array.isArray(formData.newBatchQueue) ? [...formData.newBatchQueue] : [];
    const existingIdx = currentQueue.findIndex(b => b.batchNumber.toUpperCase() === code);

    if (existingIdx >= 0) {
      const existing = currentQueue[existingIdx];
      const newQty = Number(existing.quantity) + Number(incomingBatchQty);
      let earliestExp = existing.expiryDate;
      if (incomingBatchExp) {
        if (!earliestExp || new Date(incomingBatchExp) < new Date(earliestExp)) {
          earliestExp = incomingBatchExp;
        }
      }
      currentQueue[existingIdx] = {
        ...existing,
        quantity: newQty,
        expiryDate: earliestExp,
        arrivalDate: existing.arrivalDate || arrDate
      };
    } else {
      currentQueue.push({
        batchNumber: code,
        supplier: sup,
        quantity: Number(incomingBatchQty),
        expiryDate: incomingBatchExp || undefined,
        arrivalDate: arrDate
      });
    }

    // Apply strict FEFO alignment: Earliest expiration batch is ALWAYS the active Old Batch
    const aligned = alignBatchesFEFO(
      Number(formData.quantity ?? 0),
      formData.expiryDate,
      formData.batchNumber,
      currentQueue,
      sup,
      arrDate
    );

    setFormData({
      ...formData,
      quantity: aligned.quantity,
      expiryDate: aligned.expiryDate,
      batchNumber: aligned.batchNumber,
      newBatchQueue: aligned.newBatchQueue,
      newStockQuantity: aligned.newStockQuantity,
      newStockExpiry: aligned.newStockExpiry
    });

    if (aligned.wasPromoted) {
      toast.success(`FEFO Rotation Applied: Batch ${aligned.batchNumber} (EXP: ${aligned.expiryDate || 'N/A'}) expires earliest and is promoted to active Old Batch!`);
    } else if (existingIdx >= 0) {
      toast.success(`Accumulated +${incomingBatchQty} pcs into existing batch ${code}.`);
    } else {
      toast.success(`Queued new batch ${code} with ${incomingBatchQty} pcs into restock queue`);
    }

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

    try {
      const response = await fetch('/api/products.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-User-Name': currentUser.name
        },
        body: JSON.stringify({
          ...formData,
          batchNumber,
          newStockQuantity: formData.newStockQuantity || 0,
          newStockExpiry: formData.newStockExpiry || null,
          newBatchQueue: formData.newBatchQueue || []
        })
      });
      const data = await response.json();
      if (data.success) {
        toast.success('Product added successfully');
        logAuditAction(
          currentUser.name,
          'Inventory Add',
          `Added New Product: ${formData.name} [SKU: ${formData.sku}, Category: ${formData.category}] | Initial Old Batch: ${batchNumber} (${formData.quantity} pcs, EXP: ${formData.expiryDate || 'N/A'}, Supplier: ${sup}) | Cost: ₱${Number(formData.cost).toFixed(2)} | Price: ₱${Number(formData.price).toFixed(2)} | Reorder Level: ${formData.reorderLevel}`
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

    const initialQueue: BatchItem[] = Array.isArray(p.newBatchQueue) && p.newBatchQueue.length > 0
      ? p.newBatchQueue.map(b => ({
          ...b,
          batchNumber: (b.batchNumber && !b.batchNumber.startsWith('20261014-'))
            ? b.batchNumber
            : formatBatchCode(b.arrivalDate || todayStr, b.supplier || sup),
          arrivalDate: b.arrivalDate || todayStr
        }))
      : (p.newStockQuantity && p.newStockQuantity > 0
          ? [{
              batchNumber: formatBatchCode(todayStr, sup),
              supplier: sup,
              quantity: p.newStockQuantity,
              expiryDate: p.newStockExpiry,
              arrivalDate: todayStr
            }]
          : []);

    const oldBatchNumber = Number(p.quantity) > 0
      ? ((p.batchNumber && !p.batchNumber.startsWith('20261014-'))
          ? p.batchNumber
          : formatBatchCode(initialArrDate, sup))
      : undefined;

    // Apply strict FEFO alignment: Earliest expiration batch ALWAYS becomes Old Batch
    const aligned = alignBatchesFEFO(
      Number(p.quantity ?? 0),
      p.expiryDate,
      oldBatchNumber,
      initialQueue,
      sup,
      todayStr
    );

    setEditingProduct(p);
    setFormData({
      ...p,
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

    // Check if the user filled in the incoming batch inputs without explicitly clicking "+ Queue Batch"
    let currentQueue = Array.isArray(formData.newBatchQueue) ? [...formData.newBatchQueue] : [];
    const sup = (incomingBatchSupplier || (formData.category === 'Pharmaceutical' ? 'UNILAB' : 'GEN-MERCH')).toUpperCase().trim();
    const arrDate = incomingBatchArrivalDate || new Date().toISOString().split('T')[0];

    let newlyAddedBatchSummary = '';

    if (incomingBatchQty && Number(incomingBatchQty) > 0) {
      const code = (incomingBatchNumber.trim() || formatBatchCode(arrDate, sup)).toUpperCase();
      const existingIdx = currentQueue.findIndex(b => b.batchNumber.toUpperCase() === code);

      if (existingIdx >= 0) {
        const existing = currentQueue[existingIdx];
        const newQty = Number(existing.quantity) + Number(incomingBatchQty);
        let earliestExp = existing.expiryDate;
        if (incomingBatchExp) {
          if (!earliestExp || new Date(incomingBatchExp) < new Date(earliestExp)) {
            earliestExp = incomingBatchExp;
          }
        }
        currentQueue[existingIdx] = {
          ...existing,
          quantity: newQty,
          expiryDate: earliestExp,
          arrivalDate: existing.arrivalDate || arrDate
        };
        newlyAddedBatchSummary = ` | Accumulated +${incomingBatchQty} pcs into Batch ${code} (EXP: ${earliestExp || 'N/A'}, Supplier: ${sup})`;
      } else {
        currentQueue.push({
          batchNumber: code,
          supplier: sup,
          quantity: Number(incomingBatchQty),
          expiryDate: incomingBatchExp || undefined,
          arrivalDate: arrDate
        });
        newlyAddedBatchSummary = ` | Added Incoming Batch: ${code} (+${incomingBatchQty} pcs, EXP: ${incomingBatchExp || 'N/A'}, Supplier: ${sup})`;
      }
    }

    // Strict FEFO alignment: Earliest expiration batch ALWAYS becomes the active Old Batch
    const aligned = alignBatchesFEFO(
      Number(formData.quantity ?? 0),
      formData.expiryDate,
      formData.batchNumber,
      currentQueue,
      sup,
      arrDate
    );

    const payload = {
      ...editingProduct,
      ...formData,
      quantity: aligned.quantity,
      expiryDate: aligned.expiryDate,
      batchNumber: aligned.batchNumber,
      newBatchQueue: aligned.newBatchQueue,
      newStockQuantity: aligned.newStockQuantity,
      newStockExpiry: aligned.newStockExpiry
    };

    const queueDetails = aligned.newBatchQueue.length > 0
      ? ` | Queued Batches (${aligned.newBatchQueue.length}): [${aligned.newBatchQueue.map(b => `${b.batchNumber}: ${b.quantity} pcs (EXP: ${b.expiryDate || 'N/A'})`).join(', ')}]`
      : ' | Queued Batches: None';

    const totalCombinedStock = Number(aligned.quantity) + Number(aligned.newStockQuantity);
    const auditDetails = `Updated Product: ${payload.name} [SKU: ${payload.sku}]${newlyAddedBatchSummary} | Active Old Batch: ${aligned.batchNumber} (${aligned.quantity} pcs, EXP: ${aligned.expiryDate || 'N/A'}) | New Batch Total: ${aligned.newStockQuantity} pcs${queueDetails} | Total Combined Stock: ${totalCombinedStock} pcs | Price: ₱${Number(payload.price).toFixed(2)}`;

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
    const oldQty = Math.max(0, Number(product.quantity));
    const newQty = Math.max(0, Number(product.newStockQuantity || 0));
    const total = oldQty + newQty;

    const oldExpired = isDateExpired(product.expiryDate);
    const newExpired = isDateExpired(product.newStockExpiry);

    const sellable = (oldExpired ? 0 : oldQty) + (newExpired ? 0 : newQty);

    if (total === 0) return { label: 'Out of Stock', color: 'bg-red-100 text-red-800' };
    if (sellable === 0) return { label: 'Expired', color: 'bg-red-600 text-white animate-pulse' };
    if (sellable < total) return { label: 'Partial Expired', color: 'bg-amber-100 text-amber-800' };
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
                    <Select value={formData.category || ''} onValueChange={(value) => setFormData({ ...formData, category: value })}>
                      <SelectTrigger><SelectValue placeholder="Select category" /></SelectTrigger>
                      <SelectContent>
                        {categories.map(cat => (<SelectItem key={cat} value={cat}>{cat}</SelectItem>))}
                      </SelectContent>
                    </Select>
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="quantity">Old Batch Qty *</Label>
                    <Input id="quantity" type="number" value={formData.quantity || ''} onChange={(e) => setFormData({ ...formData, quantity: Number(e.target.value) })} />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="expiryDate">Old Batch Expiry</Label>
                    <Input id="expiryDate" type="date" value={formData.expiryDate || ''} onChange={(e) => setFormData({ ...formData, expiryDate: e.target.value })} />
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
                  <div className="col-span-2 p-3 bg-blue-50 border border-blue-100 rounded-lg space-y-3 my-2">
                    <h4 className="text-xs font-black text-blue-700 uppercase tracking-widest flex items-center gap-2">
                      <Plus className="size-3" /> New Batch (Incoming Stock Queue)
                    </h4>
                    <div className="grid grid-cols-2 gap-4">
                      <div className="space-y-2">
                        <Label htmlFor="newBatchQuantity" className="text-[10px] uppercase font-bold text-blue-600 tracking-wider">New Batch Qty</Label>
                        <Input id="newBatchQuantity" type="number" placeholder="Optional" value={formData.newStockQuantity || ''} onChange={(e) => setFormData({ ...formData, newStockQuantity: Number(e.target.value) })} className="bg-white border-blue-200" />
                      </div>
                      <div className="space-y-2">
                        <Label htmlFor="newBatchExpiry" className="text-[10px] uppercase font-bold text-blue-600 tracking-wider">New Batch Expiry</Label>
                        <Input id="newBatchExpiry" type="date" value={formData.newStockExpiry || ''} onChange={(e) => setFormData({ ...formData, newStockExpiry: e.target.value })} className="bg-white border-blue-200" />
                      </div>
                    </div>
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
                      return (
                        <TableRow key={product.id} className="hover:bg-gray-50/50 transition-colors">
                          <TableCell className="px-6 py-4 border-r border-gray-200">
                            <div className="flex flex-col">
                              <div className="flex items-center gap-1.5 flex-wrap">
                                <span className="font-bold text-gray-900">{product.name.replace(/\*/g, '')}</span>
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
                                <span className={`text-md font-black ${isDateExpired(product.expiryDate) ? 'text-red-600' : 'text-gray-900'}`}>{product.quantity}</span>
                                <span className={`text-[9px] font-bold uppercase ${isDateExpired(product.expiryDate) ? 'text-red-500 font-black' : 'text-gray-400'}`}>EXP: {product.expiryDate || 'N/A'}</span>
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
                              const effectiveNewExpiry = product.newStockExpiry || (queueBatches.find(b => b.expiryDate)?.expiryDate);

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
                                  <span className={`text-sm font-black ${isDateExpired(effectiveNewExpiry) ? 'text-red-600' : 'text-blue-800'}`}>{effectiveNewQty}</span>
                                  <span className={`text-[9px] font-bold uppercase ${isDateExpired(effectiveNewExpiry) ? 'text-red-500 font-black' : 'text-gray-400'}`}>EXP: {effectiveNewExpiry || 'N/A'}</span>
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
              className="max-w-6xl w-[96vw] max-h-[92vh] overflow-y-auto p-6 bg-white rounded-2xl shadow-2xl"
              style={{ maxWidth: '1120px', width: '96vw' }}
            >
              <DialogHeader className="pb-3 border-b border-gray-100 flex flex-row items-center justify-between">
                <div>
                  <DialogTitle className="text-xl font-black text-gray-900 flex items-center gap-2">
                    <Package className="size-5 text-blue-600" />
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

              <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 py-4 items-start">
                {/* LEFT COLUMN: Product Details & Old Batch (6 cols) */}
                <div className="lg:col-span-6 space-y-4">
                  {/* Product Info Card */}
                  <div className="p-4 bg-gray-50/80 border border-gray-200 rounded-xl space-y-3 shadow-2xs">
                    <div className="text-xs font-black text-gray-800 uppercase tracking-wider flex items-center gap-1.5 pb-1 border-b border-gray-200">
                      <Package className="size-3.5 text-gray-600" /> Product Information
                    </div>
                    <div className="space-y-1.5">
                      <Label htmlFor="edit-name" className="text-xs font-bold text-gray-700">Product Name *</Label>
                      <Input id="edit-name" value={formData.name || ''} onChange={(e) => setFormData({ ...formData, name: e.target.value })} className="bg-white font-medium" />
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div className="space-y-1.5">
                        <Label htmlFor="edit-sku" className="text-xs font-bold text-gray-700">SKU Code *</Label>
                        <Input id="edit-sku" value={formData.sku || ''} onChange={(e) => setFormData({ ...formData, sku: e.target.value })} className="bg-white font-mono" />
                      </div>
                      <div className="space-y-1.5">
                        <Label htmlFor="edit-category" className="text-xs font-bold text-gray-700">Category *</Label>
                        <Select value={formData.category || ''} onValueChange={(value) => setFormData({ ...formData, category: value })}>
                          <SelectTrigger className="bg-white"><SelectValue /></SelectTrigger>
                          <SelectContent>
                            {categories.map(cat => (<SelectItem key={cat} value={cat}>{cat}</SelectItem>))}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div className="space-y-1.5">
                        <Label htmlFor="edit-price" className="text-xs font-bold text-gray-700">Selling Price (₱) *</Label>
                        <Input id="edit-price" type="number" step="0.01" value={formData.price || ''} onChange={(e) => setFormData({ ...formData, price: Number(e.target.value) })} className="bg-white font-bold text-green-700" />
                      </div>
                      <div className="space-y-1.5">
                        <Label htmlFor="edit-cost" className="text-xs font-bold text-gray-700">Cost Price (₱) *</Label>
                        <Input id="edit-cost" type="number" step="0.01" value={formData.cost || ''} onChange={(e) => setFormData({ ...formData, cost: Number(e.target.value) })} className="bg-white" />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div className="space-y-1.5">
                        <Label htmlFor="edit-reorderLevel" className="text-xs font-bold text-gray-700">Reorder Level *</Label>
                        <Input id="edit-reorderLevel" type="number" value={formData.reorderLevel || ''} onChange={(e) => setFormData({ ...formData, reorderLevel: Number(e.target.value) })} className="bg-white" />
                      </div>
                      <div className="space-y-1.5">
                        <Label htmlFor="edit-description" className="text-xs font-bold text-gray-700">Description</Label>
                        <Input id="edit-description" value={formData.description || ''} onChange={(e) => setFormData({ ...formData, description: e.target.value })} className="bg-white" placeholder="Optional details..." />
                      </div>
                    </div>
                  </div>

                  {/* Old Batch Card (Protected / Non-Editable) */}
                  <div className="p-4 bg-amber-50/70 border border-amber-200 rounded-xl space-y-3 shadow-2xs">
                    <div className="flex items-center justify-between pb-1 border-b border-amber-200">
                      <div className="text-xs font-black text-amber-900 uppercase tracking-wider flex items-center gap-1.5">
                        <Boxes className="size-3.5 text-amber-700" /> Old Batch (Active Stock in POS)
                      </div>
                      <div className="flex items-center gap-1.5">
                        <span className="inline-flex items-center gap-1 text-[10px] font-black text-amber-800 bg-amber-100/90 border border-amber-200 px-2 py-0.5 rounded shadow-2xs">
                          <Lock className="size-3 text-amber-700" /> Locked & Active
                        </span>
                        <span className="text-[10px] font-bold text-amber-800 bg-amber-100 px-2 py-0.5 rounded">Primary Stock</span>
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div className="space-y-1.5">
                        <Label className="text-xs font-bold text-gray-700">Old Batch Quantity</Label>
                        <div className="h-9 px-3 py-1.5 bg-amber-100/40 border border-amber-200/80 rounded-md flex items-center justify-between select-none">
                          <span className="font-bold text-gray-900 text-sm">{formData.quantity ?? 0} pcs</span>
                          <span className="text-[9px] font-bold uppercase text-amber-700 bg-amber-100 px-1.5 py-0.5 rounded">Read-Only</span>
                        </div>
                      </div>
                      <div className="space-y-1.5">
                        <Label className="text-xs font-bold text-gray-700">Old Batch Expiry Date</Label>
                        <div className="h-9 px-3 py-1.5 bg-amber-100/40 border border-amber-200/80 rounded-md flex items-center justify-between select-none">
                          <span className="font-bold text-gray-800 text-xs">{formData.expiryDate || 'N/A'}</span>
                          <span className="text-[9px] font-bold uppercase text-amber-700 bg-amber-100 px-1.5 py-0.5 rounded">Read-Only</span>
                        </div>
                      </div>
                    </div>
                    <div className="space-y-1.5">
                      <div className="flex items-center justify-between">
                        <Label className="text-xs font-bold text-gray-700">Old Batch Number</Label>
                        <span className="text-[10px] text-amber-800 font-medium">Active in POS system</span>
                      </div>
                      <div className="h-9 px-3 py-1.5 bg-amber-100/40 border border-amber-200/80 rounded-md flex items-center justify-between select-none">
                        <span className="font-mono font-bold text-blue-900 text-xs">{formData.batchNumber || 'N/A'}</span>
                        <span className="text-[9px] font-bold uppercase text-gray-500 bg-white/80 border border-gray-200 px-1.5 py-0.5 rounded">Fixed</span>
                      </div>
                    </div>
                    <div className="text-[10px] text-amber-900/90 bg-amber-100/60 p-2 rounded-lg border border-amber-200 flex items-center gap-1.5 leading-tight">
                      <Lock className="size-3 text-amber-700 shrink-0" />
                      <span>Protektado ang Old Batch upang hindi maapektuhan o mabago ang kasalukuyang binibenta sa POS. Magdagdag ng bagong stock sa kanan (New Batch Queue).</span>
                    </div>
                  </div>
                </div>

                {/* RIGHT COLUMN (NASA GILID): New Batch Queue & Restocking (6 cols) */}
                <div className="lg:col-span-6 space-y-4">
                  <div className="p-4 bg-blue-50/80 border-2 border-blue-200 rounded-xl space-y-4 shadow-xs">
                    <div className="flex flex-wrap items-center justify-between gap-2 pb-2 border-b border-blue-200">
                      <div className="text-xs font-black text-blue-950 uppercase tracking-wider flex items-center gap-1.5 shrink-0">
                        <Layers className="size-4 text-blue-600" /> New Batch Queue & Restocking
                      </div>
                      <Badge className="bg-blue-600 text-white font-black text-xs px-2.5 py-0.5 shadow-2xs shrink-0 whitespace-nowrap">
                        Total in Queue: {Number(formData.newStockQuantity || 0)} pcs
                      </Badge>
                    </div>

                    {/* Queued batches list */}
                    <div>
                      <div className="flex items-center justify-between mb-1.5">
                        <span className="text-[11px] font-black uppercase text-blue-900 tracking-wider">
                          Waiting in Queue ({Array.isArray(formData.newBatchQueue) ? formData.newBatchQueue.length : 0} batches)
                        </span>
                        <span className="text-[10px] text-gray-500 font-medium">Automatic FEFO/FIFO Depletion</span>
                      </div>

                      {Array.isArray(formData.newBatchQueue) && formData.newBatchQueue.length > 0 ? (
                        <div className="bg-white rounded-xl border border-blue-200 overflow-hidden divide-y divide-gray-100 max-h-[170px] overflow-y-auto shadow-2xs">
                          <div className="bg-blue-100/70 px-3 py-1.5 text-[10px] font-black uppercase text-blue-900 grid grid-cols-12 gap-1.5 sticky top-0 z-10">
                            <span className="col-span-1">#</span>
                            <span className="col-span-4">Batch Number</span>
                            <span className="col-span-2 text-center">Qty</span>
                            <span className="col-span-2 text-center">Arrived</span>
                            <span className="col-span-2 text-center">Expiry</span>
                            <span className="col-span-1 text-right">Del</span>
                          </div>
                          {formData.newBatchQueue.map((b, idx) => (
                            <div key={idx} className="px-3 py-2 text-xs grid grid-cols-12 gap-1.5 items-center hover:bg-blue-50/40">
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
                        <div className="p-3 text-center text-xs text-gray-500 bg-white rounded-xl border border-dashed border-blue-200">
                          No incoming batches in queue. Fill out the form below to add.
                        </div>
                      )}
                    </div>

                    {/* Add / Restock Batch Form */}
                    <div className="p-3.5 bg-white border border-blue-200 rounded-xl space-y-3 shadow-2xs">
                      <div className="flex items-center justify-between pb-1 border-b border-gray-100">
                        <span className="text-[11px] font-black text-blue-800 uppercase tracking-wider flex items-center gap-1">
                          <Plus className="size-3.5 text-blue-600" /> Add Incoming Restock Batch
                        </span>
                        <span className="text-[9px] font-semibold text-gray-400">Same batch # auto-accumulates</span>
                      </div>

                      {/* Row 1: Arrival Date + Supplier */}
                      <div className="grid grid-cols-2 gap-3">
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
                      <div className="grid grid-cols-2 gap-3">
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
                          <Label htmlFor="incoming-exp" className="text-[10px] font-bold text-gray-700">Expiry Date</Label>
                          <Input
                            id="incoming-exp"
                            type="date"
                            value={incomingBatchExp}
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
                      <div className="pt-1">
                        <Button
                          type="button"
                          size="sm"
                          onClick={handleAddBatchToQueue}
                          className="w-full h-8 bg-blue-700 hover:bg-blue-800 text-white text-xs font-bold flex items-center justify-center gap-1.5 cursor-pointer shadow-xs"
                        >
                          <Plus className="size-3.5" />
                          + Queue This Batch (Auto-accumulate if same batch #)
                        </Button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <DialogFooter className="pt-3 border-t border-gray-100 flex flex-col sm:flex-row items-center justify-between gap-3">
                <div className="text-xs text-gray-600 flex items-center gap-2">
                  <span className="font-bold text-amber-800 bg-amber-100 px-2 py-0.5 rounded">
                    Old Batch: {formData.quantity || 0}
                  </span>
                  <span>+</span>
                  <span className="font-bold text-blue-800 bg-blue-100 px-2 py-0.5 rounded">
                    New Batch Queue: {formData.newStockQuantity || 0}
                  </span>
                  <span>=</span>
                  <span className="font-black text-gray-900 bg-gray-100 px-2 py-0.5 rounded">
                    Total: {Number(formData.quantity || 0) + Number(formData.newStockQuantity || 0)} units
                  </span>
                </div>
                <div className="flex items-center gap-2">
                  <Button variant="outline" onClick={() => { setIsEditDialogOpen(false); setFormData({}); setEditingProduct(null); }}>
                    Cancel
                  </Button>
                  <Button onClick={() => setShowSaveConfirm(true)} className="bg-blue-700 hover:bg-blue-800 text-white font-bold">
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
                      <span className="ml-2 text-xs font-bold text-gray-500">EXP: {viewingQueueProduct.expiryDate || 'N/A'}</span>
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
                            <th className="p-2.5 text-center">FEFO Status</th>
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
                              <td className="p-2.5 text-center font-bold text-gray-700">{b.expiryDate || 'N/A'}</td>
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
