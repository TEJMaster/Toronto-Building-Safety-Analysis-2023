#### Preamble ####
# Purpose: To construct a linear model assessing the impact of building age on safety evaluation scores
# Author: Terry Tu, Jingyi Shen, Yaning Jin
# Date: 14 March 2024
# Contact: xiangyu.tu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' package for data manipulation and the 'here' package for path management
# Any other information needed? Ensure that 'cleaned_data' has been appropriately pre-processed

#### Workspace setup ####
library(tidyverse)
library(here)

#### Read data ####
cleaned_data <- read_csv(here("data", "analysis_data", "cleaned_building_data.csv"))

### Model data ####
lm_model <- lm(CURRENT.BUILDING.EVAL.SCORE ~ AGE, data = cleaned_data)

# Summary of the model to check for immediate red flags
summary(lm_model)

#### Save model ####
# Save the model as an .rds file to the 'models' folder
saveRDS(
  lm_model,
  file = here("models", "linear_model.rds")
)
