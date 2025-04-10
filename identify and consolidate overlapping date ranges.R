rm(list=ls())

library(tidyverse)

data <- data.frame(
  id = rep(1, 4),
  start_date = c("2024-06-11", "2024-07-27", "2024-08-28", "2025-06-19"))

data1 <- data %>%
  mutate(start_date = as.Date(start_date),
         end_date = start_date + weeks(40)) %>%
  group_by(id) %>%
  arrange(start_date) %>%
  mutate(prev_start = lag(start_date),
         prev_end = lag(end_date),
         next_start = lead(start_date),
         next_end = lead(end_date),
         prev_overlap = case_when(start_date >= prev_start & start_date <= prev_end ~ 1,
                                  TRUE ~ 0),
         next_overlap = case_when(next_start >= start_date & next_start < end_date ~ 1,
                                  TRUE ~ 0),
         row_type = case_when(prev_overlap == 0 & next_overlap == 1 ~ "first",
                              prev_overlap == 1 & next_overlap == 1 ~ "middle",
                              prev_overlap == 1 & next_overlap == 0 ~ "last",
                              prev_overlap == 0 & next_overlap == 0 ~ "none"))

data1 %>%
  view()

# overlaps
data1 %>%
  filter(row_type %in% c("first", "last")) %>%
  mutate(last_overlap = lead(end_date)) %>%
  filter(row_type == "first") %>%
  view()

# non-overlaps
data1 %>%
  filter(row_type == "none")

