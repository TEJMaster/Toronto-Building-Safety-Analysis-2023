# Load necessary packages
library(readr)
library(dplyr)
library(here)
library(testthat)

# Load the cleaned data file into a data frame
data <- read_csv(here("outputs", "data", "cleaned_building_data.csv"))

# Define a function to perform the tests
perform_data_tests <- function(data) {
  # Test if AGE column has no negative values
  test_that("AGE column contains no negative values", {
    expect_true(all(data$AGE >= 0), info = "There are negative values in the AGE column")
  })
  
  # Test if YEAR.BUILT, YEAR.EVALUATED, CURRENT.BUILDING.EVAL.SCORE have no NA values
  test_that("No NA values in YEAR.BUILT, YEAR.EVALUATED, CURRENT.BUILDING.EVAL.SCORE", {
    expect_true(all(!is.na(data$YEAR.BUILT)), info = "There are NA values in YEAR.BUILT")
    expect_true(all(!is.na(data$YEAR.EVALUATED)), info = "There are NA values in YEAR.EVALUATED")
    expect_true(all(!is.na(data$CURRENT.BUILDING.EVAL.SCORE)), info = "There are NA values in CURRENT.BUILDING.EVAL.SCORE")
  })
  
  # Test if CURRENT.BUILDING.EVAL.SCORE column has no negative values
  test_that("CURRENT.BUILDING.EVAL.SCORE column contains no negative values", {
    expect_true(all(data$CURRENT.BUILDING.EVAL.SCORE >= 0), info = "There are negative values in CURRENT.BUILDING.EVAL.SCORE")
  })
}

# Run the tests on the data
perform_data_tests(data)