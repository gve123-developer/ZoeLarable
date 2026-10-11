import { useState, useEffect, useMemo } from 'react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/app/components/ui/card';
import { Button } from '@/app/components/ui/button';
import { Input } from '@/app/components/ui/input';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/app/components/ui/table';
import { Badge } from '@/app/components/ui/badge';
import { Product, Transaction } from '@/app/App';
import { ErrorBoundary } from '@/app/components/ErrorBoundary';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/app/components/ui/dialog';
import {
    TrendingUp,
    TrendingDown,
    AlertTriangle,
    Info,
    Package,
    ArrowRight,
    ShieldCheck,
    Search,
    ChevronLeft,
    ChevronRight,
    RefreshCw,
    Calculator,
    CheckCircle2,
    Award
} from 'lucide-react';

interface StockForecastingProps {
    products: Product[];
    transactions: Transaction[];
}

import { getForecast, calculateDailyAccuracyMetrics, formatDurationLeft } from '@/app/utils/forecastingUtils';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip as RechartsTooltip, Legend, ResponsiveContainer } from 'recharts';
import forecast90dData from '@/app/data/forecast_90d_transactions.json';

export function StockForecasting({ products, transactions }: StockForecastingProps) {
    const [searchTerm, setSearchTerm] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 8;

    // Calculation: (Stock / Velocity) = Days left
    // ... rest of the code ...

    const [selectedProductAnalysis, setSelectedProductAnalysis] = useState<any>(null);
    const [demandTab, setDemandTab] = useState<'High Demand' | 'Medium Demand' | 'Low Demand'>('High Demand');
    const [evaluationPeriod, setEvaluationPeriod] = useState<'90_days' | 'all'>('90_days');
    const [productMetrics, setProductMetrics] = useState<any[]>([]);

    useEffect(() => {
        setCurrentPage(1);
    }, [searchTerm]);

    const evaluationTransactions = useMemo(() => {
        if (evaluationPeriod === '90_days') {
            return forecast90dData as unknown as Transaction[];
        }
        return transactions;
    }, [transactions, evaluationPeriod]);

    useEffect(() => {
        const metricsArray = products.map(p => {
            const m = calculateDailyAccuracyMetrics(p.id, evaluationTransactions, 7); // 7 days testing window
            return {
                product: p,
                metrics: m
            };
        }).filter(item => item.metrics !== null);
        setProductMetrics(metricsArray);
    }, [products, evaluationTransactions]);

    const evaluatedProducts = useMemo(() => {
        return productMetrics.filter(pm => pm.metrics?.sma && pm.metrics?.exponentialSmoothing);
    }, [productMetrics]);

    const overallAccuracy = useMemo(() => {
        if (evaluatedProducts.length === 0) return null;

        let totalEsMae = 0;
        let totalSmaMae = 0;
        let totalEsRmse = 0;
        let totalSmaRmse = 0;
        let totalEsMape = 0;
        let totalSmaMape = 0;
        let mapeCount = 0;
        let totalDemand = 0;
        let totalEsAbsError = 0;
        let totalSmaAbsError = 0;

        let esMaeWins = 0, smaMaeWins = 0;
        let esRmseWins = 0, smaRmseWins = 0;

        evaluatedProducts.forEach(pm => {
            const es = pm.metrics.exponentialSmoothing;
            const sma = pm.metrics.sma;

            const esMae = typeof es.maeRaw === 'number' ? es.maeRaw : (parseFloat(es.mae) || 0);
            const smaMae = typeof sma.maeRaw === 'number' ? sma.maeRaw : (parseFloat(sma.mae) || 0);
            const esRmse = typeof es.rmseRaw === 'number' ? es.rmseRaw : (parseFloat(es.rmse) || 0);
            const smaRmse = typeof sma.rmseRaw === 'number' ? sma.rmseRaw : (parseFloat(sma.rmse) || 0);

            totalEsMae += esMae;
            totalSmaMae += smaMae;
            totalEsRmse += esRmse;
            totalSmaRmse += smaRmse;

            if (esMae < smaMae) esMaeWins++;
            else if (smaMae < esMae) smaMaeWins++;

            if (esRmse < smaRmse) esRmseWins++;
            else if (smaRmse < esRmse) smaRmseWins++;

            if (typeof es.mapeRaw === 'number' && typeof sma.mapeRaw === 'number') {
                totalEsMape += es.mapeRaw;
                totalSmaMape += sma.mapeRaw;
                mapeCount++;
            }

            if (pm.metrics.totalTestDemand > 0) {
                totalDemand += pm.metrics.totalTestDemand;
                totalEsAbsError += esMae * pm.metrics.testDaysCount;
                totalSmaAbsError += smaMae * pm.metrics.testDaysCount;
            }
        });

        const n = evaluatedProducts.length;
        const esMeanMae = totalEsMae / n;
        const smaMeanMae = totalSmaMae / n;
        const esMeanRmse = totalEsRmse / n;
        const smaMeanRmse = totalSmaRmse / n;
        const esMeanMape = mapeCount > 0 ? (totalEsMape / mapeCount) : 0;
        const smaMeanMape = mapeCount > 0 ? (totalSmaMape / mapeCount) : 0;

        const esOverallWape = totalDemand > 0 ? (totalEsAbsError / totalDemand) * 100 : 0;
        const smaOverallWape = totalDemand > 0 ? (totalSmaAbsError / totalDemand) * 100 : 0;

        return {
            evaluatedCount: n,
            activeMapeCount: mapeCount,
            esMeanMae: esMeanMae.toFixed(3),
            smaMeanMae: smaMeanMae.toFixed(3),
            esMeanRmse: esMeanRmse.toFixed(3),
            smaMeanRmse: smaMeanRmse.toFixed(3),
            esMeanMape: esMeanMape.toFixed(2) + '%',
            smaMeanMape: smaMeanMape.toFixed(2) + '%',
            esOverallWape: esOverallWape.toFixed(2) + '%',
            smaOverallWape: smaOverallWape.toFixed(2) + '%',
            esMaeWins,
            smaMaeWins,
            esRmseWins,
            smaRmseWins,
            maeDiff: Math.abs(esMeanMae - smaMeanMae).toFixed(3),
            rmseDiff: Math.abs(esMeanRmse - smaMeanRmse).toFixed(3),
            mapeDiff: Math.abs(esMeanMape - smaMeanMape).toFixed(2) + '%',
            maeWinner: esMeanMae <= smaMeanMae ? 'Custom Algorithm (Exp. Smoothing)' : 'Simple Moving Average (SMA)',
            rmseWinner: esMeanRmse <= smaMeanRmse ? 'Custom Algorithm (Exp. Smoothing)' : 'Simple Moving Average (SMA)',
            mapeWinner: esMeanMape <= smaMeanMape ? 'Custom Algorithm (Exp. Smoothing)' : 'Simple Moving Average (SMA)',
            wapeWinner: esOverallWape <= smaOverallWape ? 'Custom Algorithm (Exp. Smoothing)' : 'Simple Moving Average (SMA)',
            overallWinner: (esMeanMae <= smaMeanMae || esMeanMape <= smaMeanMape)
                ? 'Custom Algorithm (Exponential Smoothing, α = 0.7)'
                : 'Simple Moving Average (SMA)'
        };
    }, [evaluatedProducts]);

    const getProductForecast = (product: Product) => {
        return getForecast(product, transactions, false);
    };


    const filteredProducts = products
        .filter(p =>
            p.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            p.sku.toLowerCase().includes(searchTerm.toLowerCase())
        )
        .sort((a, b) => {
            const recA = getProductForecast(a).reorderRecommendation;
            const recB = getProductForecast(b).reorderRecommendation;
            return recB - recA; // Push recommendations to the top
        });

    const totalPages = Math.max(1, Math.ceil(filteredProducts.length / itemsPerPage));
    const paginatedProducts = filteredProducts.slice(
        (currentPage - 1) * itemsPerPage,
        currentPage * itemsPerPage
    );

    const stats = {
        criticalStock: products.filter(p => {
            const { daysRemaining } = getProductForecast(p);
            return daysRemaining <= 7;
        }).length,
        highVelocity: products.filter(p => {
            const { velocity } = getProductForecast(p);
            return parseFloat(velocity) > 2;
        }).length,
        totalRecommendations: products.filter(p => getProductForecast(p).reorderRecommendation > 0).length
    };

    return (
        <ErrorBoundary fallbackTitle="Stock Forecasting Module Error">
            <div className="space-y-6">
                <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                    <div>
                        <h2 className="text-2xl font-semibold text-gray-900">Stock Forecasting</h2>
                        <p className="text-sm text-gray-700 font-semibold mt-1">Predictive insights based on sales velocity and environmental data.</p>
                    </div>
                </div>
                <ErrorBoundary fallbackTitle="Forecasting Summary Error">
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <Card className="bg-green-50 border-2 border-green-200 shadow-lg transition-all duration-300 hover:scale-[1.02] hover:-translate-y-1 hover:shadow-xl">
                            <CardHeader className="flex flex-row items-center justify-between pb-2">
                                <CardTitle className="text-sm font-bold text-green-900 uppercase tracking-wider">Inventory Health</CardTitle>
                                <ShieldCheck className="size-6 text-green-600" />
                            </CardHeader>
                            <CardContent>
                                <div className="text-3xl font-black text-green-700">{products.length - stats.criticalStock}</div>
                                <p className="text-xs font-semibold text-green-600 mt-1 uppercase tracking-wider">Items in Safe Zone</p>
                            </CardContent>
                        </Card>

                        <Card className="bg-amber-50 border-2 border-amber-200 shadow-lg transition-all duration-300 hover:scale-[1.02] hover:-translate-y-1 hover:shadow-xl font-medium">
                            <CardHeader className="flex flex-row items-center justify-between pb-2">
                                <CardTitle className="text-sm font-bold text-amber-900 uppercase tracking-wider">Critical Risk</CardTitle>
                                <AlertTriangle className="size-6 text-amber-600" />
                            </CardHeader>
                            <CardContent>
                                <div className="text-3xl font-black text-amber-700">{stats.criticalStock}</div>
                                <p className="text-xs font-semibold text-amber-600 mt-1 uppercase tracking-wider">Runs out &lt; 7 Days</p>
                            </CardContent>
                        </Card>

                        <Card className="bg-blue-50 border-2 border-blue-200 shadow-lg transition-all duration-300 hover:scale-[1.02] hover:-translate-y-1 hover:shadow-xl font-medium">
                            <CardHeader className="flex flex-row items-center justify-between pb-2">
                                <CardTitle className="text-sm font-bold text-blue-900 uppercase tracking-wider">Daily Demand</CardTitle>
                                <TrendingUp className="size-6 text-blue-600" />
                            </CardHeader>
                            <CardContent>
                                <div className="text-3xl font-black text-blue-700">{stats.highVelocity}</div>
                                <p className="text-xs font-semibold text-blue-600 mt-1 uppercase tracking-wider">Fast Moving Items</p>
                            </CardContent>
                        </Card>
                    </div>
                </ErrorBoundary>

                <ErrorBoundary fallbackTitle="Forecast Insights Error">
                    <Card className="border border-gray-200 overflow-hidden shadow-sm">
                        <CardHeader className="bg-gray-50 border-b border-gray-200 flex flex-row items-center justify-between space-y-0 p-6">
                            <div>
                                <CardTitle className="text-lg font-bold text-gray-900 uppercase tracking-tight">Forecast Insights</CardTitle>
                                <CardDescription className="text-sm text-gray-500">Estimated stock duration and dynamic reorder recommendations (14-days for fast-moving, 30-days for slow-moving) based on Exponential Smoothing.</CardDescription>
                            </div>
                            <div className="max-w-xs relative">
                                <Search className="absolute left-3 top-1/2 -translate-y-1/2 size-4 text-gray-400" />
                                <Input
                                    placeholder="Search products..."
                                    value={searchTerm}
                                    onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSearchTerm(e.target.value)}
                                    className="h-10 pl-10 bg-white border-gray-200"
                                />
                            </div>
                        </CardHeader>
                        <CardContent className="p-0">
                            <div className="overflow-x-auto w-full">
                                <Table className="w-full min-w-[800px]">
                                    <TableHeader>
                                        <TableRow className="bg-gray-100/50 border-b border-gray-200">
                                            <TableHead className="px-2 py-3 font-black text-gray-700 uppercase text-[9px] w-[20%]">Product Name</TableHead>
                                            <TableHead className="px-1 py-3 font-black text-gray-700 uppercase text-[9px] text-center">Daily Velocity</TableHead>
                                            <TableHead className="px-1 py-3 font-black text-gray-700 uppercase text-[9px] text-center">Current Stock</TableHead>
                                            <TableHead className="px-1 py-3 font-black text-gray-700 uppercase text-[9px] text-center">Stock Status</TableHead>
                                            <TableHead className="px-1 py-3 font-black text-gray-700 uppercase text-[9px] text-center text-red-600">Months / Days Left</TableHead>
                                            <TableHead className="px-1 py-3 font-black text-gray-700 uppercase text-[9px] text-center">Stockout Date</TableHead>
                                            <TableHead className="px-1 py-3 font-black text-gray-700 uppercase text-[9px] text-center">Reorder Date</TableHead>
                                            <TableHead className="px-2 py-3 font-black text-gray-700 uppercase text-[9px] text-right">Recommendation</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody className="divide-y divide-gray-200">
                                        {paginatedProducts.map((p) => {
                                            const forecast = getProductForecast(p);

                                            return (
                                                <TableRow key={p.id} className="hover:bg-gray-50/50 transition-colors">
                                                    <TableCell className="px-3 py-4 border-r border-gray-200">
                                                        <div className="flex flex-col">
                                                            <span className="font-bold text-gray-900 text-sm">{p.name}</span>
                                                            <span className="text-[10px] text-gray-400 font-mono uppercase tracking-tighter mt-0.5">{p.sku}</span>
                                                        </div>
                                                    </TableCell>
                                                    <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                                                        <div className="flex items-center justify-center gap-1.5">
                                                            <span className="font-mono font-bold text-sm text-gray-700">{forecast.velocity}</span>
                                                            {parseFloat(forecast.velocity) > 0 ? (
                                                                <TrendingUp className="size-3 text-green-600" />
                                                            ) : (
                                                                <TrendingDown className="size-3 text-gray-400" />
                                                            )}
                                                        </div>
                                                    </TableCell>
                                                    <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                                                        <div className="flex flex-col items-center justify-center">
                                                            <span className={`text-sm font-black ${(Number(p.quantity) + Number(p.newStockQuantity || 0)) === 0 ? 'text-red-600' : 'text-blue-800'}`}>
                                                                {Number(p.quantity) + Number(p.newStockQuantity || 0)}
                                                            </span>
                                                            <span className="text-[9px] text-gray-400 font-bold uppercase">Total Units</span>
                                                        </div>
                                                    </TableCell>
                                                    <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                                                        {Number((forecast as any).daysRemaining) <= 7 || (Number(p.quantity) + Number(p.newStockQuantity || 0)) === 0 ? (
                                                            <Badge className="bg-red-100 text-red-800 border-none px-2 py-0.5 text-[10px] font-black uppercase tracking-widest leading-none">CRITICAL</Badge>
                                                        ) : (Number((forecast as any).daysRemaining) <= 14 || (Number(p.quantity) + Number(p.newStockQuantity || 0)) <= Number(p.reorderLevel)) ? (
                                                            <Badge className="bg-orange-100 text-orange-800 border-none px-2 py-0.5 text-[10px] font-bold uppercase tracking-widest leading-none">LOW STOCK</Badge>
                                                        ) : (
                                                            <Badge className="bg-green-100 text-green-800 border-none px-2 py-0.5 text-[10px] font-bold uppercase tracking-widest leading-none">OPTIMAL</Badge>
                                                        )}
                                                    </TableCell>
                                                    <TableCell className="px-4 py-4 border-r border-gray-200 text-center">
                                                        <span className={`font-black text-xs md:text-sm whitespace-nowrap ${(forecast as any).daysRemaining <= 7 || (Number(p.quantity) + Number(p.newStockQuantity || 0)) === 0 ? 'text-red-600' :
                                                            ((forecast as any).daysRemaining <= 14 || (Number(p.quantity) + Number(p.newStockQuantity || 0)) <= p.reorderLevel) ? 'text-orange-600' : 'text-green-600'
                                                            }`}>
                                                            {formatDurationLeft((forecast as any).daysRemaining, Number(p.quantity) + Number(p.newStockQuantity || 0))}
                                                        </span>
                                                    </TableCell>
                                                    <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                                                        <span className="text-xs font-mono font-bold text-gray-600 whitespace-nowrap uppercase">
                                                            {(forecast as any).stockOutDate !== 'N/A' ? new Date((forecast as any).stockOutDate).toLocaleDateString([], { year: 'numeric', month: 'short', day: 'numeric' }) : 'SUFFICIENT'}
                                                        </span>
                                                    </TableCell>
                                                    <TableCell className="px-6 py-4 border-r border-gray-200 text-center">
                                                        <div className="flex flex-col">
                                                            <span className={`text-xs font-black ${((forecast as any).daysRemaining <= 5) ? 'text-red-600' : 'text-blue-700'} whitespace-nowrap`}>
                                                                {(forecast as any).recommendedBuyDate !== 'N/A' ? new Date((forecast as any).recommendedBuyDate).toLocaleDateString([], { year: 'numeric', month: 'short', day: 'numeric' }) : '-'}
                                                            </span>
                                                        </div>
                                                    </TableCell>
                                                    <TableCell className="px-3 py-4 text-right">
                                                        {parseFloat(forecast.velocity) === 0 ? (
                                                            <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest leading-none">INSUFFICIENT SALES DATA</span>
                                                        ) : forecast.reorderRecommendation > 0 ? (
                                                            <div className="inline-flex items-center gap-1.5 text-blue-700 bg-blue-50 border border-blue-100 px-2 py-0.5 rounded-full font-black text-[11px]">
                                                                +{forecast.reorderRecommendation}
                                                                <ArrowRight className="size-3" />
                                                            </div>
                                                        ) : (
                                                            <span className="text-[10px] font-bold text-gray-400 uppercase tracking-widest leading-none">NONE</span>
                                                        )}
                                                    </TableCell>
                                                </TableRow>
                                            );
                                        })}
                                    </TableBody>
                                </Table>
                            </div>
                        </CardContent>
                        {/* Pagination Controls */}
                        <div className="bg-gray-50 border-t border-gray-200 px-6 py-4 flex items-center justify-between">
                            <div className="text-sm text-gray-500 font-medium">
                                Showing <span className="text-gray-900 font-bold">{Math.min(filteredProducts.length, (currentPage - 1) * itemsPerPage + 1)}</span> to <span className="text-gray-900 font-bold">{Math.min(filteredProducts.length, currentPage * itemsPerPage)}</span> of <span className="text-gray-900 font-bold">{filteredProducts.length}</span> products
                            </div>
                            <div className="flex items-center gap-2">
                                <Button
                                    variant="outline"
                                    size="sm"
                                    onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
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
                                    onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
                                    disabled={currentPage === totalPages}
                                    className="bg-white border-gray-200 hover:bg-gray-100 disabled:opacity-50"
                                >
                                    Next
                                    <ChevronRight className="size-4 ml-1" />
                                </Button>
                            </div>
                        </div>
                    </Card>
                </ErrorBoundary>
            </div>
        </ErrorBoundary>
    );
}
