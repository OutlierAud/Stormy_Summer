# <span style="color: #00e6e6;">🌪️ Can SST Explain Seasonal Typhoon Frequency in Northeast Asia?</span>

**Exploring the relationship between summer sea surface temperature (SST) and seasonal typhoon frequency using exploratory data analysis, Poisson regression, Method of Moments, and Maximum Likelihood Estimation in R.**

This project investigates whether historical summer sea surface temperature (SST) is associated with seasonal typhoon frequency in Northeast Asia. Using historical observations from **1995–2023**, the project develops a statistical model to estimate the expected number of typhoons during the **2026 summer season**.

## Kaggle Notebook

The complete exploratory data analysis, statistical modelling, visualisations, and interpretation are available in the accompanying Kaggle notebook.

🔗 [Open the notebook]

---

## Research Question

> **Is summer sea surface temperature associated with the seasonal frequency of typhoons entering Northeast Asia, and can this relationship be used to estimate the number of typhoons expected during the 2026 summer season?**

---

## Study Variables  
Spatial Study Region: **Western North Pacific**  
Research Focus Region: **Northeast Asia**  

The Western North Pacific is the primary basin in which tropical cyclones that affect Northeast Asia develop and propagate.

| Variable | Description | Role |
|----------|-------------|------|
| **Seasonal Typhoon Count** | Number of typhoons (maximum sustained wind ≥ 64 knots) entering the study region during each summer season. | **Response (Y)** |
| **Mean Summer Sea Surface Temperature (SST)** | Average sea surface temperature within the study region during the corresponding summer season. | **Predictor (X)** |
| **Western North Pacific** | Spatial domain over which the typhoon and SST data are analysed. | **Spatial study region** |
| **Northeast Asia** | Geographic region that motivates the study and for which the findings are intended to provide insight. | **Research focus region** |

---

## 👩🏻‍💻 Project Goals

### 1. Explore the relationship between SST and seasonal typhoon frequency

- Use exploratory data analysis to investigate how mean summer sea surface temperature (SST) is associated with the seasonal number of typhoons entering the study region.

### 2. Model seasonal typhoon counts using Poisson regression

- Develop a Poisson regression model to quantify the relationship between SST and seasonal typhoon frequency.
- Evaluate model assumptions and assess overdispersion.
- Compare Poisson and Negative Binomial regression models where appropriate.
- Estimate model parameters using both the Method of Moments (MoM) and Maximum Likelihood Estimation (MLE).

### 3. Estimate the 2026 summer typhoon season

- Use the final statistical model to estimate the expected number of typhoons entering the study region during the **2026 summer season**.

---

## 👩🏻‍💻 Data & Reproducibility

> **The raw datasets are not stored in this repository because they exceed GitHub’s file-size limits.**  
> To reproduce the analysis:
> 1. Create an account with the Copernicus Climate Data Store (CDS)
> 2. Configure your CDS API credentials.
> 3. Clone this repository.
> 4. Run `scripts/01_clean_data.R` (Download raw data from source)
> 5. Run `scripts/02_analysis.R` (Creates data/processed/typhoon_clean.csv)
> 6. Run `scripts/03_extract_sst.R` (Creates data/features/typhoon_sst.csv)


- **1995–2023 engineered modelling dataset** containing seasonal typhoon observations and corresponding mean summer sea surface temperature (SST), derived from IBTrACS typhoon records and ERA5 SST data. These observations will later be aggregated into annual summaries for statistical modelling. See the **Data Dictionary** and **Data README** in the [`data/`](data/) directory for variable definitions, preprocessing steps, and feature engineering details.

- **1995–2023 historical typhoon records** obtained from the [International Best Track Archive for Climate Stewardship (IBTrACS)](https://www.ncei.noaa.gov/data/international-best-track-archive-for-climate-stewardship-ibtracs/v04r00/access/csv/), provided by the National Centers for Environmental Information (NCEI).

- **1995–2023 historical sea surface temperature (SST) data** obtained from the [ERA5 Reanalysis](https://cds.climate.copernicus.eu/datasets/reanalysis-era5-single-levels) via the Copernicus Climate Data Store (CDS) API.  

### Tools

#### Environment

- Kaggle Notebook (R kernel) for exploratory data analysis, statistical modelling, and visualisation.

#### Key R packages for `scripts/`

- tidyverse — data manipulation and visualisation
- lubridate — date handling
- terra — NetCDF processing and spatial data extraction
- sf — spatial data handling
- ggplot2 — plotting
- MASS — Negative Binomial regression
- AER — overdispersion diagnostics
- here — project file paths

#### Key Python packages

- cdsapi : download ERA5 SST data from the Copernicus Climate Data Store.

---

## Repository Structure

```text
.
├── data/
│   ├── raw/
│   ├── processed/
│   └── features/
├── scripts/
│   ├── 01_download_sst.py
│   ├── 02_preprocess_typhoon.R
│   ├── 03_extract_sst.R
│   └── 04_data_validation.ipynb
├── README.md
└── LICENSE
```

---

## 👩🏻‍💻 Rationale & Plan  
- Historical data from **1995–2023** are used to study the relationship between mean summer sea surface temperature (SST) and seasonal typhoon frequency.
- Seasonal typhoon counts are count data (non-negative integers), making **Poisson regression** an appropriate starting point for modelling.
- Summer SST is used as the main predictor of seasonal typhoon frequency.
- Model assumptions are checked, and a **Negative Binomial regression** model is considered if overdispersion is present.
- Model parameters are estimated using both the **Method of Moments (MoM)** and **Maximum Likelihood Estimation (MLE)**.
- The final model is used to estimate the expected number of typhoons during the **2026 summer season**.

---

## Roadmap

There are six sequential phases, each building on the previous one.

### **1. Data Acquisition & Wrangling**

➡ Clean and preprocess the historical datasets, combine typhoon & sst data for analysis, and data validation.
- Files are found in `script/`

### **2. Exploratory Spatial Analysis**
➡ Visualise the spatial distribution of typhoon tracks and sea surface temperature using heatmaps and overlay maps.
- Kaggle notebook: Typhoon SST Modeling Part 01: Spatial Analysis

### **3. Exploratory Data Analysis (EDA)**
➡ Explore temporal patterns, visualise the relationship between SST and seasonal typhoon frequency, and assess count distribution characteristics.
-

### **4. Distribution Fitting**
➡ Compare parameter estimation using the Method of Moments (MoM) and Maximum Likelihood Estimation (MLE).

### **5. Count Regression Modelling & Prediction**
➡ Fit a Poisson regression model, assess overdispersion, compare with a Negative Binomial model if appropriate, and estimate the expected seasonal typhoon count for **2026**.

### **6. Interpretation**
➡ Interpret model coefficients, compare estimation methods, evaluate model performance, and present the final prediction with confidence intervals.

---

## Workflow

```text
Pre-processing & Engineering Scripts (GitHub)
        │
        ├── Download ERA5 SST
        ├── Clean IBTrACS records
        ├── Extract SST values
        ├── Seasonal aggregation
        └── Construct modelling dataset
                │
                ▼
Engineered Modelling Dataset (Kaggle Input)
                │
                ▼
Kaggle Statistical Notebook
                │
                ├── Exploratory Spatial Visualisation
                ├── Exploratory Data Analysis
                ├── Summer SST Estimation for 2026
                ├── Distribution Fitting & Count Modelling
                ├── Negative Binomial Regression (if required)
                └── 2026 Seasonal Typhoon Count Estimation
```