# Complete Manuscript vs. Presentation Alignment Audit & Defense Guide
**Title:** A Web-Based Inventory and Point-of-Sale (POS) System with Data Analytics for Zoe Pharmacy and General Merchandise  
**Authors:** Fhionna Mei G. Faduga, Vincent E. Gipaya, Ela Joy D. Villanueva  
**Degree:** Bachelor of Science in Aviation Information Technology  
**Institution:** Institute of Computer Studies, National Aviation Academy of the Philippines (NAAP), Villamor, Pasay City  
**Evaluation Period:** October 2026  

---

## Executive Summary

This document provides a comprehensive, page-by-page and slide-by-slide verification connecting the **146-Page Final Capstone Manuscript (PDF)** and the **18-Slide Oral Defense Presentation (Google Slides)**. 

### Key Audit Verdict
* **Structural & Contextual Alignment:** **100% Connected.** The research background, problem statement, dual-operator business model, hybrid FIFO/FEFO framework, SDLC (Waterfall with UI Prototyping), 3-tier architecture, technology stack (React.js, Vite, PHP, PostgreSQL), and sampling techniques are completely synchronized across both documents.
* **Financial Model & Return on Investment (ROI):** **100% Identical.** All numbers in Slide 15 match Table 10–13 of the manuscript to the exact peso and percentage (CapEx ₱85,800; Annual tangible savings ₱48,320; 3-year net benefits ₱59,160; ROI 68.95%; NPV ₱50,878; Payback period 1.78 years).
* **Inventory Discrepancy Reduction:** **100% Identical.** Exactly 17.32% baseline error down to 0.83% post-implementation across both documents.
* **Critical Areas Requiring Slide Synchronization:** There are **three (3) numerical discrepancies** in the statistical results (Checkout Duration, Forecasting Accuracy, and ISO Security Score) between older draft figures in the slides and the finalized Chapter 4 data in the manuscript. These must be synchronized prior to the oral defense.

---

## Master Mapping: Every Slide to Every Manuscript Section

| Slide # | Slide Title | Corresponding Manuscript Chapter & Page | Alignment Status | Notes & Cross-Reference |
| :--- | :--- | :--- | :---: | :--- |
| **Slide 1** | Title Slide | **Page 1** (Title Page) | **100% Match** | Complete match on institutional title, author names, BS Aviation IT degree, and October 2026 date. |
| **Slide 2** | Project Context: From Manual Records to Unified System | **Chapter 1 (pp. 2–4, 6–8)**; **Chapter 2 (pp. 32–33)** | **100% Match** | Captures manual logbook friction, dual-operator setup (Margarita & Inigo Caguiron), cognitive overload, and retail-pharmacy compliance gap. |
| **Slide 3** | Research Focus & Objectives | **Chapter 1 (pp. 4–5 [RQs 1–5]; pp. 11–12 [Objectives 1–5])** | **100% Match** | Exact word-for-word mirror of the five research questions and specific objectives. |
| **Slide 4** | Proposed System: Core Features | **Chapter 1 (pp. 8–9)**; **Chapter 3 (pp. 41–42, 67–68, 75–77)** | **100% Match** | Covers Inventory, POS, FIFO/FEFO logic, visual/auditory expiry alerts, descriptive analytics dashboard, and printable PDF audit reports. |
| **Slide 5** | System Architecture & Workflow | **Chapter 3 (pp. 34–35, 70–73, 78–84, Figures 3–6)** | **100% Match** | 3-Tier Thick Client (React.js + Vite frontend, PHP REST API, PostgreSQL database); maps Context Diagram (Fig. 3) and DFD Level 0 (Fig. 4). |
| **Slide 6** | Demand Forecasting: SMA vs. Exponential Smoothing | **Chapter 1 (p. 3)**; **Chapter 2 (pp. 28–30)**; **Chapter 3 (pp. 73–75)** | **100% Match** | Theoretical justification for $\alpha = 0.7$ smoothing constant over static 3-day SMA to absorb local demand shocks. |
| **Slide 7** | Research Methodology | **Chapter 4 (pp. 94–102)** | **100% Match** | One-group pre-test/post-test quasi-experimental design; 10 IT experts (ISO 25010), 2 store owners (TAM), 50 paired simulated transactions, 23-day historical extraction, 7-day live trial. |
| **Slide 8** | Reported Results & Key Findings | **Chapter 4 (pp. 118–123)**; **Chapter 5 (pp. 126–129)** | ⚠️ **Discrepancy** | Uses older post-test values for checkout speed (84.15s vs 37.38s) and forecasting error metrics (2.92 vs 0.54). |
| **Slide 9** | Objective 1 — Operational Impact | **Chapter 4 (p. 119, Table 30)**; **Chapter 5 (p. 126, 129)** | ⚠️ **Discrepancy** | Slide lists digital checkout at 84.15s (60.07% reduction). Manuscript Table 30 records **37.38s (82.26% reduction)** ($t = 27.12, p < 0.001$). |
| **Slide 10** | Objective 2 — Inventory Control | **Chapter 4 (p. 120, Table 31)**; **Chapter 5 (p. 126, 130)** | **100% Match** | Baseline physical discrepancy of 17.32% (15/120 SKUs) reduced to 0.83% post-implementation. |
| **Slide 11** | Objective 3 — Forecasting Accuracy | **Chapter 4 (pp. 121–122, Table 32)**; **Chapter 5 (pp. 127, 130–131)** | 🚨 **Critical Discrepancy** | Slide claims ES won (MAPE 8.40% vs 22.85%). Manuscript Table 32 proves SMA had lower error (MAE 0.52 vs 0.54) and H1 was NOT supported over the 23-day window. |
| **Slide 12** | Objective 4 — User Acceptance (TAM) | **Chapter 4 (pp. 113–118, Tables 25–29)**; **Chapter 5 (p. 128)** | **100% Match** | Composite Mean = **3.68 / 4.00** (PU = 3.90, PEOU = 3.80, Attitude = 3.70, Intention = 3.50, Actual Use = 3.50). |
| **Slide 13** | Objective 5 — Software Quality (ISO 25010) | **Chapter 4 (pp. 104–113, Tables 16–24)**; **Chapter 5 (p. 128)** | ⚠️ **Minor Discrepancy** | Overall Grand Mean is 3.60 across both. Slide lists Security at 3.26; Manuscript Table 21 lists Security at **3.14** (Admin override score = 2.30). |
| **Slide 14** | Scope, Limitations & Practical Value | **Chapter 1 (pp. 14–18)** | **100% Match** | Boundaries: single micro-enterprise site, no BIR official receipts, no GCash API, no dedicated native mobile app, 23-calendar-day data window. |
| **Slide 15** | Financial Feasibility (Cost-Benefit Analysis) | **Chapter 3 (pp. 60–65, Tables 10–13)**; **Chapter 5 (p. 129)** | **100% Match** | CapEx = ₱85,800; Tangible Annual Savings = ₱48,320; 3-Yr Benefits = ₱144,960; Net Benefit = ₱59,160; ROI = 68.95%; Payback = 1.78 years; NPV = ₱50,878. |
| **Slide 16** | Conclusion | **Chapter 5 (pp. 129–131)** | ⚠️ **Needs Alignment** | Must update checkout reduction to 82.26% and reflect the nuanced forecasting conclusion where both models are viable but SMA had slightly lower error over 23 days. |
| **Slide 17** | Recommendations | **Chapter 4 (pp. 123–124, Table 33)**; **Chapter 5 (pp. 132–134)** | **100% Match** | 30-to-60 day parallel run, cloud database backups, 15-minute auto-timeout, and future rankings (Barcode scanner #1, Cashless payments #2, BIR #3, SMS/Email #4, SARIMAX #5). |
| **Slide 18** | Closing / Q&A Slide | **Page 1** | **100% Match** | Academic credentials, department affiliation, author credits. |

---

## Detailed Examination of Critical Discrepancies & Required Edits

### 1. Objective 1: Transaction Processing Speed (Slide 8 & Slide 9)

* **Current Slide Text:**
  * *"Manual Checkout: 210.76s (SD 44.30) | Digital Checkout: 84.15s (SD 12.20)"*
  * *"Reduction: 60.07% lower average checkout time (126.61 seconds faster)"*
* **Manuscript (Page 119, Table 30; Page 126; Page 129):**
  * Manual Processing Mean: **210.76 seconds** (SD = 44.30)
  * Web POS Processing Mean: **37.38 seconds** (SD = 12.57)
  * Mean Difference: **173.38 seconds**
  * Percentage Reduction: **82.26% reduction**
  * Statistical Test: $t = 27.12, p < 0.001$ (Statistically Significant; $H_0$ rejected)
* **Defense Talking Point & Recommendation:**
  * Update Slide 8 and Slide 9 with **37.38s** and **82.26%**. The 37.38s figure demonstrates an even stronger positive operational impact for the micro-enterprise, saving almost 3 minutes per transaction.

---

### 2. Objective 3: Forecasting Accuracy (Slide 8, Slide 11, and Slide 16)

* **Current Slide Text:**
  * *"SMA MAPE: 22.85% | Exponential Smoothing MAPE: 8.40% ($\alpha = 0.7$)"*
  * *"MAE: 7.37 ➔ 2.92 | RMSE: 9.94 ➔ 4.38"*
  * *"Finding: ES recorded lower error metrics, confirming hypothesis."*
* **Manuscript (Page 121–122, Table 32; Page 127; Pages 130–131):**
  * **Table 32 (Page 122):**
    * Simple Moving Average (3-day SMA): **MAE = 0.52**, **RMSE = 0.85**, **MAPE = 92.78%**
    * Exponential Smoothing ($\alpha = 0.7$): **MAE = 0.54**, **RMSE = 0.92**, **MAPE = 94.68%**
  * **Manuscript Discussion & Conclusion (Page 122 & Page 131):**
    > *"These error metrics indicate that the baseline SMA model performed slightly better or comparably to Exponential Smoothing when evaluated over the 23-day period... Consequently, the hypothesis that Exponential Smoothing yields a lower MAE than the SMA baseline is not supported over this short-term window, though both models provide functional restocking guidance without requiring complex historical infrastructure."*
* **Defense Talking Point & Recommendation:**
  * Update Slide 8, 11, and 16 to reflect Table 32. 
  * **Panel Defense Script:** When the panel asks about Objective 3, state:
    > *"Over our 23-calendar-day historical dataset (July 10 to August 1, 2026), both models exhibited comparable error rates, with the 3-day SMA yielding an MAE of 0.52 compared to 0.54 for Exponential Smoothing ($\alpha = 0.7$). Because of the short evaluation timeframe and zero-demand days, the hypothesis that Exponential Smoothing yields a lower MAE was not supported. However, both algorithms successfully generated actionable, non-negative restocking recommendations for the proprietors without requiring enterprise-level data warehouses."*
  * Panelists respect academic honesty and adherence to empirical data.

---

### 3. Objective 5: ISO/IEC 25010 Security Score (Slide 13)

* **Current Slide Text:**
  * *"Security: 3.26 / 4.00 ($S\text{-}CVI = 0.78$)"*
* **Manuscript (Page 110, Table 21; Page 128; Page 131):**
  * ISO Grand Mean: **3.60 / 4.00** (Very High Acceptance)
  * Functional Suitability: **3.90 / 4.00**
  * Security General Weighted Mean: **3.14 / 4.00** (High Acceptance)
  * Specific Security breakdown:
    * Item 1 (Authentication): 3.00
    * Item 2 (Data isolation & encryption): 3.10
    * Item 3 (Admin secure environment / privilege override): **2.30** (Disagree / Moderate Acceptance)
    * Item 4 (Immutable audit trails): 3.70
    * Item 5 (Data confidentiality & privacy): 3.60
  * Content Validity Index: Overall $S\text{-}CVI = \mathbf{1.00}$ (Table 14, Page 103).
* **Defense Talking Point & Recommendation:**
  * Change Security from 3.26 to **3.14**.
  * Highlight that Item 3 scored 2.30 because the IT experts recommended stricter separation of administrative privilege overrides and automated session timeouts before deploying to larger multi-staff teams. This connects directly to your technical recommendations in Chapter 5 (Page 133).

---

## Complete Chapter-by-Chapter Content Verification

### Chapter 1: Introduction, Problem Statement, & Scope
* **Background & Context (pp. 2–8):** Zoe Pharmacy and General Merchandise in Villamor, Pasay City; co-owners Margarita Caguiron (Pharmacist/Owner) and Inigo Caguiron II (Co-owner). Perfectly mirrored in Slide 2.
* **Research Questions (pp. 4–5) & Objectives (pp. 11–12):** 5 questions focused on (1) operational limitations & checkout speed, (2) FIFO/FEFO dual-logic, (3) SMA vs Exponential Smoothing forecasting, (4) TAM user acceptance, and (5) ISO/IEC 25010:2023 technical quality. Fully captured in Slide 3.
* **Scope & Boundaries (pp. 14–18):** Highlights that barcode scanners, GCash/Maya integrations, and BIR tax receipts were intentionally excluded from Phase 1 to preserve budget and avoid third-party recurring fees. Perfectly mirrored in Slide 14.

### Chapter 2: Review of Related Literature (RRL)
* **Structure (pp. 19–33):** Thematic coverage of 58 contemporary references (2022–2026).
* **Core Themes Covered:**
  * Web-based inventory systems ([1]–[10])
  * POS architectures & cloud synchronization ([11]–[23])
  * Predictive retail & pharmacy analytics ([24]–[35])
  * Demand sensing & exponential smoothing ($\alpha = 0.7$) ([36]–[50], [58])
  * Software quality models (ISO 25010 & TAM) ([51]–[57])
* **Research Gap (p. 32–33):** Demonstrates the bifurcation in existing literature between pure retail (FIFO only) and institutional pharmacy systems (heavy FEFO only). Zoe Pharmacy bridges this gap with a lightweight hybrid solution. Perfectly summarized in Slide 2 and Slide 6.

### Chapter 3: System Analysis, Architecture, & Cost-Benefit Analysis
* **Methodology (pp. 34–39):** Waterfall SDLC with UI Prototyping; Gantt chart timeline leading up to August 2026.
* **Architecture (pp. 70–73):** 3-Tier Thick Client architecture (React.js + Vite + TypeScript frontend, PHP RESTful API backend, PostgreSQL database). Visualized in Slide 5.
* **Process & Data Modeling (pp. 78–88):** Context Diagram (Fig. 3), DFD Level 0 (Fig. 4), DFD Level 1 (Fig. 5), Sales Workflow (Fig. 6), Void/Reversion Workflow (Fig. 7), Conceptual Model (Fig. 8), ERD (Fig. 9), Logical Database Design (Fig. 10).
* **Cost-Benefit Analysis (pp. 52–66):** 
  * Development Labor: ₱50,800 (Table 10)
  * Total CapEx: ₱85,800 (Table 11)
  * Tangible Annual Benefits: ₱48,320 (Table 12)
  * 3-Year Tangible Benefits: ₱144,960 (Table 12)
  * Net Benefit: ₱59,160; ROI: 68.95%; BCR: 1.69:1; NPV: ₱50,878; Payback: 1.78 years (Table 13). Slide 15 matches this 100%.

### Chapter 4: Methodology, Evaluation, & Results
* **Research Design (pp. 94–98):** Quasi-experimental one-group pre-test/post-test. 10 IT experts, 2 store owners, 50 paired simulated transaction trials. Slide 7 mirrors this exactly.
* **Reliability & Validity (pp. 102–104):** $S\text{-}CVI = 1.00$ (Table 14); Cronbach's Alpha = 0.90 (Table 15).
* **ISO/IEC 25010 Quality Evaluation (pp. 104–113):** Grand Mean = 3.60. Slide 13 reflects this.
* **TAM Evaluation (pp. 113–118):** Composite Mean = 3.68. Slide 12 reflects this.
* **Performance Metrics (pp. 118–123):**
  * Table 30: Checkout time reduced from 210.76s to 37.38s (82.26% reduction, $p < 0.001$).
  * Table 31: Inventory discrepancy reduced from 17.32% to 0.83%.
  * Table 32: SMA MAE = 0.52 vs ES MAE = 0.54.

### Chapter 5: Summary of Findings, Conclusions, & Recommendations
* **Findings & Conclusions (pp. 125–131):** Aligned 1-to-1 with the 5 research objectives. Slide 16 covers these conclusions.
* **Recommendations (pp. 132–134):**
  * Store Operations: 30-to-60 day parallel run, daily inspection of 6-month FEFO alerts.
  * System Administration: Daily automated off-site cloud PostgreSQL dumps, 15-minute terminal inactivity timeout.
  * Future Work: Barcode scanner integration (Rank 1, 100%), cashless payments GCash/Maya (Rank 2, 63.6%), BIR tax receipts (Rank 3, 45.5%), SMS/Email receipts (Rank 4, 36.4%), advanced time-series SARIMAX modeling (Rank 5, 27.3%). Slide 17 mirrors this ranking 100%.

---

## Action Items Checklist for Presentation Updates

1. **Slide 8 (Reported Results Summary):**
   * Change: `210.76s ➔ 84.15s (60.07%)` $\longrightarrow$ **`210.76s ➔ 37.38s (82.26% reduction)`**
   * Change: `MAE: 7.37 ➔ 2.92` $\longrightarrow$ **`SMA MAE = 0.52 vs. ES MAE = 0.54`**
2. **Slide 9 (Objective 1 — Operational Impact):**
   * Update Digital Checkout from `84.15s` to **`37.38s`**
   * Update reduction rate from `60.07%` to **`82.26%`**
   * Update time saved from `126.61s` to **`173.38s`**
3. **Slide 11 (Objective 3 — Forecasting Accuracy):**
   * Replace earlier draft figures with Table 32:
     * **3-Day SMA Baseline:** MAE = `0.52`, RMSE = `0.85`, MAPE = `92.78%`
     * **Exponential Smoothing ($\alpha = 0.7$):** MAE = `0.54`, RMSE = `0.92`, MAPE = `94.68%`
   * Update finding text: Both models demonstrated comparable accuracy over the 23-calendar-day dataset, providing functional restocking signals.
4. **Slide 13 (Objective 5 — Software Quality):**
   * Update Security score from `3.26` to **`3.14`**
   * Note that $S\text{-}CVI = 1.00$ across all survey validation criteria.
5. **Slide 16 (Conclusion):**
   * Update operational impact bullet to **82.26% checkout reduction**.
   * Update forecasting bullet to reflect comparable short-term performance between SMA and Exponential Smoothing.
