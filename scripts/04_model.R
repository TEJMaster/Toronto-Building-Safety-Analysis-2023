#### Preamble ####
# Purpose: To construct a Bayesian linear model assessing the impact of building age on safety evaluation scores using rstanarm
# Author: Terry Tu, Jingyi Shen, Yaning Jin
# Date: 14 March 2024
# Contact: xiangyu.tu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'rstanarm' package for Bayesian modeling, 'readr' for data manipulation, and 'here' for path management
# The 'cleaned_data' dataset must be pre-processed before using it in the model.

#### Workspace setup ####
library(readr)
library(rstanarm)
library(here)

#### Read data ####
cleaned_data <- read_csv(here("data", "analysis_data", "cleaned_building_data.csv"))

# Ensure reproducibility
set.seed(2024)

### Model data ####
bayesian_model <- stan_glm(
  CURRENT.BUILDING.EVAL.SCORE ~ AGE, 
  data = cleaned_data,
  family = gaussian(), # Assuming a normal distribution for the response variable
  prior = normal(0, 2.5, autoscale = FALSE), # Set the prior for the coefficients
  prior_intercept = normal(0, 10, autoscale = FALSE), # Set the prior for the intercept
  seed = 2024 # Set the seed for reproducibility
)

# Summary of the model to check for immediate red flags
summary(bayesian_model)

#### Save model ####
# Save the Bayesian model as an .rds file to the 'models' folder
saveRDS(
  bayesian_model,
  file = here("models", "bayesian_linear_model.rds")
)