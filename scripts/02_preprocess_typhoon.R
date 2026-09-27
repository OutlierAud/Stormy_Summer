# ============================================
# 02_preprocess_typhoon.R
#
# Clean raw IBTrACS typhoon data and prepare
# for SST extraction and downstream analysis
#
# Output: 
# typhoon_clean.csv file saved to data/processed/
# ============================================

#load packages
library(here)
library(tidyverse)
library(lubridate)

#load raw dataset
typhoon_raw <- read_csv(
    here("data","raw", "ibtracs.WP.list.v04r00.csv")
)

# to check col types
# run glimpse(typhoon_raw)

#Cleaning: Remove invalid metadata like rows
typhoon_clean <- typhoon_raw |>
filter(
LAT != "degrees_north",
LON != "degrees_east"
) |>

#Pre-processing: Convert type, extract month & year
mutate(
    #Convert core spatial variables to numeric
    LAT = as.numeric(LAT),
    LON = as.numeric(LON),
    #extract month year from iso_time
    year = lubridate::year(ISO_TIME),
    month = lubridate::month(ISO_TIME)
) |>

#Regional filter: western pacific box
#Time Period filter: 1995-2023, June to October
#Wind speed 64 knots and over only
filter(
    # 120°E to 150°E and 20°N to 45°N
    LAT >= 20,
    LAT <= 45,
    LON >= 120,
    LON <= 150,
    year >= 1995,

    year <= 2023,
    month >=6,
    month <=10,

    USA_WIND>=64

) |>

select(
    SID,
    ISO_TIME,
    LAT,
    LON,
    year,
    month,
    USA_WIND,
    USA_PRES,
    BASIN,
    NAME

  ) |>

  rename_with(tolower)

summary(typhoon_clean$lat)
summary(typhoon_clean$lon)

#to verify LON range: range(typhoon_clean$lon, na.rm = TRUE)
#to verify LAT range: range(typhoon_clean$lat, na.rm = TRUE)
#to verify year range: range(typhoon_clean$year, na.rm = TRUE)

#save cleaned dataset
write_csv(
    typhoon_clean,
    here("data","processed","typhoon_clean.csv")
)
