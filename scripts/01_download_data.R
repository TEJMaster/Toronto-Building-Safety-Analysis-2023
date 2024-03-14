#### Preamble ####
# Purpose: To download and preprocess the dataset related to building evaluation from the Toronto Open Data portal
# Author: Terry Tu, Jingyi Shen, Yaning Jin
# Date: 14 March 2024
# Contact: xiangyu.tu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'opendatatoronto' package for accessing open data, 'readr' and 'dplyr' for data manipulation, and 'here' for path management
# Ensure that the 'opendatatoronto' package is installed and updated to the latest version

#### Workspace setup ####
library(opendatatoronto)
library(readr)
library(dplyr)
library(here)

#### Data retrieval ####
# Search for packages related to "building evaluation"
search_result <- search_packages("building evaluation")

# The first row is the desired dataset
# Extract the dataset ID (4ef82789-e038-44ef-a478-a8f3590c3eb1)
dataset_id <- "4ef82789-e038-44ef-a478-a8f3590c3eb1"

# List all resources available for the dataset
resources <- list_package_resources(dataset_id)

# Assuming you want to download the first resource
# You can modify the index if you want a different resource
resource_id <- resources$id[1]

# Download the resource
building_evaluation_data <- get_resource(resource_id)

#### Data preprocessing ####
# Additional preprocessing steps would go here (if necessary)

#### Save data ####
# Save the data to a CSV file in the 'inputs/data' directory
write_csv(building_evaluation_data, here("data", "raw_data", "building_evaluation_data.csv"))

# Print a message indicating completion
cat("Data has been downloaded and saved as 'building_evaluation_data.csv' in the 'data/raw_data' directory")
