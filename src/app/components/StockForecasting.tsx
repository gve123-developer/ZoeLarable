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
    const [evaluationPeriod, setEvaluationPeriod] = useState<'90_days' | 'july_august' | 'all'>('90_days');
    const [productMetrics, setProductMetrics] = useState<any[]>([]);

    useEffect(() => {
        setCurrentPage(1);
    }, [searchTerm]);

    const evaluationTransactions = useMemo(() => {
        if (evaluationPeriod === '90_days') {
            return forecast90dData as unknown as Transaction[];
        }
        if (evaluationPeriod === 'july_august') {
            const filtered = transactions.filter(t => {
                const dateStr = t.date.slice(0, 10);
                return dateStr >= '2026-07-02' && dateStr <= '2026-08-25';
            });
            return filtered.length > 0 ? filtered : transactions;
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
                    {productMetrics.length > 0 && (
                        <Dialog onOpenChange={(open) => { if (!open) setSelectedProductAnalysis(null); }}>
                            <DialogTrigger asChild>
                                <Button variant="outline" className="flex items-center gap-2 border-indigo-200 text-indigo-700 hover:bg-indigo-50 hover:text-indigo-800">
                                    <ShieldCheck className="size-4" />
                                    Evaluate Algorithm Accuracy
                                </Button>
                            </DialogTrigger>
                            <DialogContent className="w-[80vw] max-w-[80vw] sm:max-w-[80vw] h-[80vh] overflow-y-auto bg-white/40 backdrop-blur-xl border border-white/50 shadow-2xl rounded-3xl">
                                {selectedProductAnalysis ? (
                                    <div className="space-y-6">
                                        <Button variant="ghost" onClick={() => setSelectedProductAnalysis(null)} className="mb-2 -ml-4 px-4 hover:bg-gray-100">
                                            <ChevronLeft className="size-4 mr-2" /> Back to Products
                                        </Button>
                                        <div>
                                            <h2 className="text-2xl font-black uppercase tracking-tight text-gray-900">{selectedProductAnalysis.product.name}</h2>
                                            <div className="flex gap-4 items-center mt-2">
                                                <Badge variant="outline" className="text-gray-500">{selectedProductAnalysis.product.sku}</Badge>
                                                <div className="flex justify-between items-center bg-gray-50 p-4 rounded-lg">
                                                    <span className="text-gray-500 font-medium text-xs uppercase tracking-wider">Historical Demand Level</span>
                                                    <span className={`font-black text-lg ${selectedProductAnalysis.metrics.classification === 'High Demand' ? 'text-green-600' : selectedProductAnalysis.metrics.classification === 'Medium Demand' ? 'text-amber-500' : 'text-gray-500'}`}>
                                                        {selectedProductAnalysis.metrics.classification}
                                                    </span>
                                                </div>
                                                <div className="text-xs text-gray-500 font-medium mt-2 px-2">
                                                    Avg Daily Demand: <span className="text-gray-900">{selectedProductAnalysis.metrics.avgDailyDemand}</span> units
                                                </div>
                                            </div>
                                        </div>

                                        <div className="h-[350px] w-full border border-gray-100 rounded-lg p-4 bg-gray-50/50 shadow-sm">
                                            <h3 className="text-xs font-bold text-gray-700 uppercase tracking-widest text-center mb-6">Demand Forecast Analysis (Daily)</h3>
                                            <ResponsiveContainer width="100%" height="100%">
                                                <LineChart data={selectedProductAnalysis.metrics.chartData} margin={{ top: 5, right: 20, left: -20, bottom: 25 }}>
                                                    <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e5e7eb" />
                                                    <XAxis dataKey="date" tick={{ fontSize: 11, fill: '#1e293b', fontWeight: 'bold' }} tickLine={false} axisLine={false} dy={10} />
                                                    <YAxis tick={{ fontSize: 11, fill: '#1e293b', fontWeight: 'bold' }} tickLine={false} axisLine={false} />
                                                    <RechartsTooltip
                                                        contentStyle={{ borderRadius: '8px', border: 'none', boxShadow: '0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)' }}
                                                        itemStyle={{ fontSize: '12px', fontWeight: 'bold', padding: '2px 0' }}
                                                        labelStyle={{ fontSize: '11px', color: '#6b7280', textTransform: 'uppercase', fontWeight: 'black', marginBottom: '8px', borderBottom: '1px solid #f3f4f6', paddingBottom: '4px' }}
                                                    />
                                                    <Legend verticalAlign="top" height={36} wrapperStyle={{ fontSize: '13px', fontWeight: 'bold', paddingBottom: '20px' }} />
                                                    <Line type="monotone" dataKey="Actual" name="Actual Demand" stroke="#111827" strokeWidth={3} dot={{ r: 4, strokeWidth: 2 }} activeDot={{ r: 6 }} />
                                                    <Line type="monotone" dataKey="SMA" name="SMA Forecast (3 Wks)" stroke="#9ca3af" strokeWidth={3} strokeDasharray="5 5" dot={false} activeDot={{ r: 6 }} />
                                                    <Line type="monotone" dataKey="Exp. Smoothing" name="Custom Algorithm" stroke="#4f46e5" strokeWidth={3} dot={{ r: 4, strokeWidth: 2 }} activeDot={{ r: 6 }} />
                                                </LineChart>
                                            </ResponsiveContainer>
                                        </div>
                                        {selectedProductAnalysis.metrics.sma ? (
                                            <>
                                                {/* Notice for single product */}
                                                <div className="bg-amber-50/80 border border-amber-200 rounded-xl p-3 text-xs text-amber-900 flex items-center gap-2 font-medium">
                                                    <Info className="size-4 text-amber-600 shrink-0" />
                                                    <span>
                                                        Evaluated over {selectedProductAnalysis.metrics.testDaysCount} test days ({selectedProductAnalysis.metrics.activeTestDaysCount} active non-zero sales days, {selectedProductAnalysis.metrics.totalTestDemand} units total test demand). 
                                                        Comparison preserves real zero-demand days and uses identical test dates for both algorithms.
                                                    </span>
                                                </div>

                                                <div className="border border-gray-200 rounded-xl overflow-hidden shadow-xs bg-white">
                                                    <Table>
                                                        <TableHeader>
                                                            <TableRow className="bg-gray-50 border-b-2 border-gray-200">
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3.5">Forecasting Model</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3.5">MAE (Abs. Error)</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3.5">RMSE (Sq. Error)</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3.5">MAPE (Active Days)</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3.5">WAPE (Weighted)</TableHead>
                                                            </TableRow>
                                                        </TableHeader>
                                                        <TableBody>
                                                            <TableRow className="hover:bg-indigo-50/30 transition-colors">
                                                                <TableCell className="font-black text-indigo-700">Custom Algorithm (Exp. Smoothing, α=0.7)</TableCell>
                                                                <TableCell className="font-bold text-gray-900">{selectedProductAnalysis.metrics.exponentialSmoothing.mae} units</TableCell>
                                                                <TableCell className="font-bold text-gray-900">{selectedProductAnalysis.metrics.exponentialSmoothing.rmse} units</TableCell>
                                                                <TableCell className="font-bold text-gray-900">{selectedProductAnalysis.metrics.exponentialSmoothing.mape}</TableCell>
                                                                <TableCell className="font-bold text-indigo-700">{selectedProductAnalysis.metrics.exponentialSmoothing.wape}</TableCell>
                                                            </TableRow>
                                                            <TableRow className="hover:bg-gray-50 transition-colors">
                                                                <TableCell className="font-black text-gray-600">Simple Moving Average (SMA, 3-Wk)</TableCell>
                                                                <TableCell className="font-medium text-gray-700">{selectedProductAnalysis.metrics.sma.mae} units</TableCell>
                                                                <TableCell className="font-medium text-gray-700">{selectedProductAnalysis.metrics.sma.rmse} units</TableCell>
                                                                <TableCell className="font-medium text-gray-700">{selectedProductAnalysis.metrics.sma.mape}</TableCell>
                                                                <TableCell className="font-medium text-gray-700">{selectedProductAnalysis.metrics.sma.wape}</TableCell>
                                                            </TableRow>
                                                        </TableBody>
                                                    </Table>
                                                </div>

                                                {/* Metric-by-metric product winners */}
                                                <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                                                    <div className="bg-gray-50 border border-gray-200 rounded-xl p-3 text-center">
                                                        <p className="text-[10px] font-black uppercase tracking-wider text-gray-500">MAE Winner</p>
                                                        <p className="text-xs font-black text-gray-900 mt-1">
                                                            {selectedProductAnalysis.metrics.exponentialSmoothing.maeRaw < selectedProductAnalysis.metrics.sma.maeRaw
                                                                ? 'Custom Algo (ES)'
                                                                : selectedProductAnalysis.metrics.sma.maeRaw < selectedProductAnalysis.metrics.exponentialSmoothing.maeRaw
                                                                    ? 'Simple Moving Avg'
                                                                    : 'Tie'}
                                                        </p>
                                                    </div>
                                                    <div className="bg-gray-50 border border-gray-200 rounded-xl p-3 text-center">
                                                        <p className="text-[10px] font-black uppercase tracking-wider text-gray-500">RMSE Winner</p>
                                                        <p className="text-xs font-black text-gray-900 mt-1">
                                                            {selectedProductAnalysis.metrics.exponentialSmoothing.rmseRaw < selectedProductAnalysis.metrics.sma.rmseRaw
                                                                ? 'Custom Algo (ES)'
                                                                : selectedProductAnalysis.metrics.sma.rmseRaw < selectedProductAnalysis.metrics.exponentialSmoothing.rmseRaw
                                                                    ? 'Simple Moving Avg'
                                                                    : 'Tie'}
                                                        </p>
                                                    </div>
                                                    <div className="bg-gray-50 border border-gray-200 rounded-xl p-3 text-center">
                                                        <p className="text-[10px] font-black uppercase tracking-wider text-gray-500">MAPE Winner</p>
                                                        <p className="text-xs font-black text-gray-900 mt-1">
                                                            {selectedProductAnalysis.metrics.exponentialSmoothing.mapeRaw !== null && selectedProductAnalysis.metrics.sma.mapeRaw !== null
                                                                ? (selectedProductAnalysis.metrics.exponentialSmoothing.mapeRaw < selectedProductAnalysis.metrics.sma.mapeRaw
                                                                    ? 'Custom Algo (ES)'
                                                                    : selectedProductAnalysis.metrics.sma.mapeRaw < selectedProductAnalysis.metrics.exponentialSmoothing.mapeRaw
                                                                        ? 'Simple Moving Avg'
                                                                        : 'Tie')
                                                                : 'N/A (0 sales)'}
                                                        </p>
                                                    </div>
                                                    <div className="bg-gray-50 border border-gray-200 rounded-xl p-3 text-center">
                                                        <p className="text-[10px] font-black uppercase tracking-wider text-gray-500">WAPE Winner</p>
                                                        <p className="text-xs font-black text-gray-900 mt-1">
                                                            {selectedProductAnalysis.metrics.exponentialSmoothing.wapeRaw !== null && selectedProductAnalysis.metrics.sma.wapeRaw !== null
                                                                ? (selectedProductAnalysis.metrics.exponentialSmoothing.wapeRaw < selectedProductAnalysis.metrics.sma.wapeRaw
                                                                    ? 'Custom Algo (ES)'
                                                                    : selectedProductAnalysis.metrics.sma.wapeRaw < selectedProductAnalysis.metrics.exponentialSmoothing.wapeRaw
                                                                        ? 'Simple Moving Avg'
                                                                        : 'Tie')
                                                                : 'N/A (0 sales)'}
                                                        </p>
                                                    </div>
                                                </div>

                                                <h4 className="font-bold text-gray-900 flex items-center gap-2 mt-6 mb-3">
                                                    <Calculator className="size-5 text-indigo-600" /> Day-by-Day Historical Demand and Forecast Errors
                                                </h4>
                                                <div className="border border-gray-200 rounded-xl overflow-hidden shadow-xs mb-6">
                                                    <Table>
                                                        <TableHeader>
                                                            <TableRow className="bg-gray-50 border-b-2 border-gray-200">
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3">Period (Date)</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3 text-center">Actual Demand</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3 text-center">SMA Forecast</TableHead>
                                                                <TableHead className="font-bold text-indigo-700 uppercase tracking-wider text-xs py-3 text-center">Exp. Smoothing Forecast</TableHead>
                                                                <TableHead className="font-bold text-gray-700 uppercase tracking-wider text-xs py-3 text-center">SMA Error |e|</TableHead>
                                                                <TableHead className="font-bold text-indigo-700 uppercase tracking-wider text-xs py-3 text-center">ES Error |e|</TableHead>
                                                                <TableHead className="font-bold text-gray-800 uppercase tracking-wider text-xs py-3 text-center">Better Model</TableHead>
                                                            </TableRow>
                                                        </TableHeader>
                                                        <TableBody>
                                                            {selectedProductAnalysis.metrics.chartData.map((data: any, idx: number) => (
                                                                <TableRow key={idx} className="hover:bg-gray-50 transition-colors">
                                                                    <TableCell className="font-medium text-gray-700">{data.date}</TableCell>
                                                                    <TableCell className="font-black text-gray-900 text-center">{data.Actual}</TableCell>
                                                                    <TableCell className="font-medium text-gray-600 text-center">{data.SMA}</TableCell>
                                                                    <TableCell className="font-black text-indigo-600 text-center">{data['Exp. Smoothing']}</TableCell>
                                                                    <TableCell className="font-mono text-xs text-gray-600 text-center">{data.smaDiff ?? '-'}</TableCell>
                                                                    <TableCell className="font-mono text-xs text-indigo-700 text-center">{data.esDiff ?? '-'}</TableCell>
                                                                    <TableCell className="text-center">
                                                                        <Badge className={`text-[10px] font-bold border-none ${data.diffAdvantage === 'ES' ? 'bg-indigo-100 text-indigo-800' : data.diffAdvantage === 'SMA' ? 'bg-gray-100 text-gray-700' : 'bg-gray-50 text-gray-500'}`}>
                                                                            {data.diffAdvantage || 'Tie'}
                                                                        </Badge>
                                                                    </TableCell>
                                                                </TableRow>
                                                            ))}
                                                        </TableBody>
                                                    </Table>
                                                </div>
                                            </>
                                        ) : (
                                            <div className="bg-orange-50 border border-orange-200 text-orange-800 p-6 rounded-lg mt-6 shadow-sm flex items-center gap-3 font-medium">
                                                <AlertTriangle className="size-6 text-orange-600" />
                                                Insufficient historical demand data to calculate accuracy metrics for this product. Wait for more sales data.
                                            </div>
                                        )}
                                    </div>
                                ) : (
                                    <div className="space-y-6">
                                        <DialogHeader>
                                            <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 border-b pb-4">
                                                <DialogTitle className="text-indigo-900 flex items-center gap-3 text-2xl font-black">
                                                    <div className="bg-indigo-100 p-2 rounded-lg">
                                                        <ShieldCheck className="size-6 text-indigo-600" />
                                                    </div>
                                                    Forecasting Analytics & Algorithm Accuracy Evaluation
                                                </DialogTitle>
                                                <div className="flex items-center gap-2 bg-gray-100 p-1 rounded-lg border border-gray-200">
                                                    <button
                                                        type="button"
                                                        onClick={() => setEvaluationPeriod('90_days')}
                                                        className={`px-3 py-1.5 text-xs font-bold rounded-md transition-all ${evaluationPeriod === '90_days' ? 'bg-indigo-600 text-white shadow' : 'text-gray-600 hover:text-gray-900'}`}
                                                    >
                                                        May 28 – Aug 25 (90-Day Research Horizon)
                                                    </button>
                                                    <button
                                                        type="button"
                                                        onClick={() => setEvaluationPeriod('july_august')}
                                                        className={`px-3 py-1.5 text-xs font-bold rounded-md transition-all ${evaluationPeriod === 'july_august' ? 'bg-indigo-600 text-white shadow' : 'text-gray-600 hover:text-gray-900'}`}
                                                    >
                                                        Jul 2 – Aug 25 (55 Days)
                                                    </button>
                                                    <button
                                                        type="button"
                                                        onClick={() => setEvaluationPeriod('all')}
                                                        className={`px-3 py-1.5 text-xs font-bold rounded-md transition-all ${evaluationPeriod === 'all' ? 'bg-indigo-600 text-white shadow' : 'text-gray-600 hover:text-gray-900'}`}
                                                    >
                                                        All Transactions
                                                    </button>
                                                </div>
                                            </div>
                                        </DialogHeader>

                                        {/* Data Source Notice Banner */}
                                        <div className="bg-blue-50/70 border border-blue-200/80 rounded-xl p-3 text-xs text-blue-900 flex items-start gap-2.5">
                                            <Info className="size-4 text-blue-600 shrink-0 mt-0.5" />
                                            <div className="space-y-0.5">
                                                <span className="font-bold">Evaluation Dataset Transparency:</span>
                                                <p className="text-[11px] text-blue-800">
                                                    {evaluationPeriod === '90_days'
                                                        ? 'Active dataset covers 90 calendar days (May 28 – August 25, 2026). August 3–25 represents actual observed store checkout records, while May 28–August 2 provides calibrated historical baseline sales for initial model training (W=21 days).'
                                                        : 'Active dataset covers 55 calendar days (July 2 – August 25, 2026). August 3–25 represents actual observed store checkout records, while July 2–August 2 provides calibrated historical baseline sales for model training.'}
                                                </p>
                                            </div>
                                        </div>

                                        {/* Quick Product Inspection Selector */}
                                        <div className="bg-white border border-gray-200 rounded-xl p-4 shadow-2xs flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-3">
                                            <div>
                                                <h4 className="text-sm font-bold text-gray-900 flex items-center gap-1.5">
                                                    <Package className="size-4 text-indigo-600" /> Inspect Per-Product Forecast Details
                                                </h4>
                                                <p className="text-xs text-gray-500">Pick any product SKU from the inventory to view its isolated historical series, chart curves, and daily errors.</p>
                                            </div>
                                            <div className="w-full sm:w-72">
                                                <select
                                                    className="w-full h-10 px-3 text-xs font-bold border border-gray-200 rounded-lg bg-gray-50 hover:bg-white focus:bg-white focus:border-indigo-500 focus:outline-none transition-colors"
                                                    onChange={(e) => {
                                                        const found = productMetrics.find(pm => String(pm.product.id) === e.target.value);
                                                        if (found) setSelectedProductAnalysis(found);
                                                    }}
                                                    defaultValue=""
                                                >
                                                    <option value="" disabled>-- Select a Product to Inspect --</option>
                                                    {productMetrics.map(pm => (
                                                         <option key={pm.product.id} value={pm.product.id}>
                                                             {pm.product.sku} — {pm.product.name}
                                                         </option>
                                                    ))}
                                                </select>
                                            </div>
                                        </div>

                                        {/* Overall Algorithm Benchmark Summary */}
                                        {overallAccuracy && (
                                            <div className="bg-gradient-to-br from-indigo-50/70 via-white to-purple-50/40 border border-indigo-200/80 rounded-2xl p-6 shadow-sm space-y-6">
                                                <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 border-b border-indigo-100 pb-4">
                                                    <div>
                                                        <div className="flex items-center gap-2">
                                                            <Badge className="bg-indigo-600 text-white font-bold text-xs uppercase tracking-wider">
                                                                Overall Benchmark
                                                            </Badge>
                                                            <span className="text-xs text-gray-700 font-semibold">
                                                                Evaluated across {overallAccuracy.evaluatedCount} active products with historical demand
                                                            </span>
                                                        </div>
                                                        <h3 className="text-xl font-black text-gray-900 mt-1.5 tracking-tight">
                                                            Model Accuracy: Custom Algorithm (Exp. Smoothing) vs. Simple Moving Average (SMA)
                                                        </h3>
                                                        <p className="text-xs text-gray-700 font-semibold mt-0.5">
                                                            Performance comparison using Mean Absolute Error (MAE), Root Mean Squared Error (RMSE), and Mean Absolute Percentage Error (MAPE).
                                                        </p>
                                                    </div>
                                                    <div className="bg-white border-2 border-indigo-200 rounded-xl px-4 py-2.5 text-right shadow-xs shrink-0">
                                                        <p className="text-[10px] font-black uppercase tracking-wider text-indigo-500">Benchmark Verdict</p>
                                                        <p className="text-sm font-black text-indigo-900">{overallAccuracy.overallWinner}</p>
                                                    </div>
                                                </div>

                                                {/* 3 Prominent Comparison Cards: Overall Mean MAE, Overall Mean RMSE, Overall Mean MAPE */}
                                                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                                                    {/* MAE Card */}
                                                    <div className="bg-white border-2 border-indigo-100 rounded-xl p-4 shadow-sm hover:border-indigo-300 transition-colors">
                                                        <div className="flex items-center justify-between mb-1.5">
                                                            <span className="text-xs font-black uppercase tracking-wider text-gray-700">Overall Mean MAE</span>
                                                            <Badge variant="outline" className={`text-[10px] font-bold ${overallAccuracy.maeWinner.includes('Custom') ? 'bg-indigo-50 text-indigo-700 border-indigo-200' : 'bg-gray-100 text-gray-700'}`}>
                                                                {overallAccuracy.maeWinner.includes('Custom') ? 'ES Outperforms' : 'SMA Outperforms'}
                                                            </Badge>
                                                        </div>
                                                        <p className="text-[11px] text-gray-700 font-semibold mb-3">Mean Absolute Error (Lower = Better)</p>
                                                        <div className="space-y-2">
                                                            <div className="flex items-center justify-between bg-indigo-50/70 px-3 py-2 rounded-lg border border-indigo-100/60">
                                                                <span className="text-xs font-bold text-indigo-950">Overall ES Mean MAE:</span>
                                                                <span className="text-sm font-black text-indigo-700">{overallAccuracy.esMeanMae} units</span>
                                                            </div>
                                                            <div className="flex items-center justify-between bg-gray-50 px-3 py-2 rounded-lg border border-gray-200/60">
                                                                <span className="text-xs font-semibold text-gray-600">SMA Mean MAE:</span>
                                                                <span className="text-sm font-bold text-gray-700">{overallAccuracy.smaMeanMae} units</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    {/* RMSE Card */}
                                                    <div className="bg-white border-2 border-indigo-100 rounded-xl p-4 shadow-sm hover:border-indigo-300 transition-colors">
                                                        <div className="flex items-center justify-between mb-1.5">
                                                            <span className="text-xs font-black uppercase tracking-wider text-gray-700">Overall Mean RMSE</span>
                                                            <Badge variant="outline" className={`text-[10px] font-bold ${overallAccuracy.rmseWinner.includes('Custom') ? 'bg-indigo-50 text-indigo-700 border-indigo-200' : 'bg-gray-100 text-gray-700'}`}>
                                                                {overallAccuracy.rmseWinner.includes('Custom') ? 'ES Outperforms' : 'SMA Outperforms'}
                                                            </Badge>
                                                        </div>
                                                        <p className="text-[11px] text-gray-700 font-semibold mb-3">Root Mean Squared Error (Lower = Better)</p>
                                                        <div className="space-y-2">
                                                            <div className="flex items-center justify-between bg-indigo-50/70 px-3 py-2 rounded-lg border border-indigo-100/60">
                                                                <span className="text-xs font-bold text-indigo-950">Overall ES Mean RMSE:</span>
                                                                <span className="text-sm font-black text-indigo-700">{overallAccuracy.esMeanRmse} units</span>
                                                            </div>
                                                            <div className="flex items-center justify-between bg-gray-50 px-3 py-2 rounded-lg border border-gray-200/60">
                                                                <span className="text-xs font-semibold text-gray-600">SMA Mean RMSE:</span>
                                                                <span className="text-sm font-bold text-gray-700">{overallAccuracy.smaMeanRmse} units</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    {/* MAPE Card */}
                                                    <div className="bg-white border-2 border-indigo-100 rounded-xl p-4 shadow-sm hover:border-indigo-300 transition-colors">
                                                        <div className="flex items-center justify-between mb-1.5">
                                                            <span className="text-xs font-black uppercase tracking-wider text-gray-700">Overall Mean MAPE</span>
                                                            <Badge variant="outline" className={`text-[10px] font-bold ${overallAccuracy.mapeWinner.includes('Custom') ? 'bg-indigo-50 text-indigo-700 border-indigo-200' : 'bg-gray-100 text-gray-700'}`}>
                                                                {overallAccuracy.mapeWinner.includes('Custom') ? 'ES Outperforms' : 'SMA Outperforms'}
                                                            </Badge>
                                                        </div>
                                                        <p className="text-[11px] text-gray-700 font-semibold mb-3">Mean Absolute Percentage Error (Lower = Better)</p>
                                                        <div className="space-y-2">
                                                            <div className="flex items-center justify-between bg-indigo-50/70 px-3 py-2 rounded-lg border border-indigo-100/60">
                                                                <span className="text-xs font-bold text-indigo-950">Overall ES Mean MAPE:</span>
                                                                <span className="text-sm font-black text-indigo-700">{overallAccuracy.esMeanMape}</span>
                                                            </div>
                                                            <div className="flex items-center justify-between bg-gray-50 px-3 py-2 rounded-lg border border-gray-200/60">
                                                                <span className="text-xs font-semibold text-gray-600">SMA Mean MAPE:</span>
                                                                <span className="text-sm font-bold text-gray-700">{overallAccuracy.smaMeanMape}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                {/* Detailed Summary Table */}
                                                <div className="border border-indigo-100 rounded-xl overflow-hidden bg-white shadow-xs">
                                                    <Table>
                                                        <TableHeader>
                                                            <TableRow className="bg-indigo-50/60 border-b border-indigo-100">
                                                                <TableHead className="font-bold text-indigo-950 text-xs py-3">Evaluation Metric</TableHead>
                                                                <TableHead className="font-bold text-indigo-700 text-xs py-3">Custom Algorithm (Exp. Smoothing, α = 0.7)</TableHead>
                                                                <TableHead className="font-bold text-gray-700 text-xs py-3">Simple Moving Average (SMA)</TableHead>
                                                                <TableHead className="font-bold text-gray-800 text-xs py-3">Winning Model</TableHead>
                                                            </TableRow>
                                                        </TableHeader>
                                                        <TableBody>
                                                            <TableRow className="hover:bg-indigo-50/20">
                                                                <TableCell className="font-bold text-gray-900 text-xs">Mean Absolute Error (MAE)</TableCell>
                                                                <TableCell className="font-black text-indigo-700 text-sm">{overallAccuracy.esMeanMae} units</TableCell>
                                                                <TableCell className="font-medium text-gray-600 text-sm">{overallAccuracy.smaMeanMae} units</TableCell>
                                                                <TableCell>
                                                                    <Badge className="bg-indigo-100 text-indigo-800 border-none font-bold text-xs">
                                                                        {overallAccuracy.maeWinner}
                                                                    </Badge>
                                                                </TableCell>
                                                            </TableRow>
                                                            <TableRow className="hover:bg-indigo-50/20">
                                                                <TableCell className="font-bold text-gray-900 text-xs">Root Mean Squared Error (RMSE)</TableCell>
                                                                <TableCell className="font-black text-indigo-700 text-sm">{overallAccuracy.esMeanRmse} units</TableCell>
                                                                <TableCell className="font-medium text-gray-600 text-sm">{overallAccuracy.smaMeanRmse} units</TableCell>
                                                                <TableCell>
                                                                    <Badge className="bg-indigo-100 text-indigo-800 border-none font-bold text-xs">
                                                                        {overallAccuracy.rmseWinner}
                                                                    </Badge>
                                                                </TableCell>
                                                            </TableRow>
                                                            <TableRow className="hover:bg-indigo-50/20">
                                                                <TableCell className="font-bold text-gray-900 text-xs">Mean Absolute Percentage Error (MAPE)</TableCell>
                                                                <TableCell className="font-black text-indigo-700 text-sm">{overallAccuracy.esMeanMape}</TableCell>
                                                                <TableCell className="font-medium text-gray-600 text-sm">{overallAccuracy.smaMeanMape}</TableCell>
                                                                <TableCell>
                                                                    <Badge className="bg-indigo-100 text-indigo-800 border-none font-bold text-xs">
                                                                        {overallAccuracy.mapeWinner}
                                                                    </Badge>
                                                                </TableCell>
                                                            </TableRow>
                                                        </TableBody>
                                                    </Table>
                                                </div>
                                            </div>
                                        )}

                                        <div className="pt-2">
                                            <h3 className="text-xs font-black text-gray-500 uppercase tracking-widest mb-4">Demand Classification</h3>
                                            <div className="flex gap-2 bg-gray-50 p-1 rounded-lg w-max border border-gray-200 shadow-sm">
                                                {['High Demand', 'Medium Demand', 'Low Demand'].map(tab => (
                                                    <button
                                                        key={tab}
                                                        onClick={() => setDemandTab(tab as any)}
                                                        className={`px-4 py-2 text-sm font-bold rounded-md transition-all ${demandTab === tab ? 'bg-indigo-600 text-white shadow' : 'text-gray-600 hover:text-gray-900 hover:bg-gray-100'}`}
                                                    >
                                                        {tab}
                                                    </button>
                                                ))}
                                            </div>
                                        </div>

                                        <div className="pb-4">
                                            <div className="flex items-center justify-between mb-4 mt-8">
                                                <h3 className="text-sm font-black text-gray-800 uppercase tracking-widest">{demandTab} Products</h3>
                                                <Badge className="bg-gray-100 text-gray-600 hover:bg-gray-100 border-none">
                                                    {productMetrics.filter(pm => pm.metrics.classification === demandTab).length} products
                                                </Badge>
                                            </div>

                                            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                                {productMetrics.filter(pm => pm.metrics.classification === demandTab).length === 0 && (
                                                    <div className="col-span-full p-12 text-center flex flex-col items-center justify-center text-gray-400 bg-gray-50/50 rounded-xl border-2 border-dashed border-gray-200">
                                                        <Package className="size-12 mb-4 text-gray-300" />
                                                        <p className="font-bold text-gray-500">No products found in this category.</p>
                                                    </div>
                                                )}
                                                {productMetrics.filter(pm => pm.metrics.classification === demandTab).map(pm => (
                                                    <Card key={pm.product.id} className="hover:border-indigo-300 hover:shadow-md transition-all duration-200 group bg-white">
                                                        <CardContent className="p-5 flex flex-col h-full justify-between gap-5">
                                                            <div>
                                                                <h4 className="font-black text-lg text-gray-900 truncate tracking-tight">{pm.product.name}</h4>
                                                                <Badge className="bg-indigo-50 text-indigo-700 hover:bg-indigo-50 border border-indigo-100 mt-2 font-bold uppercase tracking-wider text-[10px]">
                                                                    {pm.metrics.classification}
                                                                </Badge>
                                                                <div className="flex-1 bg-white p-3 rounded-lg border border-gray-200 text-center shadow-sm">
                                                                    <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1">Avg Daily Demand</p>
                                                                    <p className="text-xl font-black text-gray-900">{pm.metrics.avgDailyDemand} <span className="text-xs text-gray-500 font-medium tracking-normal lowercase">units</span></p>
                                                                </div>
                                                            </div>
                                                            <Button
                                                                className="w-full justify-between group-hover:bg-indigo-600 group-hover:text-white transition-colors bg-white text-indigo-700 border border-indigo-200 hover:bg-indigo-700"
                                                                onClick={() => setSelectedProductAnalysis(pm)}
                                                            >
                                                                View Forecast Analysis
                                                                <ArrowRight className="size-4 group-hover:translate-x-1 transition-transform" />
                                                            </Button>
                                                        </CardContent>
                                                    </Card>
                                                ))}
                                            </div>
                                        </div>
                                    </div>
                                )}
                            </DialogContent>
                        </Dialog>
                    )}
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
