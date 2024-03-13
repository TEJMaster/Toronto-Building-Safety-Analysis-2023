#### Preamble ####
# Purpose: To clean the building evaluation data by removing NA values and calculating the AGE of buildings
# Author: Terry Tu, Jingyi Shen, Yaning Jin
# Date: 14 March 2024
# Contact: xiangyu.tu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'readr' for reading CSV data, 'dplyr' for data manipulation, and 'here' for managing file paths
# Any other information needed? The raw dataset must be located in the 'data/raw_data' directory before running this script

#### Workspace setup ####
library(readr)
library(dplyr)
library(here)

#### Data cleaning ####
# Load the raw data file into a data frame
data <- read_csv(here("data", "raw_data", "building_evaluation_data.csv"))

# Clean up the data by filtering out NAs in YEAR.BUILT and YEAR.EVALUATED and adding the 'AGE' column
cleaned_data <- data %>%
  filter(!is.na(YEAR.BUILT) & !is.na(YEAR.EVALUATED)) %>%
  mutate(AGE = YEAR.EVALUATED - YEAR.BUILT)

#### Save cleaned data ####
# Save the cleaned data to a CSV file in the 'outputs/data' directory
write_csv(cleaned_data, here("data", "analysis_data", "cleaned_building_data.csv"))

# Print a message indicating completion
cat("Cleaned data has been saved as 'cleaned_building_data.csv' in the 'data/analysis_data' directory")
