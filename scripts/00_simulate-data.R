#### Preamble ####
# Purpose: Simulate a dataset with a negative relationship between building age and evaluation score
# Author: Terry Tu, Jingyi Shen, Yaning Jin
# Date: 14 March 2024
# Contact: xiangyu.tu@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse package

# Load necessary libraries
library(tidyverse)

# Set a seed for reproducibility
set.seed(123)

# Define the number of buildings to simulate
n_buildings <- 1000

# Generate building ages
building_ages <- round(runif(n_buildings, min = 0, max = 120))

# Define parameters for the linear relationship
intercept <- 100  # Baseline score for a new building
slope <- -0.5     # Negative slope indicating decrease in score with age

# Generate evaluation scores with some random noise
evaluation_scores <- intercept + slope * building_ages + rnorm(n_buildings, mean = 0, sd = 10)

# Combine ages and scores into a data frame
simulated_data <- tibble(
  Building_Age = building_ages,
  Evaluation_Score = evaluation_scores
)

# Inspect the first few rows of the simulated data
head(simulated_data)

# Plot the simulated data
ggplot(simulated_data, aes(x = Building_Age, y = Evaluation_Score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Simulated Data: Building Age vs. Evaluation Score",
       x = "Building Age (years)",
       y = "Evaluation Score") +
  theme_minimal()
