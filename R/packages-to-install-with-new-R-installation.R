# purpose: easily re-install the packages you need when you download a new version of R
# notes: please add any packages you commonly use to this list so it's helpful and up to date. 

install.packages(c("acs", "airnow", "arrow", "blastula", "boxr", "config", "DBI", "dbplyr", "devtools", "DT", "fastLink", "flextable", "fs", "here", "httr", "janitor", "jose", "jsonlite", "kableExtra", "keyring", "lubridate", "MMWRweek", "odbc", "pdftools", "plotly", "RCurl", "readr", "readxl", "RecordLinkage", "redcapAPI", "rio", "runner", "see", "sendmailR", "sf", "shiny", "shinydashboard", "shinythemes", "tidycensus", "tidyverse", "tigris", "usethis", "writexl", "zoo"))

# install.packages("devtools")
devtools::install_github("San-Mateo-County-Health-Epidemiology/smcepi")
devtools::install_github("cdcgov/Rnssp")