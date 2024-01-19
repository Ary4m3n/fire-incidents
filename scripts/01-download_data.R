#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Aryaman Sharma
# Date: 19 Jan 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
the_raw_data <-
  read_csv(
    file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/64a26694-01dc-4ec3-aa87-ad8509604f50/resource/1e824947-d73b-4f48-9bac-7f7f3731a6b9/download/Fire%20Incidents%20Data.csv",
    show_col_types = FALSE
  )


#### Save data ####
write_csv(the_raw_data, "inputs/data/raw_data.csv")

         
