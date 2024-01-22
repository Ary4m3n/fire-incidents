#### Preamble ####
# Purpose: Cleans the raw fire incidents data and saves it to the cleaned_data.csv
# Author: Aryaman Sharma
# Date: 21 January 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_fire_data <- read_csv("inputs/data/raw_data.csv")

cleaned_fire_data <-
  clean_names(raw_fire_data)|>
  select(
    estimated_dollar_loss,
    tfs_alarm_time,
    sprinkler_system_presence
  ) |>
  rename(
    dollar_loss = estimated_dollar_loss,
    alarm_time = tfs_alarm_time,
    sprinkler_system_presence = sprinkler_system_presence
  ) |>
  separate(
    col = alarm_time,
    into = c("year", "Other"),
    sep = "-"
  ) |>
  select(-Other) |>
  separate(
    col = sprinkler_system_presence,
    into = c("Id", "sprinkler_system_presence"),
    sep = " - "
  ) |>
  select(-Id) |>
  filter(!is.na(dollar_loss), !is.na(year)) |>
  rename(
    "Dollar Loss" = dollar_loss,
    "Year" = year,
    "Sprinkler System Presence" = sprinkler_system_presence
  )
# the last step of filter was referred to from ChatGPT 4 and the chat has been included in usage.txt

# cleaned_data <-
#   raw_data |>
#   janitor::clean_names() |>
#   select(wing_width_mm, wing_length_mm, flying_time_sec_first_timer) |>
#   filter(wing_width_mm != "caw") |>
#   mutate(
#     flying_time_sec_first_timer = if_else(flying_time_sec_first_timer == "1,35",
#                                    "1.35",
#                                    flying_time_sec_first_timer)
#   ) |>
#   mutate(wing_width_mm = if_else(wing_width_mm == "490",
#                                  "49",
#                                  wing_width_mm)) |>
#   mutate(wing_width_mm = if_else(wing_width_mm == "6",
#                                  "60",
#                                  wing_width_mm)) |>
#   mutate(
#     wing_width_mm = as.numeric(wing_width_mm),
#     wing_length_mm = as.numeric(wing_length_mm),
#     flying_time_sec_first_timer = as.numeric(flying_time_sec_first_timer)
#   ) |>
#   rename(flying_time = flying_time_sec_first_timer,
#          width = wing_width_mm,
#          length = wing_length_mm
#          ) |> 
#   tidyr::drop_na()

#### Save data ####
write_csv(cleaned_fire_data, "outputs/data/cleaned_data.csv")
