# purpose: use complete to complete groups and dates
# notes: if you use count() to make a frequency table, it will only include categories with values. In some cases, you also want the empty categories. Complete gives you the empty categories

library(tidyverse)

# make dataset ----
## note: this dataset is totally meaningless, but will hopefully illustrate the concept
data <- data.frame(
  date = seq.Date(from = as.Date("2023-01-01"),
                  to = as.Date("2023-01-31"),
                  by = 2),
  small = rep(letters[1:4], 4),
  big = rep(LETTERS[1:5], 4)[1:16]
)

data

# complete: groups ----
## if you count the number of time each pair of small and big letters appears, you'll notice that some combinations never appear, ex: aB, bC, cD, dE
data %>%
  count(small, big) 

## this is extra obvious if you reshape the data to make a table:
data %>%
  count(small, big) %>%
  pivot_wider(names_from = big, 
              values_from = n)

## if you use complete, all possible combinations will be included!
data %>%
  count(small, big) %>%
  complete(small, big)

# complete: dates ----
## often times, we deal longitudinal data and some dates are missing. You can easily fill them in with complete
data %>%
  complete(date = seq.Date(from = min(date),
                           to = max(date),
                           by = 1))
