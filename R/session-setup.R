##############################################
# 
# SESSION SET UP CODE
#
##############################################

#SET UP----------------------------------------------------------

# clean data environment
rm(list=ls())

# package names
packages <- c("acs", "arrow", "bit64", "dplyr", "expss", "flextable", "janitor", "jsonlite", "lubridate", "openxlsx", "purrr", "RCurl", "readr", "readxl", "redcapAPI", "rio", "sendmailR", "sjlabelled", "stringr", "tibble", "tidycensus", "tidyr", "tidyverse", "usethis", "writexl", "zoo")

# install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# load libraries
lapply(packages, library, character.only = TRUE)

# format output to 3 digits
options(digits = 3)
