## Structural Insights 2023: A Linear Analysis of Apartment Age and Safety Scores in Toronto
This repository hosts the project "Structural Insights 2023: A Linear Analysis of Apartment Age and Safety Scores in Toronto", which investigates the impact of building age on their safety evaluations. This research utilizes data from the Toronto Open Data portal, analyzing 1,758 records of apartment evaluations to explore the relationship between the year of construction and the current safety scores assigned. The study aims to determine how the age of a building affects its perceived integrity and compliance with modern safety standards, especially in the context of Toronto's diverse urban landscape.

Throughout this project, insights gleaned from the data are expected to inform policy recommendations and contribute to the discourse on urban development and maintenance. In addition, this research effort leverages advanced statistical techniques, including simple linear regression, to forecast and interpret the potential trajectory of building evaluations.

### LLM Usage
In the creation of this project, OpenAI's ChatGPT was used to enhance the paragraphs, as well as assist in generating the plots. You can check the `other/llm/chat_with_chatGPT.txt` for a complete conversation of my usage of ChatGPT in this project.

### Repository Structure
To facilitate transparency and reproducibility, the repository is structured as follows:

- `data/`: This directory stores the dataset used in the project. The raw dataset, `building_ealuation_data.csv`, sourced from opendatatoronto, is stored at `data/raw_data`. After data cleaning process, the cleaned data set is stored under `data/analysis_data`
- `models/`: This directory stores the linear model used in this study.
- `other/`: This directory stores the miscellaneous components used for project creation such as sketches, LLM usage, . 
- `paper/`: This directory stores the report of the actual paper. 
- `scripts/`: This folder contains some R scripts for this project. 

### Division of Work

The contributions to this project are as follows:

- Terry Tu: Project Management, Scripts, Model, Tables, Plots
- Jingyi Shen: Introduction, Data, Measurement
- Yaning jin: Result, Discussion, Simulation, Sketches
