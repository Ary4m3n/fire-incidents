#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Aryaman Sharma
# Date: 19 Jan 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed?: This is the first step towards downloading the raw data


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# This is one way to download data but a better way is to use the opendatatoronto library
# the_raw_data <-
#   read_csv(
#     file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/64a26694-01dc-4ec3-aa87-ad8509604f50/resource/1e824947-d73b-4f48-9bac-7f7f3731a6b9/download/Fire%20Incidents%20Data.csv",
#     show_col_types = FALSE
#   )

# get package
package <- show_package("64a26694-01dc-4ec3-aa87-ad8509604f50")
# package

# get all resources for this package
resources <- list_package_resources("64a26694-01dc-4ec3-aa87-ad8509604f50")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
the_raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####
write_csv(the_raw_data, "inputs/data/raw_data.csv")

         
