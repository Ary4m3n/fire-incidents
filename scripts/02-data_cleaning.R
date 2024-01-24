#### Preamble ####
# Purpose: Cleans the raw fire incidents data and saves it to the cleaned_data.csv
# Author: Aryaman Sharma
# Date: 21 January 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: run the R script 01-download_data.R before running this script
# Any other information needed?: This is the second step after fulfilling the pre-requisites mentioned above.

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_fire_data <- read_csv("inputs/data/raw_data.csv") # read the csv

cleaned_fire_data <-
  clean_names(raw_fire_data)|> # we clean the names in the raw data
  select( # we select just the three columns needed
    estimated_dollar_loss,
    tfs_alarm_time,
    sprinkler_system_presence
  ) |>
  rename( # we rename the columns here
    dollar_loss = estimated_dollar_loss,
    alarm_time = tfs_alarm_time,
    sprinkler_system_presence = sprinkler_system_presence
  ) |>
  separate( # this step obtains just the year from the alarm_time
    col = alarm_time,
    into = c("year", "Other"),
    sep = "-"
  ) |>
  select(-Other) |>
  separate( # this step cleans the sprinkler_system_presence column
    col = sprinkler_system_presence,
    into = c("Id", "sprinkler_system_presence"),
    sep = " - "
  ) |>
  select(-Id) |>
  filter(!is.na(dollar_loss), !is.na(year)) |> # here we remove any NA fields from the dollar_loss and year columns, this step was referred to from ChatGPT 4 and the chat has been included in usage.txt
  rename( # here we rename the columns to then be saved in cleaned_data.csv
    "Dollar Loss" = dollar_loss,
    "Year" = year,
    "Sprinkler System Presence" = sprinkler_system_presence
  )

#### Save data ####
write_csv(cleaned_fire_data, "outputs/data/cleaned_data.csv")
