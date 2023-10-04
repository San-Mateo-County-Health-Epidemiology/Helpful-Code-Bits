# purpose: only keep rows that have data in certain columns ----
# notes: if you have a dataset that has empty (or almost entirely empty) rows, you can use this to delete those rows 

library(tidyverse)

# make a sample dataset ----
data <- data.frame(
  "a" = c(sample(1:10, 11, replace = T), NA),
  "b" = c(seq(1, 30, by = 3), rep(NA, 2)),
  "c" = c(rep(NA, 12)),
  "d" = c(rnorm(n = 10, mean = 0, sd = 1), rep(NA, 2))
) %>%
  arrange(a)

glimpse(data)

# drop rows with missing data in all columns ----
## in this example, the entire row needs to be blank to be dropped
data %>%
  filter(if_any(everything(), ~ !is.na(.)))

# drop rows with missing data in certain columns ----
## in this example, there needs to be data in at least one of the columns b-d (we don't care whether or not there is data in column a)
data %>%
  filter(if_any(c(everything(), -a), ~ !is.na(.)))
