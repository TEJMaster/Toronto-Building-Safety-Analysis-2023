#### Preamble ####
# Purpose: To perform a series of data integrity tests on the cleaned building evaluation dataset
# Author: Terry Tu, Jingyi Shen, Yaning Jin
# Date: 14 March 2024
# Contact: xiangyu.tu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'readr' for reading CSV data, 'dplyr' for data manipulation, 'here' for file path management
# The cleaned dataset should be located in the 'data/analysis_data' directory and be free of processing errors

#### Workspace setup ####
library(readr)
library(dplyr)
library(here)

# Load the cleaned data file into a variable 'data'
file_path <- here("data", "analysis_data", "cleaned_building_data.csv")
data <- read_csv(file_path)

# Below are the tests for the cleaned dataset, 
# after running them we expected to get TRUE for all test cases

# Test 1: No negative values in the AGE column
test_age_positive <- all(data$AGE >= 0)

# Test 2: No NA values in YEAR.BUILT, YEAR.EVALUATED, CURRENT.BUILDING.EVAL.SCORE columns
test_no_na <- all(!is.na(data$YEAR.BUILT) & !is.na(data$YEAR.EVALUATED) & !is.na(data$CURRENT.BUILDING.EVAL.SCORE))

# Test 3: CURRENT.BUILDING.EVAL.SCORE values are within the range 0 to 100
test_score_range <- all(data$CURRENT.BUILDING.EVAL.SCORE >= 0 & data$CURRENT.BUILDING.EVAL.SCORE <= 100)

# Test 4: All YEAR.EVALUATED values are 2023
test_year_evaluated <- all(data$YEAR.EVALUATED == 2023)

# Print the result from the tests
print(paste("Test 1 - No negative values in AGE:", test_age_positive))
print(paste("Test 2 - No NA values in critical columns:", test_no_na))
print(paste("Test 3 - Building scores are within the range of 0 to 100:", test_score_range))
print(paste("Test 4 - All YEAR.EVALUATED values are 2023:", test_year_evaluated))

