# ====================================================
# 01_download_sst.py
#
# Download ERA5 sea surface temperature (SST)
# data from the Copernicus Climate Data Store (CDS)
# for 1995–2023 using the CDS API.
#
# Output: NetCDF file saved to data/raw/
# ====================================================

import cdsapi

client = cdsapi.Client()

client.retrieve(
    "reanalysis-era5-single-levels",
    {
        "product_type": "reanalysis",
        "variable": "sea_surface_temperature",

        # Years
        "year": [str(y) for y in range(1995, 2024)],

        # All months
        "month": [f"{m:02d}" for m in range(1, 13)],

        # All days
        "day": [f"{d:02d}" for d in range(1, 32)],

        # Daily SST (00 UTC)
        "time": "00:00",

        # Western Pacific region
        # North, West, South, East
        "area": [45, 120, 20, 150],

        # Output format
        "data_format": "netcdf",
        "download_format": "unarchived"
    },
    "../data/raw/era5_sst_1995_2023.nc"
)