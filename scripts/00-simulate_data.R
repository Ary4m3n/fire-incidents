#### Preamble ####
# Purpose: Simulates the data tables shown in the inputs/sketches/dataset.pdf. There are 3 tables simulated here as mentioned below.
# Author: Aryaman Sharma
# Date: 23 January 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed?: Run this script to get an idea of how the data tables will look like.


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
# We set the seed here to help make this script reproducible
set.seed(43)

# This piece of code generates a table for tracking the dollar loss in millions over the years (2011-2022) in fire incidents in Toronto.
simulated_trend_data <-
  tibble(
    "Year" = 2011:2022, # We set years between 2011-2022
    "Dollar Loss in Millions" = runif(n = 12, min = 0, max = 200) # We set the dollar loss amount between $0 million and $200 million
  )

# This piece of code generates a table for tracking the dollar loss in millions over the years (2011-2022) in fire incidents in Toronto where full sprinkler system was present.
simulated_full_sprinkler_data <-
  tibble(
    "Year" = 2011:2022, # We set years between 2011-2022
    "Dollar Loss in Millions" = runif(n = 12, min = 0, max = 50) # We set the dollar loss amount between $0 million and $50 million
  )


# This piece of code generates a table for tracking the dollar loss in millions over the years (2011-2022) in fire incidents in Toronto where no sprinkler system was present.
simulated_no_sprinkler_data <-
  tibble(
    "Year" = 2011:2022, # We set years between 2011-2022
    "Dollar Loss in Millions" = runif(n = 12, min = 0, max = 150) # We set the dollar loss amount between $0 million and $150 million
  )

