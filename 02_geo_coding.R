library(ggmap)
library(dplyr)
IRS <- readRDS(file = "New_version_data/IRS_data_before_lat_long.rds")
geos <- IRS %>% pull(address) %>% geocode()
saveRDS(geos, file = "New_version_data/geos.rds")

