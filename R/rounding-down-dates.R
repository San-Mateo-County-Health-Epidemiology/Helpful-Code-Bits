# playing with rounding down dates

library(lubridate)

# how to get the first day of the year ----
floor_date(Sys.Date(), unit = "years")

# how to get the first day of the month ----
floor_date(Sys.Date(), unit = "months")

# how to get a specific day of each week ----
## preceding sunday: 
floor_date(Sys.Date(), unit = "weeks")

## preceding Friday
floor_date(Sys.Date(), unit = "weeks", week_start = 5)
