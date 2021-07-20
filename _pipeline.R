# ABOUT -------------------------------------------------------------------

# Description: <The aim of this project>
# Usage: <How to run this master script>
# Author: <Your Name>
# Date: <current date>

# SETUP -------------------------------------------------------------------

# Global project options or packages

# Load `pacman`. If not installed, install then load.
if (!require("pacman", character.only = TRUE)) {
  install.packages("pacman")
  library("pacman", character.only = TRUE)
}

pacman::p_load(citr, tidyverse, rmarkdown, knitr, sessioninfo)

# RUN ---------------------------------------------------------------------

# 1. Acquire data

render_site(input = "analysis/1_acquire_data.Rmd")

# 2. Curate dataset

render_site(input = "analysis/2_curate_dataset.Rmd")

# 3. Transform dataset

render_site(input = "analysis/3_transform_dataset.Rmd")

# 4. Analyze dataset

render_site(input = "analysis/4_analyze_dataset.Rmd")

# 5. Generate reports

render_site(input = "analysis/5_generate_article.Rmd")
render(input = "analysis/5_generate_article.Rmd", output_format = "bookdown::pdf_document2", output_file = "article.pdf")

# Create index: main website splash page

render_site(input = "analysis/index.Rmd")

# CLEAN UP ----------------------------------------------------------------

# Remove all current environment variables
rm(list = ls())

