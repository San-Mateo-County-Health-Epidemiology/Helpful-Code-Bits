# purpose: easily re-install the packages you need when you download a new version of R
# notes: please add any packages you commonly use to this list so it's helpful and up to date. 

install.packages(c("tidyverse", "readxl", "writexl", "rio", "zoo", "dbplyr", "odbc", "DBI", "lubridate", "httr", "config", "fastLink", "RecordLinkage", "flextable", "jsonlite", "redcapAPI", "sendmailR", "fs", "boxr", "jose", "RCurl", "acs", "tidycensus", "sf", "tigris", "usethis", "shiny", "shinydashboard", "plotly", "shinythemes", "DT", "janitor", "arrow", "devtools", "here", "see", "blastula", "keyring"))

# install.packages("devtools")
devtools::install_github("San-Mateo-County-Health-Epidemiology/smcepi")
