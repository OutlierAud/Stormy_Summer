# ================================
# 03_extract_sst.R
#
# Extract SST values for each typhoon observation
# ================================

library(here)
library(tidyverse)
library(terra)
library(lubridate)


# Load cleaned typhoon data & sst NetCDF file
typhoon <- read_csv(
  here("data", "processed", "typhoon_clean.csv")
)

# Load SST NetCDF (ERA5)
sst <- rast(
  here("data", "raw", "era5_sst_1995_2023.nc")
)

#to quickly inspect sst: run `sst` or `print(sst)`


# ----------------------------
# Convert typhoon data to spatial format
# (turn lat lon to real geographic points using gps coordinates)
# Use terra function vect() to turn df into vector spatial object
# set x-cord (EW) to lon
# set y-coord (NS) to lat
# define coordinate system crs to EPSG:4326
# EPSG:4326 is the global default gps coordinates for Earth data
# ----------------------------
typhoon_vect <- vect(
  typhoon,
  geom = c("lon", "lat"),
  crs = "EPSG:4326"
)


# Extract SST at each point
# sst = the raster (a grid of sea surface temperatures)
# typhoon_vect = the spatial points created from lon and lat
# Use the longitude and latitude to look up the SST value from the raster.
# [,2] selects the second column of all rows in that data frame.
# save as column named sst in typhoon dataset

# Step 1: Extract SST values
result <- terra::extract(sst, typhoon_vect)

# Step 2: Take the second column of all rows (the SST values)
sst_values <- result[, 2]

# Step 3: Add them to the typhoon data frame
typhoon$sst <- sst_values

# Alternative one line code to condense steps 1 to 3:
# typhoon$sst <- terra::extract(sst, typhoon_vect)[,2]

# Clean the dataset
typhoon_sst <- typhoon |>
  filter(!is.na(sst))


# 6. Save cleaned dataset
write_csv(
  typhoon_sst,
  here("data", "features", "typhoon_sst.csv")

)
