# Typhoon Dataset – Data Dictionary

| Variable   | Type | Description |
|------------|------|-------------|
| sid        | chr  | Unique identifier for each tropical cyclone (storm system). |
| basin      | chr  | Ocean basin where the storm was recorded (e.g., WP = Western Pacific), as defined in IBTrACS. |
| name       | chr  | Assigned storm name (e.g., typhoon name). May be missing for unnamed systems or early-stage disturbances. |
| lat        | dbl  | Latitude of storm position (degrees north). |
| lon        | dbl  | Longitude of storm position (degrees east). |
| year       | dbl  | Year extracted from ISO_TIME. |
| month      | dbl  | Month extracted from ISO_TIME. |
| usa_wind   | dbl  | Maximum sustained wind speed (knots), IBTrACS best-track estimate (USA agency). |
| usa_pres   | dbl  | Minimum central pressure (hPa), IBTrACS best-track estimate (USA agency). |
| iso_time   | dttm | Timestamp of each storm observation (YYYY-MM-DD HH:MM:SS). |
| sst        | dbl  | Sea surface temperature (Kelvin) extracted from ERA5 at storm location and time. |