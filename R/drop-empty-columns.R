# purpose: only keep columns that have data in them ----
# notes: before you run this, make sure you're importing your tables correctly. A lot of the import functions guess a data type based on the first 200 - 1000 rows, and if those are blank, then the import function will assume the entire column is blank (you can override this in most import functions by making the `guess_max` really high). If you import your data incorrectly, then this code would drop columns that should not be dropped

library(tidyverse)

# make a sample dataset ----
data <- data.frame(
  "a" = sample(1:10, 10, replace = T),
  "b" = seq(1, 30, by = 3),
  "c" = rep(NA, 10),
  "d" = rnorm(n = 10, mean = 0, sd = 1)
)
glimpse(data)

# this code will drop any empty columns ----
## select_if ----
data %>%
  select_if(~ !all(is.na(.)))

## select + where ----
data %>%
  select(where(~ !all(is.na(.))))
