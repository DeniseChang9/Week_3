#### Preamble ####
# Purpose: Cleans the raw marriage statistics data
# Author: Denise Chang
# Date: 19 September 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: gather.R

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
  )

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
