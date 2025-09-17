library(tidyverse)
library(tidygeocoder)

IRS <- readRDS(file = "data/IRS_data_before_lat_long.rds")
IRS <- head(IRS, n = 7)
# Function to geocode a subset of data
geocode_subset <- function(data_subset) {
  data_subset %>% geocode(address = address,
        method = 'arcgis', lat = latitude , long = longitude)
}

# Split the data into chunks
num_cores <- detectCores() - 1
data_chunks <- split(IRS, rep(1:num_cores, length.out = nrow(IRS)))

# Perform parallel geocoding
results <- mclapply(data_chunks, geocode_subset, mc.cores = num_cores)

# Combine results
final_results <- bind_rows(results)

# Save the results to a CSV file
saveRDS(final_results, file = "data/geos_new.rds")

### example code ###########
# some_addresses <- tibble::tribble(
#   ~name,                  ~addr,
#   "White House",          "1600 pennsylvania ave nw, washington, dc",
#   "Transamerica Pyramid", "600 Montgomery St, San Francisco, CA, 94111",
#   "Willis Tower",         "233 S WACKER DR, CHICAGO, IL, 60606-6300"
# )
#
# lat_longs <- some_addresses %>%
#   geocode(addr, method = 'osm', lat = latitude , long = longitude)
# lat_longs
################

#split_vect<- rep(1:10, length.out = nrow(IRS)) # vector to split by
#split_IRS <-IRS %>% split(split_vect)

# geo_IRS_1<- geocode(split_IRS[[1]], address = address,
#                           method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_2<- geocode(split_IRS[[2]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_3<- geocode(split_IRS[[3]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_4<- geocode(split_IRS[[4]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_5<- geocode(split_IRS[[5]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_6<- geocode(split_IRS[[6]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_7<- geocode(split_IRS[[7]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_8<- geocode(split_IRS[[8]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_9<- geocode(split_IRS[[9]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)
# geo_IRS_10<- geocode(split_IRS[[10]], address = address,
#                     method = 'arcgis', lat = latitude , long = longitude)



# IRSfirst3rd <- IRS[1:15000,]
# IRSsecond3rd <- IRS[15001:30000,]
# IRSthird3rd <- IRS[30001:(length(IRS$ein)),]
#
# geosfirst3rd <-IRSfirst3rd  %>% geocode(address = address,
#               method = 'arcgis', lat = latitude , long = longitude)
#
# saveRDS(geosfirst3rd, file = "data/first_geos.rds")
#
# IRSsecond3rd_A <-IRSsecond3rd[1:8000,]
#
# IRSsecond3rd_B <-IRSsecond3rd[8001:length(IRSfirst3rd$ein),]
# beep(1, geossecond3rd_A<-IRSsecond3rd_A  %>% geocode(address = address,
#                  method = 'arcgis', lat = latitude , long = longitude))
#
# beep(1, geossecond3rd_B<-IRSsecond3rd_B  %>% geocode(address = address,
#                                              method = 'arcgis', lat = latitude , long = longitude))
#
# saveRDS(geossecond3rd_A, file = "data/second_geosA.rds")
# saveRDS(geossecond3rd_B, file = "data/second_geosB.rds")
#
# beep(1, geoslast3rd<-IRSthird3rd  %>% geocode(address = address,
#                                          method = 'arcgis', lat = latitude , long = longitude))
#
# saveRDS(geoslast3rd, file = "data/third_geos.rds")
#
# geos <- rbind(first_geos, geossecond3rd_A, geossecond3rd_B, geoslast3rd)
#
# saveRDS(geos, file = "data/geos.rds")
#
#
# #library(naniar)
# #geos %>%pull(latitude) %>% pct_complete() #~100 %
#
#
#
#

#' To cite tidygeocoder use:
#'
#'   Cambon J, Hernangómez D, Belanger C, Possenriede D (2021).
#' tidygeocoder: An R package for geocoding. Journal of Open Source
#' Software, 6(65), 3544, https://doi.org/10.21105/joss.03544 (R package
#'                                                             version 1.0.5)
#'
#' A BibTeX entry for LaTeX users is
#'
#' @Article{,
#'   title = {tidygeocoder: An R package for geocoding},
#'   author = {Jesse Cambon and Diego Hernangómez and Christopher Belanger and Daniel Possenriede},
#'   year = {2021},
#'   journal = {Journal of Open Source Software},
#'   publisher = {The Open Journal},
#'   doi = {10.21105/joss.03544},
#'   url = {https://doi.org/10.21105/joss.03544},
#'   volume = {6},
#'   number = {65},
#'   pages = {3544},
#'   note = {R package version 1.0.5},
#' }
#'
#'


