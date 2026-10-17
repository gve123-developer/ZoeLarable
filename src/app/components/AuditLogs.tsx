import { useState, useEffect, useMemo } from 'react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/app/components/ui/card';
import { Button } from '@/app/components/ui/button';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/app/components/ui/table';
import { Badge } from '@/app/components/ui/badge';
import { User } from '@/app/App';
import { ErrorBoundary } from '@/app/components/ErrorBoundary';
import {
    ShieldCheck,
    RefreshCw,
    Info,
    ClipboardList,
    Search,
    Calendar,
    ChevronLeft,
    ChevronRight,
    Eye,
    Clock,
    UserCheck,
    ShoppingCart,
    PackagePlus,
    PackageX,
    RotateCcw,
    Lock,
    KeyRound,
    UserCog,
    FileText,
    Copy,
    Check,
    SlidersHorizontal,
    Boxes,
    Layers
} from 'lucide-react';
import { Input } from '@/app/components/ui/input';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/app/components/ui/select';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from '@/app/components/ui/dialog';

interface AuditLogsProps {
    currentUser: User;
}

interface ParsedAuditDetail {
    category: 'pos_sale' | 'void' | 'inventory_add' | 'inventory_update' | 'inventory_delete' | 'auth' | 'user_mgmt' | 'report' | 'other';
    saleId?: string;
    total?: string;
    paid?: string;
    change?: string;
    method?: string;
    discount?: string;
    items?: Array<{
        name: string;
        sku?: string | null;
        qty: number;
        unitPrice?: string | null;
        total?: string | null;
    }>;
    txId?: string;
    refund?: string;
    restored?: string;
    remaining?: string;
    isFullVoid?: boolean;
    productName?: string;
    sku?: string;
    categoryName?: string;
    batchNumber?: string;
    quantity?: string;
    expiryDate?: string;
    cost?: string;
    price?: string;
    supplier?: string;
    reorderLevel?: string;
    activeBatch?: string;
    newBatchTotal?: string;
    queueBatches?: string;
    totalCombinedStock?: string;
    incomingBatch?: string;
    isDispose?: boolean;
    reason?: string;
    lossCost?: string;
    username?: string;
    isAuthSuccess?: boolean;
    isLockout?: boolean;
    attemptInfo?: string;
    authNote?: string;
    targetUser?: string;
    targetName?: string;
    targetRole?: string;
    targetEmail?: string;
    passwordChanged?: boolean;
    reportType?: string;
    reportPeriod?: string;
    itemCount?: string;
}

function parseAuditLog(log: any): ParsedAuditDetail {
    const text = String(log?.details || '').trim();
    const action = String(log?.action || '').trim();

    // 1. POS Sale
    if (/Sale/i.test(action)) {
        const saleId = text.match(/Sale\s*#?(\d+)/i)?.[1];
        const total = text.match(/Total:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const paid = text.match(/Paid:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const change = text.match(/Change:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const method = text.match(/Method:\s*([\w\s-]+?)(?=[,\)]|$)/i)?.[1]?.trim();
        const discount = text.match(/Discount:\s*([^,\)]+)/i)?.[1]?.trim();

        let items: ParsedAuditDetail['items'] = [];
        const itemsSection = text.match(/Items(?:\s*\(\d+\))?:\s*(.*)$/i);
        if (itemsSection && itemsSection[1]) {
            const rawItems = itemsSection[1].split(/;\s*|,\s*(?=[A-Za-z0-9])/);
            items = rawItems.map(raw => {
                const m = raw.match(/^(.*?)(?:\s*\[SKU:\s*([^\]]+)\])?\s*x(\d+)(?:\s*@\s*([₱P]?[\d,]+(?:\.\d+)?))?(?:\s*=\s*([₱P]?[\d,]+(?:\.\d+)?))?/i);
                if (m) {
                    return {
                        name: m[1].trim(),
                        sku: m[2] && m[2] !== 'N/A' ? m[2].trim() : null,
                        qty: m[3] ? parseInt(m[3], 10) : 1,
                        unitPrice: m[4] || null,
                        total: m[5] || null
                    };
                }
                return { name: raw.trim(), sku: null, qty: 1, unitPrice: null, total: null };
            }).filter(i => i.name.length > 0);
        }
        return { category: 'pos_sale', saleId, total, paid, change, method, discount, items };
    }

    // 2. Void / Partial Void
    if (/Void/i.test(action)) {
        const txId = text.match(/Transaction\s*#?(\d+)/i)?.[1];
        const refund = text.match(/(?:Refunded|Sum):\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const restored = text.match(/Restored items:\s*([^.]+?)(?=\.\s*Remaining|\.\s*Order|$)/i)?.[1]?.trim();
        const remaining = text.match(/Remaining Total:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const change = text.match(/Updated Change:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const isFullVoid = /completely voided|Full Void/i.test(text);
        return { category: 'void', txId, refund, restored, remaining, change, isFullVoid };
    }

    // 3. Inventory Add
    if (action === 'Inventory Add' || action === 'Add Product' || /Added (?:new )?product/i.test(text)) {
        const productName = text.match(/Added (?:new )?product:\s*([^\[\(|]+)/i)?.[1]?.trim() || text.match(/Added product:\s*([^\[\(|]+)/i)?.[1]?.trim();
        const sku = (text.match(/\[SKU:\s*([^\]]+)\]/i)?.[1] || text.match(/\(SKU:\s*([^\)]+)\)/i)?.[1])?.trim();
        const categoryName = text.match(/Category:\s*([^\]\|,]+)/i)?.[1]?.trim();
        const batchNumber = text.match(/(?:Initial (?:Old )?Batch|Batch):\s*([^\s\(|,]+)/i)?.[1]?.trim();
        const quantity = text.match(/(\d+)\s*pcs/i)?.[1] || text.match(/Initial Qty:\s*(\d+)/i)?.[1];
        const expiryDate = text.match(/EXP:\s*([^\),|]+)/i)?.[1]?.trim();
        const cost = text.match(/Cost:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const price = text.match(/Price:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const supplier = text.match(/Supplier:\s*([^\),|]+)/i)?.[1]?.trim();
        const reorderLevel = text.match(/Reorder Level:\s*(\d+)/i)?.[1];
        return { category: 'inventory_add', productName, sku, categoryName, batchNumber, quantity, expiryDate, cost, price, supplier, reorderLevel };
    }

    // 4. Inventory Update / Edit
    if (/Inventory Update|Edit Product|Batch Rotation/i.test(action) || /Updated product|Promoted \d+ units/i.test(text)) {
        const productName = text.match(/Updated [Pp]roduct:\s*([^\[\|]+)/i)?.[1]?.trim() || text.match(/for\s+([^\[\|]+)/i)?.[1]?.trim();
        const sku = text.match(/\[SKU:\s*([^\]]+)\]/i)?.[1]?.trim();
        const incomingBatch = text.match(/Added Incoming Batch:\s*([^\|\n]+)/i)?.[1]?.trim();
        const activeBatch = text.match(/Active Old Batch:\s*([^\|\n]+)/i)?.[1]?.trim();
        const newBatchTotal = text.match(/New Batch Total:\s*(\d+)\s*pcs/i)?.[1];
        const queueBatches = text.match(/(?:Queued Batches|Queue)(?:\s*\(\d+\))?:\s*([^\|\n]+)/i)?.[1]?.trim();
        const totalCombinedStock = text.match(/Total Combined Stock:\s*(\d+)\s*pcs/i)?.[1];
        const price = text.match(/Price:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        return { category: 'inventory_update', productName, sku, incomingBatch, activeBatch, newBatchTotal, queueBatches, totalCombinedStock, price };
    }

    // 5. Delete / Archive / Dispose
    if (/Delete|Archive|Dispose/i.test(action)) {
        const isDispose = /Dispose/i.test(action);
        const productName = text.match(/(?:Deleted product|Moved to recycle bin|Disposed \d+ unit\(s\) of)\s*:?\s*([^\[\|\(]+)/i)?.[1]?.trim();
        const sku = text.match(/\[SKU:\s*([^\]]+)\]/i)?.[1]?.trim();
        const quantity = text.match(/(?:Disposed\s*(\d+)|Quantity:\s*(\d+)|\(\s*(\d+)\s*pcs)/i)?.[1] || text.match(/(\d+)\s*pcs/i)?.[1];
        const reason = text.match(/Reason:\s*([^\|\)\n]+)/i)?.[1]?.trim();
        const lossCost = text.match(/Loss Cost:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        const price = text.match(/Price:\s*([₱P]?[\d,]+(?:\.\d+)?)/i)?.[1];
        return { category: 'inventory_delete', isDispose, productName, sku, quantity, reason, lossCost, price };
    }

    // 6. Security / Auth
    if (/Login|Logout/i.test(action)) {
        const isAuthSuccess = action === 'Login';
        const isLockout = /Lockout/i.test(action) || /lock/i.test(text);
        const username = text.match(/username:?\s*\"?([^\"\s.]+)\"?/i)?.[1] || text.match(/User\s*\"?([^\"\s]+)\"?/i)?.[1];
        const attempts = text.match(/Attempt\s*(\d+\s*of\s*\d+)/i);
        const attemptInfo = attempts ? attempts[1] : undefined;
        const authNote = text.match(/Status:\s*([^.\n]+)/i)?.[1]?.trim();
        return { category: 'auth', isAuthSuccess, isLockout, username, attemptInfo, authNote };
    }

    // 7. User Management
    if (/User\s*(Added|Updated|Deleted)/i.test(action)) {
        const targetUser = text.match(/(?:user:?\s*\"?|user\s*\")([^\"\|\n]+)/i)?.[1]?.trim();
        const targetName = text.match(/Full Name:\s*([^\|\n]+)/i)?.[1]?.trim();
        const targetRole = text.match(/Role:\s*([^\|\n]+)/i)?.[1]?.trim();
        const targetEmail = text.match(/Email:\s*([^\|\n]+)/i)?.[1]?.trim();
        const passwordChanged = /password/i.test(text);
        return { category: 'user_mgmt', targetUser, targetName, targetRole, targetEmail, passwordChanged };
    }

    // 8. Reports & Purchase Orders
    if (/Report|Purchase Order/i.test(action)) {
        const reportType = text.match(/Downloaded\s+([^(\n]+?)(?=\s*\(|$)/i)?.[1]?.trim() || action;
        const reportPeriod = text.match(/\(([^)]+)\)/i)?.[1]?.trim();
        const itemCount = text.match(/containing\s*(\d+)\s*items/i)?.[1];
        return { category: 'report', reportType, reportPeriod, itemCount };
    }

    return { category: 'other' };
}

function getRelativeTime(date: Date): string {
    const now = new Date();
    const diffMs = now.getTime() - date.getTime();
    if (diffMs < 0) return 'Just now';
    const diffSec = Math.floor(diffMs / 1000);
    if (diffSec < 60) return `${diffSec}s ago`;
    const diffMin = Math.floor(diffSec / 60);
    if (diffMin < 60) return `${diffMin}m ago`;
    const diffHour = Math.floor(diffMin / 60);
    if (diffHour < 24) return `${diffHour}h ago`;
    const diffDay = Math.floor(diffHour / 24);
    if (diffDay < 30) return `${diffDay}d ago`;
    const diffMonth = Math.floor(diffDay / 30);
    if (diffMonth < 12) return `${diffMonth}mo ago`;
    return `${Math.floor(diffMonth / 12)}y ago`;
}

export function AuditLogs({ currentUser }: AuditLogsProps) {
    const [auditLogs, setAuditLogs] = useState<any[]>([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [dateFilter, setDateFilter] = useState('today');
    const [actionFilter, setActionFilter] = useState('all');
    const [isLoading, setIsLoading] = useState(false);
    const [currentPage, setCurrentPage] = useState(1);
    const [selectedLog, setSelectedLog] = useState<any | null>(null);
    const [copiedChronicle, setCopiedChronicle] = useState(false);
    const itemsPerPage = 15;

    const fetchLogs = async () => {
        setIsLoading(true);
        try {
            const res = await fetch('/api/audit_logs.php');
            const data = await res.json();
            setAuditLogs(Array.isArray(data) ? data : []);
        } catch (e) {
            console.error("Audit Logs fetch error:", e);
        } finally {
            setIsLoading(false);
        }
    };

    useEffect(() => {
        fetchLogs();
        const interval = setInterval(fetchLogs, 5000);
        return () => clearInterval(interval);
    }, []);

    // Reset to page 1 when filters change
    useEffect(() => {
        setCurrentPage(1);
    }, [searchTerm, dateFilter, actionFilter]);

    // Handle copying chronicle text
    const handleCopyChronicle = (text: string) => {
        navigator.clipboard.writeText(text);
        setCopiedChronicle(true);
        setTimeout(() => setCopiedChronicle(false), 2000);
    };

    const stats = useMemo(() => {
        let sales = 0;
        let inventory = 0;
        let security = 0;
        let users = 0;

        auditLogs.forEach(l => {
            const act = String(l.action || '');
            if (act.includes('Sale') || act.includes('Void')) sales++;
            else if (act.includes('Product') || act.includes('Inventory') || act.includes('Rotation')) inventory++;
            else if (act.includes('Login') || act.includes('Logout') || act.includes('PASSCODE')) security++;
            else if (act.includes('User')) users++;
        });

        return { total: auditLogs.length, sales, inventory, security, users };
    }, [auditLogs]);

    const filteredLogsList = useMemo(() => {
        return auditLogs.filter(log => {
            const staff = String(log.userName || '').toLowerCase();
            const act = String(log.action || '').toLowerCase();
            const details = String(log.details || '').toLowerCase();
            const searchLower = searchTerm.toLowerCase();

            const matchesSearch = staff.includes(searchLower) || act.includes(searchLower) || details.includes(searchLower);
            if (!matchesSearch) return false;

            // Action Filter
            if (actionFilter !== 'all') {
                if (actionFilter === 'sales' && !log.action.includes('Sale') && !log.action.includes('Void')) return false;
                if (actionFilter === 'inventory' && !log.action.includes('Inventory') && !log.action.includes('Product') && !log.action.includes('Rotation')) return false;
                if (actionFilter === 'security' && !log.action.includes('Login') && !log.action.includes('Logout') && !log.action.includes('PASSCODE')) return false;
                if (actionFilter === 'users' && !log.action.includes('User')) return false;
                if (actionFilter === 'reports' && !log.action.includes('Report') && !log.action.includes('Purchase Order')) return false;
            }

            // Date Filter
            if (dateFilter === 'all') return true;

            const dateStr = log.timestamp || log.created_at;
            if (!dateStr) return true;
            const logDate = new Date(dateStr.includes('T') ? dateStr : dateStr.replace(' ', 'T'));
            if (isNaN(logDate.getTime())) return true;

            const now = new Date();
            const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            const logDay = new Date(logDate.getFullYear(), logDate.getMonth(), logDate.getDate());

            if (dateFilter === 'today') {
                return logDay.getTime() === today.getTime();
            }
            if (dateFilter === 'weekly') {
                const lastWeek = new Date(today);
                lastWeek.setDate(today.getDate() - 7);
                return logDate >= lastWeek && logDate <= now;
            }
            if (dateFilter === 'monthly') {
                return logDate.getMonth() === now.getMonth() && logDate.getFullYear() === now.getFullYear();
            }
            if (dateFilter === 'yearly') {
                return logDate.getFullYear() === now.getFullYear();
            }
            return true;
        });
    }, [auditLogs, searchTerm, dateFilter, actionFilter]);

    const totalPages = Math.max(1, Math.ceil(filteredLogsList.length / itemsPerPage));
    const paginatedLogs = filteredLogsList.slice(
        (currentPage - 1) * itemsPerPage,
        currentPage * itemsPerPage
    );

    const getActionBadge = (action: string) => {
        const act = String(action || '');
        if (act.includes('Sale')) {
            return <Badge className="bg-emerald-100 text-emerald-800 border-emerald-300 font-bold hover:bg-emerald-100"><ShoppingCart className="size-3 mr-1" /> POS Sale</Badge>;
        }
        if (act.includes('Void')) {
            return <Badge className="bg-rose-100 text-rose-800 border-rose-300 font-bold hover:bg-rose-100"><RotateCcw className="size-3 mr-1" /> {act}</Badge>;
        }
        if (act.includes('Add Product') || act.includes('Inventory Add')) {
            return <Badge className="bg-teal-100 text-teal-800 border-teal-300 font-bold hover:bg-teal-100"><PackagePlus className="size-3 mr-1" /> Add Product</Badge>;
        }
        if (act.includes('Edit Product') || act.includes('Inventory Update') || act.includes('Rotation')) {
            return <Badge className="bg-sky-100 text-sky-800 border-sky-300 font-bold hover:bg-sky-100"><Layers className="size-3 mr-1" /> Update Product</Badge>;
        }
        if (act.includes('Delete') || act.includes('Archive') || act.includes('Dispose')) {
            return <Badge className="bg-amber-100 text-amber-800 border-amber-300 font-bold hover:bg-amber-100"><PackageX className="size-3 mr-1" /> {act}</Badge>;
        }
        if (act.includes('User')) {
            return <Badge className="bg-purple-100 text-purple-800 border-purple-300 font-bold hover:bg-purple-100"><UserCog className="size-3 mr-1" /> {act}</Badge>;
        }
        if (act.includes('Login Failed') || act.includes('Lockout')) {
            return <Badge className="bg-red-100 text-red-800 border-red-300 font-bold hover:bg-red-100"><Lock className="size-3 mr-1" /> {act}</Badge>;
        }
        if (act.includes('Login') || act.includes('Logout')) {
            return <Badge className="bg-indigo-100 text-indigo-800 border-indigo-300 font-bold hover:bg-indigo-100"><KeyRound className="size-3 mr-1" /> {act}</Badge>;
        }
        if (act.includes('Report') || act.includes('Purchase Order')) {
            return <Badge className="bg-slate-100 text-slate-800 border-slate-300 font-bold hover:bg-slate-100"><FileText className="size-3 mr-1" /> {act}</Badge>;
        }
        return <Badge className="bg-gray-100 text-gray-800 border-gray-300 font-bold hover:bg-gray-100">{act}</Badge>;
    };

    const parsedModalData = useMemo(() => {
        if (!selectedLog) return null;
        return parseAuditLog(selectedLog);
    }, [selectedLog]);

    const modalTimestamp = useMemo(() => {
        if (!selectedLog) return { fullDate: '', time: '', relative: '' };
        const ts = selectedLog.timestamp || selectedLog.created_at || '';
        const d = new Date(ts.includes('T') ? ts : ts.replace(' ', 'T'));
        if (isNaN(d.getTime())) return { fullDate: ts, time: '', relative: '' };

        return {
            fullDate: d.toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }),
            time: d.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true }),
            relative: getRelativeTime(d)
        };
    }, [selectedLog]);

    return (
        <ErrorBoundary fallbackTitle="Audit Logs Module Error">
            <div className="space-y-6">
                {/* Top Title & Quick Refresh Strip */}
                <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                    <div>
                        <h2 className="text-2xl font-black text-gray-900 tracking-tight flex items-center gap-2.5">
                            <div className="p-2 bg-emerald-50 text-[#54b768] rounded-xl border border-emerald-100">
                                <ShieldCheck className="size-6 text-[#54b768]" />
                            </div>
                            System Audit Trail & Compliance
                        </h2>
                        <p className="text-xs sm:text-sm text-gray-600 font-medium mt-1">
                            Complete, transparent chronicle of all pharmacy sales, inventory adjustments, and security logs
                        </p>
                    </div>

                    <div className="flex items-center gap-2">
                        <Button
                            variant="outline"
                            size="sm"
                            className="bg-white border-emerald-200 text-emerald-800 hover:bg-emerald-50 font-bold h-10 px-4 shadow-xs"
                            onClick={fetchLogs}
                            disabled={isLoading}
                        >
                            <RefreshCw className={`size-4 mr-2 text-[#54b768] ${isLoading ? 'animate-spin' : ''}`} />
                            Refresh Live Log
                        </Button>
                    </div>
                </div>

                {/* KPI Summary Cards - Zoe Green / Emerald Theme */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-4">
                    <Card className="bg-white border border-emerald-100 shadow-xs hover:border-emerald-200 transition-all">
                        <CardContent className="p-4 flex items-center justify-between">
                            <div>
                                <p className="text-[11px] font-bold uppercase tracking-wider text-gray-500">Total Activities</p>
                                <p className="text-2xl font-black text-gray-900 mt-0.5">{stats.total}</p>
                                <p className="text-[10px] text-emerald-600 font-semibold mt-0.5">Chronicle records</p>
                            </div>
                            <div className="size-11 rounded-xl bg-emerald-50 text-[#54b768] border border-emerald-200/60 flex items-center justify-center">
                                <ClipboardList className="size-5" />
                            </div>
                        </CardContent>
                    </Card>

                    <Card className="bg-white border border-emerald-100 shadow-xs hover:border-emerald-200 transition-all">
                        <CardContent className="p-4 flex items-center justify-between">
                            <div>
                                <p className="text-[11px] font-bold uppercase tracking-wider text-gray-500">POS Sales & Voids</p>
                                <p className="text-2xl font-black text-emerald-700 mt-0.5">{stats.sales}</p>
                                <p className="text-[10px] text-gray-500 font-semibold mt-0.5">Cashier checkouts</p>
                            </div>
                            <div className="size-11 rounded-xl bg-emerald-100/70 text-emerald-800 border border-emerald-200 flex items-center justify-center">
                                <ShoppingCart className="size-5" />
                            </div>
                        </CardContent>
                    </Card>

                    <Card className="bg-white border border-emerald-100 shadow-xs hover:border-emerald-200 transition-all">
                        <CardContent className="p-4 flex items-center justify-between">
                            <div>
                                <p className="text-[11px] font-bold uppercase tracking-wider text-gray-500">Inventory Changes</p>
                                <p className="text-2xl font-black text-blue-700 mt-0.5">{stats.inventory}</p>
                                <p className="text-[10px] text-gray-500 font-semibold mt-0.5">Stock adds & updates</p>
                            </div>
                            <div className="size-11 rounded-xl bg-blue-50 text-blue-600 border border-blue-200 flex items-center justify-center">
                                <Boxes className="size-5" />
                            </div>
                        </CardContent>
                    </Card>

                    <Card className="bg-white border border-emerald-100 shadow-xs hover:border-emerald-200 transition-all">
                        <CardContent className="p-4 flex items-center justify-between">
                            <div>
                                <p className="text-[11px] font-bold uppercase tracking-wider text-gray-500">Security & Users</p>
                                <p className="text-2xl font-black text-purple-700 mt-0.5">{stats.security + stats.users}</p>
                                <p className="text-[10px] text-gray-500 font-semibold mt-0.5">Logins & access</p>
                            </div>
                            <div className="size-11 rounded-xl bg-purple-50 text-purple-600 border border-purple-200 flex items-center justify-center">
                                <Lock className="size-5" />
                            </div>
                        </CardContent>
                    </Card>
                </div>

                {/* Filters & Search Toolbar - Light & Clean Theme */}
                <div className="bg-white p-3.5 sm:p-4 rounded-xl border border-gray-200 shadow-xs flex flex-col md:flex-row items-center justify-between gap-3">
                    <div className="relative w-full md:w-80">
                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 size-4 text-gray-400" />
                        <Input
                            placeholder="Search staff, product, SKU, action, invoice..."
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            className="pl-9 bg-gray-50/70 border-gray-200 h-10 text-xs sm:text-sm focus:bg-white"
                        />
                        {searchTerm && (
                            <button
                                onClick={() => setSearchTerm('')}
                                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 text-xs font-bold"
                            >
                                ✕
                            </button>
                        )}
                    </div>

                    <div className="flex flex-wrap items-center gap-2.5 w-full md:w-auto">
                        {/* Action Category Filter */}
                        <div className="flex items-center gap-1.5 bg-gray-50 border border-gray-200 px-2.5 py-1.5 rounded-lg text-xs font-bold text-gray-700">
                            <SlidersHorizontal className="size-3.5 text-gray-500" />
                            <Select value={actionFilter} onValueChange={setActionFilter}>
                                <SelectTrigger className="w-[140px] border-none shadow-none h-6 p-0 text-xs font-bold focus:ring-0 bg-transparent text-gray-800">
                                    <SelectValue placeholder="All Categories" />
                                </SelectTrigger>
                                <SelectContent className="bg-white text-gray-900 font-medium text-xs">
                                    <SelectItem value="all">All Activities</SelectItem>
                                    <SelectItem value="sales">POS Sales & Voids</SelectItem>
                                    <SelectItem value="inventory">Inventory (Add/Edit/Del)</SelectItem>
                                    <SelectItem value="security">Security & Logins</SelectItem>
                                    <SelectItem value="users">User Accounts</SelectItem>
                                    <SelectItem value="reports">Reports & POs</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>

                        {/* Date Range Filter */}
                        <div className="flex items-center gap-1.5 bg-gray-50 border border-gray-200 px-2.5 py-1.5 rounded-lg text-xs font-bold text-gray-700">
                            <Calendar className="size-3.5 text-emerald-600" />
                            <Select value={dateFilter} onValueChange={setDateFilter}>
                                <SelectTrigger className="w-[130px] border-none shadow-none h-6 p-0 text-xs font-bold focus:ring-0 bg-transparent text-gray-800">
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent className="bg-white text-gray-900 font-medium text-xs">
                                    <SelectItem value="today">Today Activity</SelectItem>
                                    <SelectItem value="weekly">Last 7 Days</SelectItem>
                                    <SelectItem value="monthly">This Month</SelectItem>
                                    <SelectItem value="yearly">This Year</SelectItem>
                                    <SelectItem value="all">All Time History</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                    </div>
                </div>

                {/* Main Audit Records Table - Clean, Connected to System Colors */}
                <Card className="border border-gray-200/90 shadow-sm bg-white overflow-hidden rounded-xl">
                    <CardHeader className="bg-emerald-50/60 border-b border-emerald-100 py-3.5 px-6 flex flex-row items-center justify-between gap-4">
                        <div className="flex items-center gap-2.5">
                            <span className="size-2.5 rounded-full bg-[#54b768] inline-block animate-pulse"></span>
                            <div>
                                <CardTitle className="text-sm font-black uppercase tracking-wider text-emerald-950">Audit Activity Register</CardTitle>
                                <CardDescription className="text-emerald-700 font-medium text-xs">
                                    Showing {filteredLogsList.length} recorded events matching active criteria
                                </CardDescription>
                            </div>
                        </div>

                        <Badge variant="outline" className="bg-white text-emerald-800 border-emerald-300 font-bold text-xs py-1 px-3">
                            Immutable Ledger
                        </Badge>
                    </CardHeader>

                    <CardContent className="p-0">
                        <div className="min-h-[480px] overflow-x-auto w-full">
                            <Table className="min-w-[850px]">
                                <TableHeader className="bg-gray-50/80 border-b border-gray-200 text-gray-700">
                                    <TableRow>
                                        <TableHead className="w-[16%] font-black uppercase text-[10px] tracking-wider text-gray-600 py-3 pl-6">Staff Member</TableHead>
                                        <TableHead className="w-[16%] font-black uppercase text-[10px] tracking-wider text-gray-600 py-3 text-center">Action Category</TableHead>
                                        <TableHead className="w-[42%] font-black uppercase text-[10px] tracking-wider text-gray-600 py-3">Audit Chronicle Summary</TableHead>
                                        <TableHead className="w-[16%] font-black uppercase text-[10px] tracking-wider text-gray-600 py-3 text-right">Date & Time</TableHead>
                                        <TableHead className="w-[10%] font-black uppercase text-[10px] tracking-wider text-gray-600 py-3 text-center pr-6">Action</TableHead>
                                    </TableRow>
                                </TableHeader>
                                <TableBody className="divide-y divide-gray-100">
                                    {paginatedLogs.length > 0 ? (
                                        paginatedLogs.map((log) => {
                                            const ts = log.timestamp || log.created_at || '';
                                            const d = new Date(ts.includes('T') ? ts : ts.replace(' ', 'T'));
                                            const isValidDate = !isNaN(d.getTime());

                                            return (
                                                <TableRow
                                                    key={log.id}
                                                    onClick={() => setSelectedLog(log)}
                                                    className="hover:bg-emerald-50/40 transition-colors cursor-pointer group"
                                                >
                                                    <TableCell className="py-3 pl-6 font-bold text-gray-900 text-xs">
                                                        <div className="flex items-center gap-2">
                                                            <div className="size-7 bg-emerald-100 text-[#54b768] font-black rounded-lg flex items-center justify-center text-xs shrink-0 border border-emerald-200">
                                                                {(log.userName || 'U').substring(0, 1).toUpperCase()}
                                                            </div>
                                                            <div className="truncate">
                                                                <p className="truncate max-w-[130px] font-bold text-gray-900">{log.userName || 'System'}</p>
                                                            </div>
                                                        </div>
                                                    </TableCell>

                                                    <TableCell className="py-3 text-center">
                                                        {getActionBadge(log.action)}
                                                    </TableCell>

                                                    <TableCell className="py-3 text-[11px] text-gray-700 font-medium group-hover:text-gray-900">
                                                        <p className="truncate max-w-[360px] lg:max-w-[480px]" title={log.details}>
                                                            {log.details}
                                                        </p>
                                                    </TableCell>

                                                    <TableCell className="py-3 text-right whitespace-nowrap">
                                                        {isValidDate ? (
                                                            <div>
                                                                <p className="text-[11px] font-bold text-gray-800 font-mono">
                                                                    {d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                                                                </p>
                                                                <p className="text-[10px] text-gray-500 font-mono">
                                                                    {d.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', hour12: true })}
                                                                </p>
                                                            </div>
                                                        ) : (
                                                            <span className="text-[11px] text-gray-400 font-mono">{ts}</span>
                                                        )}
                                                    </TableCell>

                                                    <TableCell className="py-3 pr-6 text-center">
                                                        <Button
                                                            variant="outline"
                                                            size="sm"
                                                            onClick={(e) => { e.stopPropagation(); setSelectedLog(log); }}
                                                            className="h-7 px-2.5 text-[11px] font-bold bg-white text-emerald-700 border-emerald-200 hover:bg-emerald-50 hover:text-emerald-900 rounded-md flex items-center gap-1 mx-auto shadow-2xs"
                                                        >
                                                            <Eye className="size-3.5 text-[#54b768]" />
                                                            <span>View</span>
                                                        </Button>
                                                    </TableCell>
                                                </TableRow>
                                            );
                                        })
                                    ) : (
                                        <TableRow>
                                            <TableCell colSpan={5} className="py-24 text-center">
                                                <div className="flex flex-col items-center gap-3 text-gray-400">
                                                    <div className="p-4 bg-emerald-50 rounded-full border border-emerald-100 text-[#54b768]">
                                                        <Info className="size-10" />
                                                    </div>
                                                    <div className="space-y-1">
                                                        <p className="font-black text-gray-700 text-base">No Audit Records Found</p>
                                                        <p className="text-xs text-gray-500">No events matched your current search filters</p>
                                                    </div>
                                                </div>
                                            </TableCell>
                                        </TableRow>
                                    )}
                                </TableBody>
                            </Table>
                        </div>

                        {/* Pagination Footer - System Clean Design */}
                        <div className="bg-gray-50 border-t border-gray-200 px-6 py-3.5 flex flex-col sm:flex-row items-center justify-between gap-4">
                            <div className="text-xs text-gray-600 font-medium">
                                Showing <span className="text-gray-900 font-bold">{filteredLogsList.length === 0 ? 0 : ((currentPage - 1) * itemsPerPage) + 1}</span> to <span className="text-gray-900 font-bold">{Math.min(currentPage * itemsPerPage, filteredLogsList.length)}</span> of <span className="text-gray-900 font-bold">{filteredLogsList.length}</span> actions
                            </div>

                            <div className="flex items-center gap-2">
                                <Button
                                    variant="outline"
                                    size="sm"
                                    onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                                    disabled={currentPage === 1}
                                    className="bg-white border-gray-200 text-xs font-bold hover:bg-gray-100 disabled:opacity-40"
                                >
                                    <ChevronLeft className="size-3.5 mr-1" />
                                    Previous
                                </Button>

                                <div className="hidden sm:flex items-center gap-1">
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
                                                {start > 1 && <span className="text-gray-400 px-1 text-xs">...</span>}
                                                {pages.map(page => (
                                                    <Button
                                                        key={page}
                                                        variant={currentPage === page ? "default" : "outline"}
                                                        size="sm"
                                                        onClick={() => setCurrentPage(page)}
                                                        className={`size-8 p-0 font-bold text-xs ${currentPage === page ? "bg-[#54b768] hover:bg-[#469e57] text-white" : "bg-white border-gray-200 text-gray-700"}`}
                                                    >
                                                        {page}
                                                    </Button>
                                                ))}
                                                {end < totalPages && <span className="text-gray-400 px-1 text-xs">...</span>}
                                            </>
                                        );
                                    })()}
                                </div>

                                <Button
                                    variant="outline"
                                    size="sm"
                                    onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                                    disabled={currentPage >= totalPages}
                                    className="bg-white border-gray-200 text-xs font-bold hover:bg-gray-100 disabled:opacity-40"
                                >
                                    Next
                                    <ChevronRight className="size-3.5 ml-1" />
                                </Button>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Audit Action Detailed Chronicle Modal - Clean, Readable, Zoe Theme */}
                <Dialog open={!!selectedLog} onOpenChange={(open) => !open && setSelectedLog(null)}>
                    <DialogContent className="max-w-2xl bg-white p-6 rounded-2xl shadow-2xl border border-gray-200 overflow-hidden max-h-[90vh] overflow-y-auto">
                        {selectedLog && (
                            <div className="space-y-5">
                                {/* Header with Action Badge */}
                                <DialogHeader className="pb-3 border-b border-gray-100 text-left">
                                    <div className="flex items-start justify-between gap-3">
                                        <div className="flex items-center gap-3">
                                            <div className="size-11 rounded-xl bg-emerald-100/80 text-[#54b768] border border-emerald-200 flex items-center justify-center shrink-0">
                                                <ClipboardList className="size-6 text-[#54b768]" />
                                            </div>
                                            <div>
                                                <DialogTitle className="text-lg font-black text-gray-900 leading-tight">
                                                    Audit Trail Record Details
                                                </DialogTitle>
                                                <DialogDescription className="text-xs text-gray-500 font-medium mt-0.5">
                                                    Record #{selectedLog.id} • Registered in immutable compliance trail
                                                </DialogDescription>
                                            </div>
                                        </div>
                                        <div className="shrink-0">
                                            {getActionBadge(selectedLog.action)}
                                        </div>
                                    </div>
                                </DialogHeader>

                                {/* Staff & Timestamp Grid - Soft Clean Cards */}
                                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                                    <div className="bg-emerald-50/50 p-3.5 rounded-xl border border-emerald-100">
                                        <span className="text-[10px] font-bold text-emerald-800 uppercase tracking-wider block">
                                            Staff Performed
                                        </span>
                                        <div className="flex items-center gap-2 mt-1">
                                            <div className="size-7 rounded-lg bg-emerald-200/60 text-[#54b768] flex items-center justify-center font-black text-xs">
                                                {(selectedLog.userName || 'U').substring(0, 1).toUpperCase()}
                                            </div>
                                            <div>
                                                <span className="font-black text-gray-900 text-sm block leading-tight">
                                                    {selectedLog.userName || 'System Automated'}
                                                </span>
                                                <span className="text-[10px] text-emerald-700 font-medium">
                                                    Authorized Staff Account
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200">
                                        <span className="text-[10px] font-bold text-gray-500 uppercase tracking-wider block">
                                            Timestamp & Date
                                        </span>
                                        <div className="flex items-center gap-2 mt-1">
                                            <div className="size-7 rounded-lg bg-gray-200 text-gray-700 flex items-center justify-center font-bold text-xs">
                                                <Clock className="size-4 text-gray-600" />
                                            </div>
                                            <div>
                                                <span className="font-bold text-gray-900 text-xs block leading-tight font-mono">
                                                    {modalTimestamp.fullDate}
                                                </span>
                                                <span className="text-[10px] text-gray-500 font-mono block">
                                                    {modalTimestamp.time} {modalTimestamp.relative ? `(${modalTimestamp.relative})` : ''}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {/* Structured Detailed Breakdown Cards */}
                                {parsedModalData && parsedModalData.category === 'pos_sale' && (
                                    <div className="bg-emerald-50/40 rounded-xl p-4 border border-emerald-200/70 space-y-3.5 text-left">
                                        <div className="flex items-center justify-between border-b border-emerald-200/60 pb-2">
                                            <span className="text-xs font-black uppercase text-emerald-900 tracking-wider flex items-center gap-1.5">
                                                <ShoppingCart className="size-4 text-[#54b768]" />
                                                POS Transaction Breakdown
                                            </span>
                                            {parsedModalData.saleId && (
                                                <Badge className="bg-emerald-600 text-white font-mono font-bold text-[10px]">
                                                    Transaction #{parsedModalData.saleId}
                                                </Badge>
                                            )}
                                        </div>

                                        {/* Financial Summary Strip */}
                                        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                                            <div className="bg-white p-2.5 rounded-lg border border-emerald-100 shadow-2xs">
                                                <span className="text-[10px] font-bold text-gray-500 uppercase block">Total Amount</span>
                                                <span className="font-black text-gray-900 text-sm text-emerald-700">
                                                    {parsedModalData.total || 'N/A'}
                                                </span>
                                            </div>

                                            <div className="bg-white p-2.5 rounded-lg border border-emerald-100 shadow-2xs">
                                                <span className="text-[10px] font-bold text-gray-500 uppercase block">Pera na Nakuha (Paid)</span>
                                                <span className="font-black text-gray-900 text-sm">
                                                    {parsedModalData.paid || 'N/A'}
                                                </span>
                                            </div>

                                            <div className="bg-white p-2.5 rounded-lg border border-emerald-100 shadow-2xs">
                                                <span className="text-[10px] font-bold text-gray-500 uppercase block">Sukli (Change)</span>
                                                <span className="font-black text-blue-700 text-sm">
                                                    {parsedModalData.change || '₱0.00'}
                                                </span>
                                            </div>

                                            <div className="bg-white p-2.5 rounded-lg border border-emerald-100 shadow-2xs">
                                                <span className="text-[10px] font-bold text-gray-500 uppercase block">Method / Type</span>
                                                <span className="font-bold text-gray-800 text-xs uppercase">
                                                    {parsedModalData.method || 'Cash'}
                                                </span>
                                                {parsedModalData.discount && (
                                                    <span className="text-[9px] text-amber-700 font-semibold block truncate">
                                                        {parsedModalData.discount}
                                                    </span>
                                                )}
                                            </div>
                                        </div>

                                        {/* Purchased Items List */}
                                        {parsedModalData.items && parsedModalData.items.length > 0 && (
                                            <div className="space-y-1.5 mt-2">
                                                <span className="text-[11px] font-black uppercase text-emerald-950 tracking-wider block">
                                                    Listahan ng mga Binili ({parsedModalData.items.length} item{parsedModalData.items.length !== 1 ? 's' : ''})
                                                </span>
                                                <div className="bg-white rounded-lg border border-emerald-100 divide-y divide-gray-100 overflow-hidden shadow-2xs">
                                                    {parsedModalData.items.map((item, idx) => (
                                                        <div key={idx} className="p-2.5 flex items-center justify-between text-xs hover:bg-gray-50/50">
                                                            <div className="flex items-center gap-2 max-w-[65%]">
                                                                <span className="size-5 rounded-full bg-emerald-100 text-[#54b768] font-bold text-[10px] flex items-center justify-center shrink-0">
                                                                    {idx + 1}
                                                                </span>
                                                                <div className="truncate">
                                                                    <p className="font-bold text-gray-900 truncate">{item.name}</p>
                                                                    {item.sku && (
                                                                        <p className="text-[10px] text-gray-400 font-mono">SKU: {item.sku}</p>
                                                                    )}
                                                                </div>
                                                            </div>
                                                            <div className="text-right whitespace-nowrap">
                                                                <span className="font-bold text-emerald-700 text-xs block">
                                                                    {item.total || (item.unitPrice ? `${item.unitPrice}` : '')}
                                                                </span>
                                                                <span className="text-[10px] text-gray-500 font-medium">
                                                                    {item.qty} pcs {item.unitPrice ? `@ ${item.unitPrice}` : ''}
                                                                </span>
                                                            </div>
                                                        </div>
                                                    ))}
                                                </div>
                                            </div>
                                        )}
                                    </div>
                                )}

                                {/* Structured Void Breakdown */}
                                {parsedModalData && parsedModalData.category === 'void' && (
                                    <div className="bg-rose-50/50 rounded-xl p-4 border border-rose-200/80 space-y-3 text-left">
                                        <div className="flex items-center justify-between border-b border-rose-200/60 pb-2">
                                            <span className="text-xs font-black uppercase text-rose-900 tracking-wider flex items-center gap-1.5">
                                                <RotateCcw className="size-4 text-rose-600" />
                                                Void & Refund Details
                                            </span>
                                            <Badge className="bg-rose-600 text-white font-mono font-bold text-[10px]">
                                                {parsedModalData.isFullVoid ? 'Full Void' : 'Partial Void'}
                                            </Badge>
                                        </div>

                                        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                                            {parsedModalData.txId && (
                                                <div className="bg-white p-2.5 rounded-lg border border-rose-100">
                                                    <span className="text-[10px] font-bold text-gray-500 uppercase block">Transaction</span>
                                                    <span className="font-black text-gray-900 text-sm">#{parsedModalData.txId}</span>
                                                </div>
                                            )}
                                            {parsedModalData.refund && (
                                                <div className="bg-white p-2.5 rounded-lg border border-rose-100">
                                                    <span className="text-[10px] font-bold text-rose-600 uppercase block">Refund Amount</span>
                                                    <span className="font-black text-rose-700 text-sm">{parsedModalData.refund}</span>
                                                </div>
                                            )}
                                            {parsedModalData.remaining && (
                                                <div className="bg-white p-2.5 rounded-lg border border-rose-100">
                                                    <span className="text-[10px] font-bold text-gray-500 uppercase block">Remaining Total</span>
                                                    <span className="font-black text-gray-900 text-sm">{parsedModalData.remaining}</span>
                                                </div>
                                            )}
                                            {parsedModalData.change && (
                                                <div className="bg-white p-2.5 rounded-lg border border-rose-100">
                                                    <span className="text-[10px] font-bold text-blue-600 uppercase block">Updated Sukli</span>
                                                    <span className="font-black text-blue-700 text-sm">{parsedModalData.change}</span>
                                                </div>
                                            )}
                                        </div>

                                        {parsedModalData.restored && (
                                            <div className="bg-white p-3 rounded-lg border border-rose-100">
                                                <span className="text-[10px] font-black text-gray-500 uppercase tracking-wider block mb-1">
                                                    Restored Back to Inventory Stock
                                                </span>
                                                <p className="font-bold text-emerald-800 text-xs">
                                                    {parsedModalData.restored}
                                                </p>
                                            </div>
                                        )}
                                    </div>
                                )}

                                {/* Structured Inventory Add Breakdown */}
                                {parsedModalData && parsedModalData.category === 'inventory_add' && (
                                    <div className="bg-teal-50/50 rounded-xl p-4 border border-teal-200/80 space-y-3 text-left">
                                        <div className="flex items-center justify-between border-b border-teal-200/60 pb-2">
                                            <span className="text-xs font-black uppercase text-teal-950 tracking-wider flex items-center gap-1.5">
                                                <PackagePlus className="size-4 text-teal-700" />
                                                New Product Registration Details
                                            </span>
                                            <Badge className="bg-teal-700 text-white font-bold text-[10px]">
                                                New Stock Entry
                                            </Badge>
                                        </div>

                                        <div className="bg-white p-3 rounded-lg border border-teal-100 space-y-2">
                                            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-1">
                                                <span className="text-sm font-black text-gray-900">{parsedModalData.productName || 'Added Product'}</span>
                                                {parsedModalData.sku && (
                                                    <span className="text-xs font-mono font-bold text-teal-700 bg-teal-50 px-2 py-0.5 rounded border border-teal-200">
                                                        SKU: {parsedModalData.sku}
                                                    </span>
                                                )}
                                            </div>

                                            <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 pt-2 border-t border-gray-100 text-xs">
                                                <div>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Initial Quantity</span>
                                                    <span className="font-black text-teal-800 text-sm">{parsedModalData.quantity ? `${parsedModalData.quantity} pcs` : 'N/A'}</span>
                                                </div>
                                                <div>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Batch Number</span>
                                                    <span className="font-bold text-gray-800 font-mono text-xs">{parsedModalData.batchNumber || 'N/A'}</span>
                                                </div>
                                                <div>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Expiration Date</span>
                                                    <span className="font-bold text-gray-800 font-mono text-xs">{parsedModalData.expiryDate || 'N/A'}</span>
                                                </div>
                                                <div>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Category</span>
                                                    <span className="font-bold text-gray-800 text-xs">{parsedModalData.categoryName || 'General'}</span>
                                                </div>
                                            </div>

                                            {(parsedModalData.price || parsedModalData.cost) && (
                                                <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 pt-2 border-t border-gray-100 text-xs">
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Selling Price</span>
                                                        <span className="font-black text-emerald-700">{parsedModalData.price || 'N/A'}</span>
                                                    </div>
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Unit Cost</span>
                                                        <span className="font-bold text-gray-700">{parsedModalData.cost || 'N/A'}</span>
                                                    </div>
                                                    {parsedModalData.supplier && (
                                                        <div>
                                                            <span className="text-[10px] font-bold text-gray-400 uppercase block">Supplier</span>
                                                            <span className="font-bold text-gray-800">{parsedModalData.supplier}</span>
                                                        </div>
                                                    )}
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                )}

                                {/* Structured Inventory Update Breakdown */}
                                {parsedModalData && parsedModalData.category === 'inventory_update' && (
                                    <div className="bg-sky-50/50 rounded-xl p-4 border border-sky-200/80 space-y-3 text-left">
                                        <div className="flex items-center justify-between border-b border-sky-200/60 pb-2">
                                            <span className="text-xs font-black uppercase text-sky-950 tracking-wider flex items-center gap-1.5">
                                                <Layers className="size-4 text-sky-700" />
                                                Inventory & FEFO Batch Adjustments
                                            </span>
                                            <Badge className="bg-sky-700 text-white font-bold text-[10px]">
                                                Stock Modified
                                            </Badge>
                                        </div>

                                        <div className="bg-white p-3 rounded-lg border border-sky-100 space-y-2.5">
                                            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-1">
                                                <span className="text-sm font-black text-gray-900">{parsedModalData.productName || 'Updated Product'}</span>
                                                {parsedModalData.sku && (
                                                    <span className="text-xs font-mono font-bold text-sky-700 bg-sky-50 px-2 py-0.5 rounded border border-sky-200">
                                                        SKU: {parsedModalData.sku}
                                                    </span>
                                                )}
                                            </div>

                                            <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 pt-2 border-t border-gray-100 text-xs">
                                                {parsedModalData.totalCombinedStock && (
                                                    <div className="bg-sky-50/60 p-2 rounded-lg">
                                                        <span className="text-[10px] font-bold text-sky-900 uppercase block">Combined Stock</span>
                                                        <span className="font-black text-sky-800 text-sm">{parsedModalData.totalCombinedStock} pcs</span>
                                                    </div>
                                                )}
                                                {parsedModalData.price && (
                                                    <div className="bg-gray-50 p-2 rounded-lg">
                                                        <span className="text-[10px] font-bold text-gray-500 uppercase block">Active Price</span>
                                                        <span className="font-black text-emerald-700 text-sm">{parsedModalData.price}</span>
                                                    </div>
                                                )}
                                                {parsedModalData.newBatchTotal && (
                                                    <div className="bg-gray-50 p-2 rounded-lg">
                                                        <span className="text-[10px] font-bold text-gray-500 uppercase block">Queued Stock Total</span>
                                                        <span className="font-black text-gray-900 text-sm">{parsedModalData.newBatchTotal} pcs</span>
                                                    </div>
                                                )}
                                            </div>

                                            {parsedModalData.activeBatch && (
                                                <div className="p-2 bg-gray-50 rounded-lg text-xs">
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block mb-0.5">Active Old Batch (FEFO Front)</span>
                                                    <span className="font-bold text-gray-800 font-mono text-[11px]">{parsedModalData.activeBatch}</span>
                                                </div>
                                            )}

                                            {parsedModalData.incomingBatch && (
                                                <div className="p-2 bg-emerald-50/70 border border-emerald-200/60 rounded-lg text-xs">
                                                    <span className="text-[10px] font-bold text-emerald-800 uppercase block mb-0.5">Added Incoming Batch</span>
                                                    <span className="font-bold text-emerald-900 text-[11px]">{parsedModalData.incomingBatch}</span>
                                                </div>
                                            )}

                                            {parsedModalData.queueBatches && parsedModalData.queueBatches !== 'None' && (
                                                <div className="p-2 bg-blue-50/60 border border-blue-200/60 rounded-lg text-xs">
                                                    <span className="text-[10px] font-bold text-blue-900 uppercase block mb-0.5">FEFO Queue Stack</span>
                                                    <span className="font-mono text-blue-800 text-[11px]">{parsedModalData.queueBatches}</span>
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                )}

                                {/* Structured Delete & Loss Breakdown */}
                                {parsedModalData && parsedModalData.category === 'inventory_delete' && (
                                    <div className="bg-amber-50/60 rounded-xl p-4 border border-amber-200/80 space-y-3 text-left">
                                        <div className="flex items-center justify-between border-b border-amber-200/60 pb-2">
                                            <span className="text-xs font-black uppercase text-amber-950 tracking-wider flex items-center gap-1.5">
                                                <PackageX className="size-4 text-amber-700" />
                                                Product Removal & Loss Record
                                            </span>
                                            <Badge className="bg-amber-700 text-white font-bold text-[10px]">
                                                {parsedModalData.isDispose ? 'Inventory Loss' : 'Archived Product'}
                                            </Badge>
                                        </div>

                                        <div className="bg-white p-3 rounded-lg border border-amber-100 space-y-2">
                                            <span className="text-sm font-black text-gray-900 block">{parsedModalData.productName || 'Removed Product'}</span>
                                            <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 pt-2 border-t border-gray-100 text-xs">
                                                {parsedModalData.sku && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">SKU</span>
                                                        <span className="font-mono font-bold text-gray-800">{parsedModalData.sku}</span>
                                                    </div>
                                                )}
                                                {parsedModalData.quantity && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Quantity</span>
                                                        <span className="font-black text-rose-700">{parsedModalData.quantity} pcs</span>
                                                    </div>
                                                )}
                                                {parsedModalData.lossCost && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-red-600 uppercase block">Loss Value</span>
                                                        <span className="font-black text-red-700">{parsedModalData.lossCost}</span>
                                                    </div>
                                                )}
                                            </div>
                                            {parsedModalData.reason && (
                                                <div className="p-2 bg-amber-50 rounded-lg text-xs mt-2">
                                                    <span className="text-[10px] font-bold text-amber-800 uppercase block mb-0.5">Disposal Reason</span>
                                                    <span className="font-bold text-amber-900">{parsedModalData.reason}</span>
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                )}

                                {/* Structured Security / Auth Breakdown */}
                                {parsedModalData && parsedModalData.category === 'auth' && (
                                    <div className={`rounded-xl p-4 border space-y-3 text-left ${parsedModalData.isAuthSuccess ? 'bg-indigo-50/50 border-indigo-200/70' : 'bg-red-50/50 border-red-200/70'}`}>
                                        <div className="flex items-center justify-between border-b pb-2">
                                            <span className={`text-xs font-black uppercase tracking-wider flex items-center gap-1.5 ${parsedModalData.isAuthSuccess ? 'text-indigo-950' : 'text-red-950'}`}>
                                                <Lock className="size-4" />
                                                Authentication & Access Security
                                            </span>
                                            <Badge className={`font-bold text-[10px] ${parsedModalData.isAuthSuccess ? 'bg-indigo-600 text-white' : 'bg-red-600 text-white'}`}>
                                                {parsedModalData.isAuthSuccess ? 'Authorized Login' : (parsedModalData.isLockout ? 'Security Lockout' : 'Failed Attempt')}
                                            </Badge>
                                        </div>

                                        <div className="bg-white p-3 rounded-lg border space-y-2">
                                            <div className="grid grid-cols-2 gap-2 text-xs">
                                                <div>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Target Username</span>
                                                    <span className="font-black text-gray-900 text-sm font-mono">{parsedModalData.username || selectedLog.userName || 'Unknown'}</span>
                                                </div>
                                                {parsedModalData.attemptInfo && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Attempt Counter</span>
                                                        <span className="font-black text-red-700 text-sm">{parsedModalData.attemptInfo}</span>
                                                    </div>
                                                )}
                                            </div>
                                            {parsedModalData.authNote && (
                                                <div className="p-2 bg-gray-50 rounded text-xs text-gray-700">
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Status Message</span>
                                                    <span className="font-medium">{parsedModalData.authNote}</span>
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                )}

                                {/* Structured User Management Breakdown */}
                                {parsedModalData && parsedModalData.category === 'user_mgmt' && (
                                    <div className="bg-purple-50/50 rounded-xl p-4 border border-purple-200/80 space-y-3 text-left">
                                        <div className="flex items-center justify-between border-b border-purple-200/60 pb-2">
                                            <span className="text-xs font-black uppercase text-purple-950 tracking-wider flex items-center gap-1.5">
                                                <UserCog className="size-4 text-purple-700" />
                                                User Account Administration
                                            </span>
                                            <Badge className="bg-purple-700 text-white font-bold text-[10px]">
                                                {selectedLog.action}
                                            </Badge>
                                        </div>

                                        <div className="bg-white p-3 rounded-lg border border-purple-100 space-y-2">
                                            <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 text-xs">
                                                <div>
                                                    <span className="text-[10px] font-bold text-gray-400 uppercase block">Account Username</span>
                                                    <span className="font-black text-gray-900 font-mono">{parsedModalData.targetUser || 'N/A'}</span>
                                                </div>
                                                {parsedModalData.targetName && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Full Name</span>
                                                        <span className="font-bold text-gray-800">{parsedModalData.targetName}</span>
                                                    </div>
                                                )}
                                                {parsedModalData.targetRole && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Role</span>
                                                        <Badge variant="outline" className="bg-purple-50 text-purple-700 border-purple-200 uppercase text-[9px] font-bold">
                                                            {parsedModalData.targetRole}
                                                        </Badge>
                                                    </div>
                                                )}
                                                {parsedModalData.targetEmail && (
                                                    <div>
                                                        <span className="text-[10px] font-bold text-gray-400 uppercase block">Email Address</span>
                                                        <span className="font-medium text-gray-700 truncate block">{parsedModalData.targetEmail}</span>
                                                    </div>
                                                )}
                                            </div>
                                            {parsedModalData.passwordChanged && (
                                                <div className="p-2 bg-amber-50 text-amber-900 rounded text-xs font-semibold">
                                                    🔐 Password credential was updated during this action.
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                )}

                                {/* Full Action Chronicle Box - Clean, Light Theme without Dark/Black background */}
                                <div className="space-y-1.5 text-left">
                                    <div className="flex items-center justify-between">
                                        <span className="text-[10px] font-black uppercase text-gray-500 tracking-wider">
                                            Complete Action Chronicle
                                        </span>
                                        <button
                                            onClick={() => handleCopyChronicle(selectedLog.details)}
                                            className="text-[10px] font-bold text-emerald-700 hover:text-emerald-900 flex items-center gap-1 transition-colors"
                                        >
                                            {copiedChronicle ? (
                                                <>
                                                    <Check className="size-3 text-emerald-600" />
                                                    <span>Copied!</span>
                                                </>
                                            ) : (
                                                <>
                                                    <Copy className="size-3" />
                                                    <span>Copy Chronicle</span>
                                                </>
                                            )}
                                        </button>
                                    </div>

                                    {/* Readable, non-black card connected to system theme */}
                                    <div className="bg-emerald-50/40 text-slate-800 p-4 rounded-xl font-mono text-xs leading-relaxed border border-emerald-200/80 max-h-48 overflow-y-auto whitespace-pre-wrap select-text shadow-2xs">
                                        {selectedLog.details}
                                    </div>
                                </div>

                                {/* Modal Footer */}
                                <div className="flex justify-between items-center pt-3 border-t border-gray-100 text-xs">
                                    <span className="flex items-center gap-1.5 text-emerald-700 font-bold text-[11px]">
                                        <ShieldCheck className="size-4 text-[#54b768]" />
                                        Verified Immutable Audit Trail
                                    </span>
                                    <Button
                                        onClick={() => setSelectedLog(null)}
                                        className="bg-[#54b768] hover:bg-[#469e57] text-white font-bold h-9 px-6 rounded-lg text-xs shadow-xs"
                                    >
                                        Close
                                    </Button>
                                </div>
                            </div>
                        )}
                    </DialogContent>
                </Dialog>
            </div>
        </ErrorBoundary>
    );
}
