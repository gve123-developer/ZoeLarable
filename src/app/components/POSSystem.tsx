import { useState, useEffect, useMemo } from 'react';
import { jsPDF } from 'jspdf';
import { speak } from '@/app/utils/voiceUtils';
import { isRxProduct } from '@/app/utils/rxUtils';
import { User, Product, Transaction } from '@/app/App';
import { Button } from '@/app/components/ui/button';
import { Input } from '@/app/components/ui/input';
import { Card, CardContent, CardHeader, CardTitle } from '@/app/components/ui/card';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/app/components/ui/table';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/app/components/ui/select';
import { Badge } from '@/app/components/ui/badge';
import { Separator } from '@/app/components/ui/separator';
import { toast } from 'sonner';
import { Search, ShoppingCart, Trash2, Plus, Minus, CreditCard, FileText, Mic, CheckCircle2, QrCode } from 'lucide-react';
import { getProductImage, POS_FILTER_CATEGORIES } from '@/app/utils/productImages';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogFooter } from '@/app/components/ui/dialog';
import { logAuditAction } from '@/app/utils/auditUtils';
import { ErrorBoundary } from '@/app/components/ErrorBoundary';

interface POSSystemProps {
  currentUser: User;
  products: Product[];
  onProductsChange: (products: Product[]) => void;
}

interface CartItem {
  product: Product;
  quantity: number;
}

const HEALTH_CONDITIONS = [
  { id: 'all', label: 'All Health Uses' },
  { id: 'rx_only', label: 'Prescription Medicines (Rx Only)' },
  { id: 'fever', label: 'For Fever & Pain (Lagnat at Sakit)', keywords: ['biogesic', 'paracetamol', 'advil', 'alaxan', 'medicol', 'tempra', 'calpol', 'ibuprofen', 'mefenamic', 'ponstan', 'arcoxia', 'aspilets', 'fever', 'pain', 'headache', 'toothache'] },
  { id: 'cough_cold', label: 'For Cough, Cold & Flu (Ubo at Sipon)', keywords: ['bioflu', 'neozep', 'decolgen', 'solmux', 'ascof', 'robitussin', 'tuseran', 'ambroxol', 'carbocisteine', 'benadryl', 'bisolvon', 'ambrolex', 'asmalin', 'symdek', 'cough', 'cold', 'flu', 'phlegm'] },
  { id: 'allergy', label: 'For Allergy & Itch (Pangangati)', keywords: ['allerkid', 'allerta', 'alnix', 'allerzet', 'cetirizine', 'loratadine', 'virlix', 'zyrtec', 'antihistamine', 'allergy', 'itch', 'hives'] },
  { id: 'headache', label: 'For Headache & Migraine (Sakit ng Ulo)', keywords: ['biogesic', 'paracetamol', 'advil', 'saridon', 'panadol', 'headache', 'migraine', 'tension'] },
  { id: 'stomach', label: 'For Stomach & Acid (Tiyan at Acid)', keywords: ['buscopan', 'kremil', 'gaviscon', 'omeprazole', 'loperamide', 'imodium', 'antacid', 'stomach', 'diarrhea', 'acid', 'ulcer'] },
  { id: 'antibiotic', label: 'For Antibiotics & Infection (Impeksyon)', keywords: ['amoxicillin', 'augmentin', 'cefalexin', 'azithromycin', 'zithromax', 'bactidol', 'bactroban', 'clamox', 'cefuroxime', 'ciprofloxacin', 'antibiotic', 'infection'] },
  { id: 'vitamins', label: 'For Vitamins & Energy (Bitamina)', keywords: ['enervon', 'centrum', 'poten', 'appebon', 'ascorbic', 'vitamin', 'ferrous', 'calcium', 'zinc', 'revitonic', 'multivitamin', 'iron'] },
  { id: 'first_aid', label: 'For Wounds & Antiseptic (Sugat at First Aid)', keywords: ['betadine', 'alcoplus', 'agua oxigenada', 'alcohol', 'antiseptic', 'bioderm', 'salve', 'wound'] },
  { id: 'hypertension', label: 'For Maintenance / Heart (Presyon)', keywords: ['amvasc', 'amlodipine', 'losartan', 'metoprolol', 'captopril', 'maintenance', 'hypertension', 'blood pressure'] }
];

const POPULAR_BRANDS = [
  'Advil',
  'Alaxan',
  'Alcoplus',
  'Allerkid',
  'Allerta',
  'Allerzet',
  'Alnix',
  'Althea',
  'Ambrolex',
  'Amoxicillin',
  'Amvasc',
  'Arcoxia',
  'Ascof',
  'Augmentin',
  'Bactidol',
  'Bactroban',
  'Band-Aid',
  'Benadryl',
  'Bench',
  'Betadine',
  'Bioderm',
  'Bioflu',
  'Biogesic',
  'Bisolvon',
  'Bonakid',
  'Bonamine',
  'Buscopan',
  'Calpol',
  'Centrum',
  'Decolgen',
  'Enervon',
  'Gaviscon',
  'Kremil-S',
  'Medicol',
  'Neozep',
  'Ponstan',
  'Poten-Cee',
  'Robitussin',
  'Solmux',
  'Tempra',
  'Tuseran',
  'Zithromax',
  'Zykast'
];

export function POSSystem({ currentUser, products, onProductsChange }: POSSystemProps) {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('All');
  const [filterCondition, setFilterCondition] = useState('all');
  const [filterBrand, setFilterBrand] = useState('all');
  const [selectedLetter, setSelectedLetter] = useState('ALL');
  const [sortBy, setSortBy] = useState('best-match');
  const [visibleCount, setVisibleCount] = useState(24);
  const [cart, setCart] = useState<CartItem[]>([]);
  const [paymentMethod, setPaymentMethod] = useState('cash');
  const [amountReceived, setAmountReceived] = useState('');
  const [isListening, setIsListening] = useState(false);
  const [completedTransaction, setCompletedTransaction] = useState<Transaction | null>(null);

  // Dynamically extract and sort all brands from products + popular brands
  const allBrands = useMemo(() => {
    const brandMap = new Map<string, string>();

    // 1. Add well-known brands
    POPULAR_BRANDS.forEach((brand) => {
      const key = brand.toLowerCase().replace(/[^a-z0-9]/g, '');
      brandMap.set(key, brand);
    });

    // 2. Dynamically extract brands from all products in the database
    products.forEach((product) => {
      if (!product.name) return;
      const rawFirst = product.name.trim().split(/[\s/]+/)[0] || '';
      const clean = rawFirst.replace(/^[^a-zA-Z0-9]+|[^a-zA-Z0-9]+$/g, '');
      if (clean.length >= 2 && !/^\d+$/.test(clean)) {
        const key = clean.toLowerCase();
        if (!brandMap.has(key)) {
          const display = clean.charAt(0).toUpperCase() + clean.slice(1).toLowerCase();
          brandMap.set(key, display);
        }
      }
    });

    return Array.from(brandMap.values()).sort((a, b) =>
      a.localeCompare(b, undefined, { sensitivity: 'base' })
    );
  }, [products]);

  const resetAllFilters = () => {
    setSearchQuery('');
    setSelectedCategory('All');
    setFilterCondition('all');
    setFilterBrand('all');
    setSelectedLetter('ALL');
    setSortBy('best-match');
    setVisibleCount(24);
  };

  const clearCart = () => {
    setCart([]);
    setAmountReceived('');
    toast.info('New sale started. Cart cleared.');
  };

  const hasActiveFilters = searchQuery !== '' || selectedCategory !== 'All' || filterCondition !== 'all' || filterBrand !== 'all' || selectedLetter !== 'ALL' || sortBy !== 'best-match';


  const startVoiceSearch = () => {
    const SpeechRecognition = (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition;
    if (!SpeechRecognition) {
      toast.error('Voice search is not supported in this browser.');
      return;
    }

    const recognition = new SpeechRecognition();
    recognition.lang = 'en-US';
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;

    recognition.onstart = () => {
      setIsListening(true);
    };

    recognition.onresult = (event: any) => {
      const transcript = event.results[0][0].transcript;
      setSearchQuery(transcript.replace(/[.?!]$/g, '')); // Remove trailing punctuation
      setIsListening(false);
      toast.success(`Searching for: ${transcript}`);
    };

    recognition.onerror = (event: any) => {
      setIsListening(false);
      if (event.error === 'not-allowed') {
        toast.error('Microphone access denied.');
      } else {
        toast.error('Voice search error. Please try again.');
      }
    };

    recognition.onend = () => {
      setIsListening(false);
    };

    recognition.start();
  };

  const todayStart = useMemo(() => {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return today;
  }, []);

  const getDaysRemaining = (expiryDate: string | undefined): number | undefined => {
    if (!expiryDate) return undefined;
    const cleanDate = expiryDate.includes('T') ? expiryDate : expiryDate + 'T00:00:00';
    const expiry = new Date(cleanDate);
    expiry.setHours(0, 0, 0, 0);
    const diffTime = expiry.getTime() - todayStart.getTime();
    return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  };

  const isBatchExpired = (dateStr: string | undefined): boolean => {
    if (!dateStr) return false;
    const cleanDate = dateStr.includes('T') ? dateStr : dateStr + 'T00:00:00';
    const expiry = new Date(cleanDate);
    expiry.setHours(0, 0, 0, 0);
    return expiry.getTime() < todayStart.getTime();
  };

  const getSellableStock = (product: Product) => {
    const isFIFO = product.dispensingMethod === 'FIFO' || (!product.expiryDate && product.category !== 'Pharmaceutical');
    const oldQty = Math.max(0, Number(product.quantity));
    const newQty = Math.max(0, Number(product.newStockQuantity || 0));

    const oldExpired = isFIFO ? false : isBatchExpired(product.expiryDate);
    const newExpired = isFIFO ? false : isBatchExpired(product.newStockExpiry);

    const oldSellable = oldExpired ? 0 : oldQty;
    const newSellable = newExpired ? 0 : newQty;
    const totalSellable = oldSellable + newSellable;
    const totalPhysical = oldQty + newQty;

    const hasExpiredBatch = !isFIFO && ((oldExpired && oldQty > 0) || (newExpired && newQty > 0));
    const allExpired = !isFIFO && totalPhysical > 0 && totalSellable === 0;

    return { totalSellable, oldSellable, newSellable, oldExpired, newExpired, hasExpiredBatch, allExpired, totalPhysical };
  };

  // No local state for products needed

  const filteredProducts = useMemo(() => {
    return products
      .filter(product => {
        // Search query (name, sku, or 'rx')
        const trimmedSearch = searchQuery.trim().toLowerCase();
        const matchesSearch = trimmedSearch === 'rx' 
          ? isRxProduct(product)
          : (product.name.toLowerCase().includes(trimmedSearch) || product.sku.toLowerCase().includes(trimmedSearch));
        if (!matchesSearch) return false;

        // A-Z Letter filter
        if (selectedLetter !== 'ALL') {
          const firstChar = product.name.trim().charAt(0).toUpperCase();
          if (firstChar !== selectedLetter) return false;
        }

        const nameLower = product.name.toLowerCase();
        const descLower = (product.description || '').toLowerCase();
        const combinedText = `${nameLower} ${descLower}`;

        // Category Pill Filter
        if (selectedCategory !== 'All') {
          const imgInfo = getProductImage(product);
          const selCatLower = selectedCategory.toLowerCase();
          const matchesCat = imgInfo.categoryTag.toLowerCase() === selCatLower ||
            (product.category || '').toLowerCase().includes(selCatLower) ||
            combinedText.includes(selCatLower);
          if (!matchesCat) return false;
        }

        // Health Condition / Purpose Filter (e.g. Rx Only, For Fever, For Cough, etc.)
        if (filterCondition !== 'all') {
          if (filterCondition === 'rx_only') {
            if (!isRxProduct(product)) return false;
          } else {
            const condition = HEALTH_CONDITIONS.find(c => c.id === filterCondition);
            if (condition && condition.keywords) {
              const matchesCondition = condition.keywords.some(k => combinedText.includes(k));
              if (!matchesCondition) return false;
            }
          }
        }

        // Brand Filter
        if (filterBrand !== 'all') {
          const cleanBrand = filterBrand.toLowerCase().replace(/[^a-z0-9]/g, '');
          const cleanName = nameLower.replace(/[^a-z0-9]/g, '');
          if (!cleanName.includes(cleanBrand)) return false;
        }

        return true;
      })
      .sort((a, b) => {
        if (sortBy === 'best-match') {
          const stockA = Number(a.quantity || 0) + Number(a.newStockQuantity || 0);
          const stockB = Number(b.quantity || 0) + Number(b.newStockQuantity || 0);
          if ((stockA > 0) !== (stockB > 0)) {
            return stockB > 0 ? 1 : -1;
          }
          return a.name.localeCompare(b.name, undefined, { sensitivity: 'base' });
        } else if (sortBy === 'a-z') {
          return a.name.localeCompare(b.name, undefined, { sensitivity: 'base' });
        } else if (sortBy === 'z-a') {
          return b.name.localeCompare(a.name, undefined, { sensitivity: 'base' });
        } else if (sortBy === 'price-low') {
          return a.price - b.price;
        } else if (sortBy === 'price-high') {
          return b.price - a.price;
        } else if (sortBy === 'newest') {
          return Number(b.id) - Number(a.id);
        }
        return a.name.localeCompare(b.name, undefined, { sensitivity: 'base' });
      });
  }, [products, searchQuery, selectedCategory, filterCondition, filterBrand, selectedLetter, sortBy]);

  const addToCart = (product: Product) => {
    const { totalSellable, allExpired } = getSellableStock(product);

    if (allExpired) {
      toast.error('Cannot sell: Product is expired!');
      return;
    }

    if (totalSellable <= 0) {
      toast.error('Product is out of stock');
      return;
    }

    const existingItem = cart.find(item => item.product.id === product.id);

    if (existingItem) {
      if (existingItem.quantity >= totalSellable) {
        toast.error(`Only ${totalSellable} non-expired units available`);
        return;
      }
      setCart([
        { ...existingItem, quantity: existingItem.quantity + 1 },
        ...cart.filter(item => item.product.id !== product.id)
      ]);
    } else {
      setCart([{ product, quantity: 1 }, ...cart]);
    }
    toast.success('Added to cart');
    setSearchQuery('');
  };

  const updateCartQuantity = (productId: string, newQuantity: number) => {
    const item = cart.find(i => i.product.id === productId);
    if (!item) return;

    if (newQuantity < 0) return;

    const { totalSellable } = getSellableStock(item.product);

    if (newQuantity > totalSellable) {
      toast.error(`Cannot exceed ${totalSellable} non-expired units available`);
      return;
    }

    setCart([
      { ...item, quantity: newQuantity },
      ...cart.filter(i => i.product.id !== productId)
    ]);
  };

  const removeFromCart = (productId: string) => {
    setCart(cart.filter(item => item.product.id !== productId));
  };

  const calculateTotal = () => {
    return cart.reduce((sum, item) => sum + (item.product.price * item.quantity), 0);
  };

  const calculateChange = () => {
    const received = parseFloat(amountReceived);
    if (isNaN(received)) return 0;
    return received - calculateTotal();
  };

  const handleCheckout = async () => {
    if (cart.length === 0) {
      toast.error('Cart is empty');
      return;
    }

    const receivedNum = parseFloat(amountReceived || '0');
    if (paymentMethod === 'cash') {
      if (isNaN(receivedNum) || receivedNum < calculateTotal()) {
        toast.error('Insufficient payment amount');
        return;
      }
    }

    // Prepare clean JSON payload for API
    const cartData = cart.map(item => ({
      id: parseInt(item.product.id, 10) || item.product.id,
      qty: item.quantity,
      price: item.product.price
    }));

    const cashierId = currentUser?.id ? parseInt(currentUser.id, 10) : 1;
    const cashierName = currentUser?.name || 'Zoe Owner';
    const totalAmount = calculateTotal();
    const changeDue = calculateChange();

    const payload = {
      cart: cartData,
      payment_method: paymentMethod,
      total: totalAmount,
      cashier_id: cashierId,
      amount_received: paymentMethod === 'cash' ? receivedNum : totalAmount,
      change: paymentMethod === 'cash' ? changeDue : 0
    };

    try {
      const response = await fetch('/api/save_transaction.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
      });

      const data = await response.json().catch(() => null);

      if (response.ok && data?.success) {
        // Create local transaction object for the UI summary
        const actualPaid = paymentMethod === 'cash' ? receivedNum : totalAmount;
        const actualChange = paymentMethod === 'cash' ? Math.max(0, receivedNum - totalAmount) : 0;
        const transaction: Transaction = {
          id: data.id.toString(),
          date: new Date().toISOString(),
          items: cart.map(item => ({
            productId: item.product.id,
            productName: item.product.name,
            sku: item.product.sku || 'N/A',
            quantity: item.quantity,
            price: item.product.price,
            cost: item.product.cost,
          })),
          total: totalAmount,
          paymentMethod,
          cashier: cashierName,
          amountReceived: actualPaid,
          change: actualChange,
          tenderedAmount: actualPaid,
          changeAmount: actualChange,
        };

        // Update inventory locally (App.tsx will refetch soon anyway, but this keeps UI snappy)
        const updatedProducts = products.map(product => {
          const cartItem = cart.find(item => item.product.id === product.id);
          if (cartItem) {
            let totalToDeduct = cartItem.quantity;
            let currentOld = product.quantity;
            let currentNew = product.newStockQuantity || 0;
            let expiryDate = product.expiryDate;
            let newStockExpiry = product.newStockExpiry;

            const oldExpired = isBatchExpired(expiryDate);
            const newExpired = isBatchExpired(newStockExpiry);

            const sellableOld = oldExpired ? 0 : Math.max(0, currentOld);
            const sellableNew = newExpired ? 0 : Math.max(0, currentNew);

            // Determine if New Stock should be consumed first based on FEFO (valid batches only)
            let consumeFromNewFirst = false;
            if (sellableNew > 0 && sellableOld <= 0) {
              consumeFromNewFirst = true;
            } else if (sellableNew > 0 && sellableOld > 0) {
              if (!expiryDate) {
                consumeFromNewFirst = false;
              } else if (!newStockExpiry) {
                consumeFromNewFirst = false;
              } else {
                const oldTime = new Date(expiryDate.includes('T') ? expiryDate : expiryDate + 'T00:00:00').getTime();
                const newTime = new Date(newStockExpiry.includes('T') ? newStockExpiry : newStockExpiry + 'T00:00:00').getTime();
                if (!isNaN(newTime) && !isNaN(oldTime) && newTime < oldTime) {
                  consumeFromNewFirst = true;
                }
              }
            }

            let updatedQueue = product.newBatchQueue ? product.newBatchQueue.map(b => ({ ...b })) : [];
            let totalTakenFromNew = 0;

            if (consumeFromNewFirst) {
              // Deduct from New first, then Old
              const takeFromNew = Math.min(totalToDeduct, sellableNew);
              currentNew -= takeFromNew;
              totalTakenFromNew += takeFromNew;
              totalToDeduct -= takeFromNew;

              if (totalToDeduct > 0 && sellableOld > 0) {
                const takeFromOld = Math.min(totalToDeduct, sellableOld);
                currentOld -= takeFromOld;
                totalToDeduct -= takeFromOld;
              }
            } else {
              // Deduct from Old first, then New
              const takeFromOld = Math.min(totalToDeduct, sellableOld);
              currentOld -= takeFromOld;
              totalToDeduct -= takeFromOld;

              if (totalToDeduct > 0 && sellableNew > 0) {
                const takeFromNew = Math.min(totalToDeduct, sellableNew);
                currentNew -= takeFromNew;
                totalTakenFromNew += takeFromNew;
                totalToDeduct -= takeFromNew;
              }
            }

            // Deduct from queued batches in order if stock was taken from New
            if (totalTakenFromNew > 0 && updatedQueue.length > 0) {
              let rem = totalTakenFromNew;
              for (let qi = 0; qi < updatedQueue.length && rem > 0; qi++) {
                const bQty = Number(updatedQueue[qi].quantity || 0);
                const sub = Math.min(rem, bQty);
                updatedQueue[qi].quantity = bQty - sub;
                rem -= sub;
              }
              updatedQueue = updatedQueue.filter(b => Number(b.quantity || 0) > 0);
            }

            // Auto-Rotate: If Old is now 0 and New remains, promote next queued batch to Old
            if (currentOld <= 0 && (updatedQueue.length > 0 || currentNew > 0)) {
              if (updatedQueue.length > 0) {
                const nextBatch = updatedQueue.shift()!;
                const nextQty = updatedQueue.reduce((s, b) => s + Number(b.quantity || 0), 0);
                const nextExp = updatedQueue.length > 0 ? updatedQueue[0].expiryDate : undefined;
                return {
                  ...product,
                  quantity: nextBatch.quantity,
                  expiryDate: nextBatch.expiryDate,
                  batchNumber: nextBatch.batchNumber,
                  newBatchQueue: updatedQueue,
                  newStockQuantity: nextQty,
                  newStockExpiry: nextExp
                };
              }
              return {
                ...product,
                quantity: currentNew,
                expiryDate: newStockExpiry || expiryDate,
                newStockQuantity: 0,
                newStockExpiry: undefined,
                newBatchQueue: []
              };
            }

            return {
              ...product,
              quantity: currentOld,
              expiryDate,
              newStockQuantity: currentNew,
              newStockExpiry: currentNew > 0 ? newStockExpiry : undefined,
              newBatchQueue: updatedQueue
            };
          }
          return product;
        });

        onProductsChange(updatedProducts);
        setCart([]);
        setAmountReceived('');
        setCompletedTransaction(transaction);
        toast.success('Transaction completed successfully!');
        speak('Transaction complete');
        setSearchQuery('');

        // Selection of item summary for audit
        const itemSummary = transaction.items
          .map(i => `${i.productName} [SKU: ${i.sku || 'N/A'}] x${i.quantity} @ ₱${Number(i.price).toFixed(2)} = ₱${(Number(i.quantity) * Number(i.price)).toFixed(2)}`)
          .join('; ');
        const discountText = transaction.discountType
          ? `, Discount: ${transaction.discountType} (-₱${(Number(transaction.discountAmount) || 0).toFixed(2)})`
          : '';
        const paymentDetail = `Paid: ₱${Number(transaction.tenderedAmount || 0).toFixed(2)}, Change: ₱${Number(transaction.changeAmount || 0).toFixed(2)}, Method: ${transaction.paymentMethod}${discountText}`;
        logAuditAction(
          cashierName,
          'POS Sale',
          `Completed Sale #${data.id || data.transaction_id || 'N/A'} | Total: ₱${transaction.total.toFixed(2)} (${paymentDetail}) | Items (${transaction.items.length}): ${itemSummary}`
        );
      } else {
        const errorMsg = data?.error || data?.message || `HTTP ${response.status}`;
        toast.error('Failed to save transaction: ' + errorMsg);
      }
    } catch (error) {
      console.error('POS Checkout Error:', error);
      toast.error('Error connecting to transaction API: ' + (error instanceof Error ? error.message : 'Check connection'));
    }
  };

  const generatePDF = (t: Transaction) => {
    // Calculate required height: Base height (approx 150mm) + 12mm per item
    const itemsCount = t.items.length;
    const estimatedHeight = 150 + (itemsCount * 12);
    const doc = new jsPDF({ orientation: 'p', unit: 'mm', format: [80, estimatedHeight] });

    // Draw a visual Philippine peso sign while preserving the original Courier receipt design
    const addPesoStrokes = (pX: number, yPos: number) => {
      doc.setLineWidth(0.18);
      doc.line(pX - 0.1, yPos - 1.55, pX + 2.0, yPos - 1.55);
      doc.line(pX - 0.1, yPos - 0.85, pX + 2.0, yPos - 0.85);
    };

    const drawPesoRight = (
      amount: string,
      xRight: number,
      yPos: number
    ) => {
      const text = `P${amount}`;
      doc.text(text, xRight, yPos, { align: 'right' });

      const totalWidth = doc.getTextWidth(text);
      const pX = xRight - totalWidth;
      addPesoStrokes(pX, yPos);
    };

    const drawPesoInline = (
      prefix: string,
      amount: string,
      xPos: number,
      yPos: number
    ) => {
      const text = `${prefix}P${amount}`;
      doc.text(text, xPos, yPos);

      const prefixWidth = doc.getTextWidth(prefix);
      addPesoStrokes(xPos + prefixWidth, yPos);
    };

    doc.setFont("courier", "bold");
    doc.setFontSize(10);

    let y = 10;

    doc.text('ZOE PHARMACY & GENERAL', 40, y, { align: 'center' }); y += 4;
    doc.text('MERCHANDISE', 40, y, { align: 'center' }); y += 4;
    doc.setFontSize(8);
    doc.text('40 MATA COR, MANLUNAS STS.,', 40, y, { align: 'center' }); y += 3.5;
    doc.text('VAB BRGY, 183, PASAY CITY,', 40, y, { align: 'center' }); y += 3.5;
    doc.text('METRO MANILA', 40, y, { align: 'center' }); y += 6;
    doc.setFontSize(10);

    doc.setFont("courier", "normal");
    doc.text('----------------------------------', 40, y, { align: 'center' }); y += 6;

    doc.text(`TRANS ID: ${t.id}`, 4, y); y += 4;
    const dateStr = new Date(t.date).toLocaleString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      hour12: true
    });
    doc.text(`DATE: ${dateStr}`, 4, y); y += 4;
    doc.text(`CASHIER: ${(t.cashier || 'ZOE OWNER').toUpperCase()}`, 4, y); y += 8;

    doc.text('----------------------------------', 40, y, { align: 'center' }); y += 6;

    doc.text('ITEM DESCRIPTION', 4, y);
    doc.text('PRICE', 76, y, { align: 'right' }); y += 6;

    t.items.forEach(it => {
      const productName = (it.productName || 'Unknown').substring(0, 20).toUpperCase();
      doc.text(productName, 4, y);
      drawPesoRight((it.price * it.quantity).toFixed(2), 76, y); y += 4;
      drawPesoInline(`${it.quantity} units x `, it.price.toFixed(2), 4, y); y += 6;
    });

    doc.text('__________________________________', 40, y, { align: 'center' }); y += 8;

    doc.setFont("courier", "bold");
    doc.text(`TOTAL AMOUNT`, 4, y);
    drawPesoRight(t.total.toFixed(2), 76, y); y += 8;

    doc.setFont("courier", "normal");
    const amountReceivedVal = t.amountReceived || t.total;
    const changeVal = t.change || 0;

    doc.text(`CASH RECEIVED`, 4, y);
    drawPesoRight(amountReceivedVal.toFixed(2), 76, y); y += 6;
    doc.setFont("courier", "bold");
    doc.text(`CHANGE DUE`, 4, y);
    drawPesoRight(changeVal.toFixed(2), 76, y); y += 10;

    doc.text(`THANK YOU FOR YOUR TRUST!`, 40, y, { align: 'center' }); y += 6;
    doc.setFontSize(8);
    doc.setFont("courier", "normal");
    doc.text(`--- NO REFUND WITHOUT TRANSACTION DETAILS ---`, 40, y, { align: 'center' }); y += 4;
    doc.setFont("courier", "italic");
    doc.text(`This is not an official transaction record.`, 40, y, { align: 'center' });

    doc.save(`receipt_${t.id}.pdf`);
  };

  return (
    <ErrorBoundary fallbackTitle="POS System Module Error">
      <div className="space-y-4 h-full">
        {/* Layout Grid: Catalog Left (70%) + Current Order Right (30%) */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 items-stretch lg:h-[calc(100vh-90px)] min-h-[580px]">
          {/* CATALOG SECTION */}
          <div className="lg:col-span-8 xl:col-span-8 2xl:col-span-9 flex flex-col h-full min-h-0">
            <ErrorBoundary fallbackTitle="Product Catalog Error">
              <Card className="border border-gray-200/90 shadow-2xs rounded-2xl bg-white overflow-hidden p-4 flex flex-col h-full min-h-0">
                {/* 1. Non-scrolling Top Filter Controls */}
                <div className="shrink-0 space-y-3 pb-3 border-b border-gray-100">
                  {/* Top Search & Sort Row */}
                  <div className="flex flex-col sm:flex-row gap-3">
                    <div className="relative flex-1">
                      <Search className="absolute left-3.5 top-1/2 transform -translate-y-1/2 size-4 text-gray-400" />
                      <Input
                        placeholder="Search product name, brand, SKU..."
                        value={searchQuery}
                        onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSearchQuery(e.target.value)}
                        onKeyDown={(e) => {
                          if (e.key === 'Enter') {
                            const q = searchQuery.trim().toLowerCase();
                            if (!q) return;
                            const exactSku = products.find(p => p.sku.toLowerCase() === q);
                            if (exactSku) {
                              addToCart(exactSku);
                              setSearchQuery('');
                              return;
                            }
                            if (filteredProducts.length === 1) {
                              addToCart(filteredProducts[0]);
                              setSearchQuery('');
                            }
                          }
                        }}
                        className="pl-10 pr-12 h-11 text-sm bg-gray-50/60 border-gray-200 rounded-xl focus-visible:ring-emerald-600"
                      />
                      <div className="absolute right-2 top-1/2 transform -translate-y-1/2 flex items-center">
                        <Button
                          variant="ghost"
                          size="icon"
                          className={`size-8 rounded-full ${isListening ? 'text-red-600 bg-red-50 animate-pulse' : 'text-gray-400'}`}
                          onClick={startVoiceSearch}
                          title="Voice Search"
                        >
                          <Mic className={`size-4 ${isListening ? 'fill-red-600' : ''}`} />
                        </Button>
                      </div>
                    </div>

                    {/* Sort Dropdown */}
                    <Select value={sortBy} onValueChange={setSortBy}>
                      <SelectTrigger className="w-full sm:w-44 h-11 bg-white border-gray-200 rounded-xl text-xs font-bold text-gray-700 shadow-2xs">
                        <SelectValue placeholder="Sort: Best Match" />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="best-match">Sort: Best Match</SelectItem>
                        <SelectItem value="a-z">Name: A to Z</SelectItem>
                        <SelectItem value="z-a">Name: Z to A</SelectItem>
                        <SelectItem value="price-low">Price: Low to High</SelectItem>
                        <SelectItem value="price-high">Price: High to Low</SelectItem>
                        <SelectItem value="newest">Newest Added</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>

                  {/* Category Pills */}
                  <div className="flex items-center gap-2 overflow-x-auto pb-1 scrollbar-none">
                    {POS_FILTER_CATEGORIES.map(cat => {
                      const isActive = selectedCategory === cat;
                      return (
                        <button
                          key={cat}
                          type="button"
                          onClick={() => setSelectedCategory(cat)}
                          className={`px-3.5 py-1.5 rounded-lg text-xs font-bold transition-all shrink-0 whitespace-nowrap ${
                            isActive
                              ? 'bg-[#166534] text-white shadow-xs'
                              : 'bg-emerald-50/70 text-emerald-900 hover:bg-emerald-100/80 border border-emerald-100/60'
                          }`}
                        >
                          {cat}
                        </button>
                      );
                    })}
                  </div>

                  {/* Alphabet Quick Filter & Active Reset */}
                  <div className="flex items-center justify-between gap-1 overflow-x-auto pb-1 scrollbar-none border-t border-gray-100 pt-2.5">
                    <div className="flex items-center gap-1 shrink-0">
                      <button
                        type="button"
                        onClick={() => setSelectedLetter('ALL')}
                        className={`px-2.5 py-1 text-[11px] font-black rounded-md transition-all shrink-0 uppercase tracking-wider ${
                          selectedLetter === 'ALL'
                            ? 'bg-[#166534] text-white shadow-xs'
                            : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                        }`}
                      >
                        All
                      </button>
                      {'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map(letter => (
                        <button
                          key={letter}
                          type="button"
                          onClick={() => setSelectedLetter(prev => prev === letter ? 'ALL' : letter)}
                          className={`size-6 flex items-center justify-center text-[11px] font-black rounded-md transition-all shrink-0 ${
                            selectedLetter === letter
                              ? 'bg-[#166534] text-white shadow-xs scale-105'
                              : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                          }`}
                        >
                          {letter}
                        </button>
                      ))}
                    </div>

                    {hasActiveFilters && (
                      <button
                        type="button"
                        onClick={resetAllFilters}
                        className="text-[11px] text-red-600 hover:text-red-800 font-black whitespace-nowrap px-2.5 py-1 bg-red-50 hover:bg-red-100 rounded-md transition-all shrink-0 ml-2"
                      >
                        Reset Filters
                      </button>
                    )}
                  </div>
                </div>

                {/* 2. Scrollable Product Cards Grid (Scrollbar placed directly between Products and Cart) */}
                <div
                  className="flex-1 overflow-y-auto pr-2 pt-3 custom-scrollbar min-h-0"
                  onScroll={(e) => {
                    const el = e.currentTarget;
                    if (el.scrollHeight - el.scrollTop <= el.clientHeight + 80) {
                      if (visibleCount < filteredProducts.length) {
                        setVisibleCount(prev => prev + 24);
                      }
                    }
                  }}
                >
                  <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-3 pt-1 pb-4">
                    {filteredProducts.slice(0, visibleCount).map((product) => {
                      const { totalSellable, allExpired, hasExpiredBatch } = getSellableStock(product);
                      const isUnsellable = totalSellable <= 0;
                      const imgInfo = getProductImage(product);

                      return (
                        <div
                          key={product.id}
                          onClick={() => !isUnsellable && addToCart(product)}
                          className={`bg-white rounded-xl border border-gray-200/90 shadow-2xs hover:shadow-md transition-all flex flex-col justify-between overflow-hidden p-3 group ${
                            isUnsellable ? 'opacity-60 cursor-not-allowed' : 'cursor-pointer'
                          }`}
                        >
                          {/* Pure White Background Image Container */}
                          <div className="h-32 w-full bg-white flex items-center justify-center p-2 mb-2 rounded-lg relative overflow-hidden">
                            <img
                              src={imgInfo.imageUrl}
                              alt={product.name}
                              className="h-full w-full object-contain mix-blend-multiply group-hover:scale-105 transition-transform duration-200"
                              loading="lazy"
                              onError={(e) => {
                                const target = e.currentTarget;
                                target.onerror = null;
                                target.src = imgInfo.fallbackUrl;
                              }}
                            />
                            {isRxProduct(product) && (
                              <span
                                className="absolute top-1.5 left-1.5 px-1.5 py-0.5 rounded text-[9px] font-black uppercase tracking-wider text-white shadow-2xs"
                                style={{ backgroundColor: '#dc2626' }}
                                title="Prescription Required"
                              >
                                Rx
                              </span>
                            )}
                            {allExpired ? (
                              <Badge variant="destructive" className="absolute top-1.5 right-1.5 text-[9px] font-black uppercase">EXPIRED</Badge>
                            ) : hasExpiredBatch ? (
                              <Badge variant="outline" className="absolute top-1.5 right-1.5 text-[9px] font-bold border-amber-500 text-amber-700 bg-amber-50">Has Expired Batch</Badge>
                            ) : null}
                          </div>

                          {/* Details */}
                          <div className="flex-1 flex flex-col">
                            <span className="text-[10px] font-bold text-teal-800 bg-teal-50 px-2 py-0.5 rounded-md inline-block w-fit mb-1">
                              {imgInfo.categoryTag}
                            </span>
                            <h4
                              className="font-bold text-sm text-gray-900 leading-snug line-clamp-2 min-h-[2.5rem] mb-0.5"
                              title={product.name}
                            >
                              {product.name.replace(/\*/g, '')}
                            </h4>
                            <p className="text-xs text-gray-400 font-medium mb-2.5 truncate">
                              {imgInfo.brandTag || 'Generic'}
                            </p>
                          </div>

                          {/* Price & Action */}
                          <div className="flex items-center justify-between pt-2 border-t border-gray-100 mt-auto">
                            <div>
                              <span className="text-base font-extrabold text-blue-700 block leading-tight">
                                ₱{product.price.toFixed(2)}
                              </span>
                              <span className={`text-[11px] font-bold block ${totalSellable > 20 ? 'text-gray-500' : totalSellable > 0 ? 'text-amber-600' : 'text-red-500'}`}>
                                {totalSellable > 0 ? `In Stock: ${totalSellable}+` : 'Out of Stock'}
                              </span>
                            </div>
                            <Button
                              size="sm"
                              disabled={isUnsellable}
                              onClick={(e) => {
                                e.stopPropagation();
                                addToCart(product);
                              }}
                              className="bg-[#166534] hover:bg-[#14532d] text-white font-bold text-xs px-3 py-1.5 h-8 rounded-lg shadow-2xs flex items-center gap-1 transition-transform active:scale-95"
                            >
                              <Plus className="size-3.5" />
                              Add
                            </Button>
                          </div>
                        </div>
                      );
                    })}
                  </div>

                  {filteredProducts.length === 0 && (
                    <div className="py-12 text-center text-gray-500 bg-gray-50/50 rounded-xl">
                      No products found matching your filters.
                    </div>
                  )}

                  {/* Scroll Down / Load More Indicator */}
                  {visibleCount < filteredProducts.length && (
                    <div className="py-3 text-center">
                      <button
                        type="button"
                        onClick={() => setVisibleCount(prev => prev + 24)}
                        className="text-xs font-bold text-[#166534] hover:text-[#14532d] hover:underline px-3.5 py-1.5 bg-emerald-50 rounded-lg inline-block transition-colors"
                      >
                        Showing {visibleCount} of {filteredProducts.length} • Scroll or click to load more
                      </button>
                    </div>
                  )}
                </div>

                {/* 3. Non-scrolling Footer Counter */}
                <div className="shrink-0 flex items-center justify-between pt-2.5 border-t border-gray-100 text-xs text-gray-500">
                  <div className="font-semibold text-gray-600">
                    Showing 1–{Math.min(visibleCount, filteredProducts.length)} of {filteredProducts.length} products
                  </div>
                  {visibleCount < filteredProducts.length ? (
                    <span className="text-[11px] text-[#166534] font-medium">Scroll down to view more</span>
                  ) : (
                    <span className="text-[11px] text-gray-400">All products loaded</span>
                  )}
                </div>
              </Card>
            </ErrorBoundary>
          </div>

          {/* CURRENT ORDER (CART) DRAWER - FIXED ON THE RIGHT */}
          <div className="lg:col-span-4 xl:col-span-4 2xl:col-span-3 flex flex-col h-full min-h-0 lg:sticky lg:top-0">
            <ErrorBoundary fallbackTitle="Current Order Error">
              <Card className="border border-gray-200/90 rounded-2xl overflow-hidden shadow-2xs bg-white flex flex-col h-full min-h-0">
                {/* Cart Header - Fixed */}
                <div className="shrink-0 p-4 border-b border-gray-100 flex items-center justify-between bg-white">
                  <div className="flex items-center gap-2">
                    <ShoppingCart className="size-5 text-[#166534]" />
                    <h3 className="font-extrabold text-lg text-gray-900">Current Order</h3>
                  </div>
                  <Button
                    variant="ghost"
                    size="sm"
                    onClick={clearCart}
                    className="text-xs font-bold text-emerald-800 bg-emerald-50 hover:bg-emerald-100 rounded-lg px-2.5 py-1 h-7"
                  >
                    New Sale
                  </Button>
                </div>

                {/* Scrollable Cart Items (Flexible height, scrolls if cart has many items) */}
                <div className="flex-1 overflow-y-auto p-4 space-y-3 divide-y divide-gray-100 custom-scrollbar min-h-0">
                  {cart.length > 0 ? (
                    cart.map((item) => (
                      <div key={item.product.id} className="pt-3 first:pt-0 space-y-2">
                        <div className="flex justify-between items-start gap-2">
                          <div className="flex-1 min-w-0">
                            <h4 className="font-bold text-sm text-gray-900 truncate" title={item.product.name}>
                              {item.product.name.replace(/\*/g, '')}
                            </h4>
                            <p className="text-[11px] text-gray-400 font-mono">SKU: {item.product.sku}</p>
                          </div>
                          <div className="flex items-center gap-2">
                            <span className="font-extrabold text-sm text-gray-900">
                              ₱{(item.product.price * item.quantity).toFixed(2)}
                            </span>
                            <button
                              onClick={() => removeFromCart(item.product.id)}
                              className="text-red-400 hover:text-red-600 transition-colors p-1"
                              title="Remove Item"
                            >
                              <Trash2 className="size-4" />
                            </button>
                          </div>
                        </div>

                        {/* Stepper */}
                        <div className="flex items-center justify-between">
                          <div className="inline-flex items-center rounded-lg border border-gray-200 bg-gray-50/80 p-0.5">
                            <button
                              type="button"
                              onClick={() => updateCartQuantity(item.product.id, Math.max(0, item.quantity - 1))}
                              className="size-7 flex items-center justify-center rounded-md bg-white text-gray-700 hover:bg-gray-100 shadow-2xs text-sm font-bold"
                            >
                              <Minus className="size-3" />
                            </button>
                            <span className="w-9 text-center font-extrabold text-xs text-gray-900">
                              {item.quantity}
                            </span>
                            <button
                              type="button"
                              onClick={() => updateCartQuantity(item.product.id, item.quantity + 1)}
                              className="size-7 flex items-center justify-center rounded-md bg-white text-gray-700 hover:bg-gray-100 shadow-2xs text-sm font-bold"
                            >
                              <Plus className="size-3" />
                            </button>
                          </div>
                          <span className="text-xs text-gray-400">₱{item.product.price.toFixed(2)} / pc</span>
                        </div>
                      </div>
                    ))
                  ) : (
                    <div className="py-12 text-center text-gray-400 flex flex-col items-center justify-center">
                      <ShoppingCart className="size-10 mb-2 stroke-1 text-gray-300" />
                      <p className="text-sm font-semibold text-gray-400">Order is empty</p>
                      <p className="text-xs text-gray-400 mt-0.5">Select products to add to current sale</p>
                    </div>
                  )}
                </div>

                {/* Totals & Checkout Section - Fixed at the bottom */}
                <div className="shrink-0 p-4 bg-gray-50/70 border-t border-gray-100 space-y-3">
                  <div className="space-y-1.5 text-xs text-gray-600">
                    <div className="flex justify-between">
                      <span>Subtotal</span>
                      <span className="font-bold text-gray-900">₱{(calculateTotal() / 1.12).toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Discount</span>
                      <span className="font-bold text-gray-900">₱0.00</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Tax (12%)</span>
                      <span className="font-bold text-gray-900">₱{(calculateTotal() - calculateTotal() / 1.12).toFixed(2)}</span>
                    </div>
                  </div>

                  <Separator className="bg-gray-200" />

                  {/* Grand Total */}
                  <div className="flex items-baseline justify-between">
                    <span className="font-extrabold text-base text-gray-800">Grand Total</span>
                    <span className="text-2xl font-black text-[#166534]">
                      ₱{calculateTotal().toFixed(2)}
                    </span>
                  </div>

                  {/* Payment Options */}
                  <div className="grid grid-cols-2 gap-2 pt-1">
                    <div>
                      <label className="text-[11px] font-bold text-gray-500 block mb-1">Payment Method</label>
                      <Select value={paymentMethod} onValueChange={setPaymentMethod}>
                        <SelectTrigger className="h-9 bg-white text-xs font-bold border-gray-200">
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="cash">Cash</SelectItem>
                          <SelectItem value="gcash">GCash</SelectItem>
                          <SelectItem value="maya">Maya</SelectItem>
                          <SelectItem value="card">Card</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>
                    <div>
                      <label className="text-[11px] font-bold text-gray-500 block mb-1">Amount Received</label>
                      <Input
                        type="number"
                        placeholder="0.00"
                        value={amountReceived}
                        onChange={(e) => setAmountReceived(e.target.value)}
                        className="h-9 bg-white text-xs font-bold border-gray-200"
                      />
                    </div>
                  </div>

                  {paymentMethod === 'cash' && amountReceived && (
                    <div className="flex justify-between items-center bg-emerald-50/80 px-3 py-1.5 rounded-lg border border-emerald-100 text-xs">
                      <span className="font-bold text-emerald-800 uppercase tracking-wider text-[10px]">Change</span>
                      <span className="font-black text-sm text-emerald-700">₱{calculateChange().toFixed(2)}</span>
                    </div>
                  )}

                  {/* Complete Sale Button */}
                  <Button
                    onClick={handleCheckout}
                    disabled={cart.length === 0 || (paymentMethod === 'cash' && (!amountReceived || calculateChange() < 0))}
                    className="w-full h-11 bg-[#166534] hover:bg-[#14532d] text-white font-extrabold text-sm rounded-xl shadow-md flex items-center justify-center gap-2 transition-transform active:scale-[0.99]"
                  >
                    <CreditCard className="size-4" />
                    Complete Sale
                  </Button>
                </div>
              </Card>
            </ErrorBoundary>
          </div>
        </div>

        {/* Transaction Summary Dialog - Desktop Details Style */}
        <Dialog open={!!completedTransaction} onOpenChange={(open) => !open && setCompletedTransaction(null)}>
          <DialogContent className="max-w-sm font-mono overflow-hidden flex flex-col items-center p-0 gap-0 border-none shadow-2xl bg-white">
            {/* Header Top Edge Decor */}
            <div className="w-full h-1 bg-gray-200" style={{ backgroundImage: 'linear-gradient(90deg, #f3f4f6 50%, transparent 50%)', backgroundSize: '10px 100%' }}></div>

            <div className="w-full p-8 flex flex-col">
              {/* Pharmacy Branding */}
              <div className="text-center mb-6">
                <h2 className="text-lg font-black tracking-tight text-gray-900 leading-tight uppercase">
                  Zoe Pharmacy & General Merchandise
                </h2>
                <p className="text-[10px] text-gray-500 mt-1 uppercase font-semibold leading-tight max-w-[280px] mx-auto">
                  40 Mata Cor, Manlunas Sts., Vab Brgy, 183, Pasay City, Metro Manila
                </p>
              </div>

              {/* Transaction Header Info */}
              <div className="flex flex-col gap-1 mb-4 border-y border-dashed border-gray-300 py-3 text-[10px]">
                <div className="flex justify-between">
                  <span className="text-gray-500 uppercase">TRANS ID:</span>
                  <span className="font-bold">{completedTransaction?.id}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-500 uppercase">DATE:</span>
                  <span>{completedTransaction ? new Date(completedTransaction.date).toLocaleString('en-US', { year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit', hour12: true }) : ''}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-gray-500 uppercase">CASHIER:</span>
                  <span className="uppercase">{completedTransaction?.cashier || 'Zoe Owner'}</span>
                </div>
              </div>

              {/* Items List - Scrollable */}
              <div className="space-y-4 mb-6">
                <div className="flex justify-between text-xs font-bold border-b border-dashed border-gray-200 pb-2">
                  <span className="uppercase">ITEM DESCRIPTION</span>
                  <span className="uppercase">PRICE</span>
                </div>
                <div className="space-y-3 max-h-48 overflow-y-auto pr-2 custom-scrollbar">
                  {completedTransaction?.items.map((item, idx) => (
                    <div key={idx} className="flex flex-col gap-1">
                      <div className="flex justify-between text-xs items-start">
                        <span className="font-bold flex-1 pr-4">{item.productName}</span>
                        <span className="font-bold">₱{(item.price * item.quantity).toFixed(2)}</span>
                      </div>
                      <div className="text-[10px] text-gray-400">
                        {item.quantity} units x ₱{item.price.toFixed(2)}
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Totals Section */}
              <div className="border-t-2 border-dashed border-gray-900 pt-4 space-y-2">
                <div className="flex justify-between text-sm font-black">
                  <span className="uppercase tracking-wider">TOTAL AMOUNT</span>
                  <span className="text-base">₱{completedTransaction?.total.toFixed(2)}</span>
                </div>

                {completedTransaction?.paymentMethod === 'cash' && (
                  <div className="space-y-1 mt-3 pt-3 border-t border-gray-100">
                    <div className="flex justify-between text-[11px] text-gray-600">
                      <span className="uppercase">CASH RECEIVED</span>
                      <span>₱{completedTransaction.amountReceived?.toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between text-sm font-black text-blue-700 bg-blue-50/50 p-2 rounded -mx-2 mt-1">
                      <span className="uppercase tracking-tighter">CHANGE DUE</span>
                      <span>₱{completedTransaction.change?.toFixed(2)}</span>
                    </div>
                  </div>
                )}
              </div>

              {/* Footer */}
              <div className="mt-8 text-center space-y-4">
                <div className="text-[10px] text-gray-400 space-y-1">
                  <p className="uppercase font-bold tracking-[0.2em] text-gray-600">Thank you for your trust!</p>
                  <p>--- NO REFUND WITHOUT TRANSACTION DETAILS ---</p>
                  <p className="italic">This is not an official transaction record.</p>
                </div>

                <div className="grid grid-cols-1 gap-2">
                  <Button
                    variant="outline"
                    className="w-full border-gray-300 rounded-none h-12 font-bold uppercase tracking-widest text-xs flex items-center justify-center gap-2"
                    onClick={() => completedTransaction && generatePDF(completedTransaction)}
                  >
                    <FileText className="size-4" />
                    Download Receipt
                  </Button>
                  <Button
                    className="w-full bg-gray-900 hover:bg-black text-white rounded-none h-12 font-bold uppercase tracking-widest text-xs"
                    onClick={() => setCompletedTransaction(null)}
                  >
                    Start New Transaction
                  </Button>
                </div>
              </div>
            </div>

            {/* Footer Bottom Edge Decor */}
            <div className="w-full h-2 bg-gray-200" style={{ backgroundImage: 'linear-gradient(45deg, transparent 33.333%, #fff 33.333%, #fff 66.666%, transparent 66.666%), linear-gradient(-45deg, transparent 33.333%, #fff 33.333%, #fff 66.666%, transparent 66.666%)', backgroundSize: '12px 24px' }}></div>
          </DialogContent>
        </Dialog>
      </div>
    </ErrorBoundary >
  );
}

