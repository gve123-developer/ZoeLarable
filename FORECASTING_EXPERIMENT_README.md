# Forecasting Experiment & Model Accuracy Benchmark: Capstone Documentation
**Project:** Zoe Pharmacy and General Merchandise
**Domain:** Community Retail Pharmacy Inventory Demand Forecasting
**Author / Development:** Zoe Pharmacy Capstone Pair Programming & Research Team
**Evaluation Period:** 90 Calendar Days (May 28, 2026 - August 25, 2026)

---

## 1. Executive Summary and Research Objective

This experimental dataset and audit framework address **Capstone Objective 3**:
> *"Is the Exponential Smoothing forecasting model significantly more accurate than the Simple Moving Average (SMA) model when applied to the pharmacy's demand data?"*

To ensure full research integrity and reproducibility, this evaluation conducts a **strict per-product audit** across all **142 pharmaceutical and retail merchandise items**. Each product maintains its own independent historical demand series, moving average window, smoothing recursion, and metric calculations.

---

## 2. Dataset Composition and Transparency Policy

The benchmark dataset combines operational pharmacy records with calibrated synthetic history to achieve a standard 90-day time horizon:

| Horizon Range | Calendar Days | Classification | Description |
| :--- | :---: | :---: | :--- |
| **May 28 - July 1, 2026** | **35 Days** | `SYNTHETIC_RESEARCH_DATA` | Calibrated synthetic baseline preserving empirical product-level Poisson arrival rates to enable a standard 90-day research horizon. |
| **July 2 - August 2, 2026** | **32 Days** | `SUPPLEMENTAL_DEVELOPMENT_DATA` | Structured pre-audit sales records calibrated against retail distributor delivery velocity and pricing schedules. |
| **August 3 - August 25, 2026** | **23 Days** | `ACTUAL_SALES` | **Directly observed store operations** extracted from Zoe Pharmacy POS transaction logs. |

### Data Integrity Rules Applied:
1. **Itemized Transaction Grouping:** Aggregated by calendar date and exact `product_sku` from line items, strictly excluding voided purchases.
2. **Preservation of Zero-Demand Days:** Intermittent pharmacy days where actual sales = 0 are explicitly preserved as `0` in time series.
3. **Traceability:** Every row in `daily_sales_90d_combined.csv` includes the explicit `data_source` tag.

---

## 3. Forecasting Methodology and Split Configuration

### A. Chronological Split Strategy
* **Total Horizon:** 90 Calendar Days (t = 0 ... 89).
* **Training / Estimation Horizon:** 76 Days (t = 0 ... 75, May 28 - August 11, 2026).
* **Out-of-Sample Test Horizon:** 14 Days (t = 76 ... 89, August 12 - August 25, 2026).
* **Critical Note:** The entire 14-day out-of-sample test horizon falls **strictly within the actual observed store operations period** (`ACTUAL_SALES`, August 3-25, 2026).

### B. Simple Moving Average (SMA) Formulation
The benchmark SMA model applies a 3-week rolling window (W = 21 days), matching standard retail pharmacy supplier delivery intervals:
$$\hat{Y}_{t}^{\text{SMA}} = \frac{1}{W} \sum_{i=1}^{W} Y_{t-i} \quad \text{where } W = 21$$

### C. Exponential Smoothing (ES) Formulation
The Exponential Smoothing model assigns geometrically declining weights to historical observations:
$$\hat{Y}_{t}^{\text{ES}} = \alpha Y_{t-1} + (1 - \alpha) \hat{Y}_{t-1}^{\text{ES}} \quad \text{with } \alpha = 0.50$$
The initial level is initialized on the first W days of training data, and the smoothing state is sequentially updated during out-of-sample evaluation upon observing actual demand.

---

## 4. Evaluation Metrics and Zero-Demand Handling Policy

Evaluating intermittent pharmaceutical demand requires rigorous error handling:

### 1. Mean Absolute Error (MAE)
$$\text{MAE} = \frac{1}{n} \sum_{t=1}^{n} |Y_t - \hat{Y}_t|$$
*Calculated across all n = 14 test days.*

### 2. Root Mean Squared Error (RMSE)
$$\text{RMSE} = \sqrt{\frac{1}{n} \sum_{t=1}^{n} (Y_t - \hat{Y}_t)^2}$$
*Calculated across all n = 14 test days. Heavily penalizes large forecasting misses.*

### 3. Mean Absolute Percentage Error (MAPE)
$$\text{MAPE} = \left( \frac{1}{n_{\text{active}}} \sum_{t \in \{t \mid Y_t > 0\}} \frac{|Y_t - \hat{Y}_t|}{Y_t} \right) \times 100\%$$
* **Zero-Demand Policy:** Standard MAPE is undefined when Y_t = 0 (division by zero). To prevent mathematical distortion or treating undefined values as 0, MAPE is computed **exclusively over days with non-zero sales (Y_t > 0)**. Products with zero demand throughout the entire test period are reported as `N/A (zero test demand)`.

### 4. Weighted Absolute Percentage Error (WAPE)
$$\text{WAPE} = \left( \frac{\sum_{t=1}^{n} |Y_t - \hat{Y}_t|}{\sum_{t=1}^{n} Y_t} \right) \times 100\%$$
* **Why WAPE is included:** WAPE solves the zero-demand division problem by aggregating total absolute errors over total actual sales across the evaluation horizon.

---

## 5. Summary of Empirical Findings (142 Products)

Across all 142 evaluated products during the out-of-sample test window:

| Evaluation Metric | SMA Outperformed | ES Outperformed | Ties / Insufficient Data | Research Finding |
| :--- | :---: | :---: | :---: | :--- |
| **Mean Absolute Error (MAE)** | **71 products (50.0%)** | **69 products (48.6%)** | **2 ties (1.4%)** | Highly competitive parity. SMA slightly edges out on low-velocity flat sales, while ES responds faster to active products. |
| **Root Mean Squared Error (RMSE)** | **94 products (66.2%)** | **47 products (33.1%)** | **1 tie (0.7%)** | SMA achieves lower variance during sporadic zero periods due to wider 21-day smoothing. |
| **Weighted Absolute Percentage Error (WAPE)** | **72 products (50.7%)** | **16 products (11.3%)** | **53 zero test demand / 1 tie** | 53 products had zero sales during the 14-day test period. For active fast-moving products, ES tracks volume shifts dynamically. |

---

## 6. Deliverable File Manifest

1. `daily_sales_90d_combined.csv` (12,780 rows) - Complete 90-day daily demand dataset per SKU with explicit data source classification.
2. `forecast_comparison_90d.csv` (1,988 rows) - Detailed day-by-day test period demand, forecasts, and errors per SKU.
3. `model_accuracy_summary.csv` (142 rows) - Per-product MAE, RMSE, MAPE, WAPE, and metric-specific winners.
4. `FORECASTING_EXPERIMENT_README.md` - This comprehensive documentation and research guide.

---

## 7. Ethical and Operational Safeguards

* **Separation of Concerns:** The 90-day combined research files are standalone analytical deliverables. They do not overwrite live production databases or alter POS financial ledgers.
* **Production Integrity:** In the live application UI, operational inventory decisions continue to be informed by verified store transactions.
