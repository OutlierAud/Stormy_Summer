# 📦 **Data Source & Preprocessing**

## **Overview**
To focus our study on **Northeast Asia**, we filter the raw data to:
- retain only **storms occurring within a spatial area spanning the South China Sea through the Western North Pacific** (approximately 120°E–150°E and 20°N–45°N)
- retain only storms during the peak summer months of **June–September**

Since the **response variable** is seasonal typhoon frequency, we construct an annual dataset by:
- aggregating filtered storm observations by calendar year to obtain a single typhoon count per year
- merging these annual typhoon counts with corresponding summer sea surface temperature (SST) values using year as the common key

The final dataset is at the **annual level**, where each observation represents one year, with both typhoon counts and SST values used for subsequent analysis and statistical modeling.

## **Typhoon Data Acquisition & Pre-processing**
- **1995–2023 typhoon records** obtained from the [International Best Track Archive for Climate Stewardship (IBTrACS)](https://www.ncei.noaa.gov/data/international-best-track-archive-for-climate-stewardship-ibtracs/v04r00/access/csv/), provided by the National Centers for Environmental Information (NCEI).

Due to the large file size of the raw typhoon dataset (>100 MB) the following preprocessing steps were performed offline using R:

**Spatial Filtering**: Retained only storms within the Northeast Asia region (Latitude: 20°N – 45°N, Longitude: 120°E – 150°E).  
**Temporal Filtering**: Kept only track points occurring during the peak summer months (June – September).  
**Era Filtering**: Restricted the data to the modern satellite era (1950 – 2024) to ensure reliable detection and avoid undercounts in the pre-satellite era.  
**Aggregation**: Removed duplicate track points per storm and aggregated the data to a single annual count per year.  

## **Temperature Data Acquisition & Pre-processing**
- **1995–2023 historical sea surface temperature (SST) data** obtained from the [ERA5 Reanalysis](https://cds.climate.copernicus.eu/datasets/reanalysis-era5-single-levels) via the Copernicus Climate Data Store (CDS) API.

## Final Dataset
The cleaned typhoon track data and corresponding SST values were merged at the **typhoon observation level**. Each row represents an individual typhoon track observation with its geographic coordinates and associated SST value.

This observation-level dataset is used for the exploratory spatial analysis (Kaggle notebook 01). **For the subsequent statistical modelling, the data will be aggregated by year to derive the seasonal typhoon count and corresponding mean summer SST.**


## Dataset Summary

The cleaned dataset captures the key dimensions required for analysis:
- intensity (USA_WIND, USA_PRES)
- identity (SID, NAME)
- location (LAT, LON, BASIN)
- time (ISO_TIME, year, month)
