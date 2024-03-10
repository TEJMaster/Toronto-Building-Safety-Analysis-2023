# Load necessary packages
library(opendatatoronto)
library(readr)
library(dplyr)
library(here)

# Set the root directory for the 'here' package
# This is typically the top-level directory of your project
set_here <- here::set_here()

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

# Save the data to a CSV file in the 'inputs/data' directory
write_csv(building_evaluation_data, here("inputs", "data", "building_evaluation_data.csv"))

# Print a message indicating completion
cat("Data has been downloaded and saved as 'building_evaluation_data.csv' in the 'inputs/data' directory")
