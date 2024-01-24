#### Preamble ####
# Purpose: Tests for the cleaned dataset to check if the requirements match that of the simulated data.
# Author: Aryaman Sharma
# Date: 23 January 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: Kindly run 00-simulate_data.R, 01-download_data.R, and 02-data_cleaning.R before running this file (in specific the latter two).

#### Workspace setup ####
library(tidyverse)

#### Test data ####
# Here we assign fire_incident_data to the cleaned_data that we cleaned in 02-data_cleaning.R
fire_incident_data <-read_csv("outputs/data/cleaned_data.csv")

# First test is to check if the years start from 2011
fire_incident_data$Year |> 
  min() == 2011

# Second test is to check if the years do not exceed 2022
fire_incident_data$Year |>
  max() == 2022

# Third test is to check if the years lie between 2011-2022 i.e. 12 years
fire_incident_data$Year |>
  unique() |>
  length() == 12

# Fourth test is to check if the `Year` column is numeric
fire_incident_data$Year |>
  class() == "numeric"

# Fifth test is to check if all the `Dollar Loss` amounts are above 0 or non-negative
fire_incident_data$`Dollar Loss` |>
  min() >= 0

# Sixth test is to check if the `Dollar Loss` column is numeric
fire_incident_data$`Dollar Loss` |>
  class() == "numeric"

# Seventh test is to check if the `Sprinkler System Presence` contains 5 unique statuses, i.e. "NA", "Undetermined", "No sprinkler system", "Full sprinkler system present", "Partial sprinkler system present"
fire_incident_data$`Sprinkler System Presence` |>
  unique() |>
  length() == 5

# Final test is to check if the `Sprinkler System Presence` column is of class character.
fire_incident_data$`Sprinkler System Presence` |>
  class() == "character"
  
  