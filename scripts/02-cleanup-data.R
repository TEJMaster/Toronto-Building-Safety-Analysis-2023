# Load necessary packages
library(readr)
library(dplyr)
library(here)

# Load your existing data file into a data frame
data <- read_csv(here("inputs", "data", "building_evaluation_data.csv"))

# Clean up the data by filtering out NAs in YEAR.BUILT and YEAR.EVALUATED
# and then adding the 'AGE' column
cleaned_data <- data %>%
  filter(!is.na(YEAR.BUILT) & !is.na(YEAR.EVALUATED)) %>%
  mutate(AGE = YEAR.EVALUATED - YEAR.BUILT)

# Save the cleaned data to a CSV file in the 'outputs/data' directory
write_csv(cleaned_data, here("outputs", "data", "cleaned_building_data.csv"))
