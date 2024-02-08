# split a datset into groups and save each group as its own file
## you can do this by category or size (ex: you have 200 records to review and want to write them out into 10 files with 20 records in each)

library(tidyverse)
library(writexl)

# load data -------------------------------------
iris <- datasets::iris

## split data into groups of 25 observations ----
iris1 <- iris %>%
  mutate(group = ceiling(row_number()/25)) # the ceiling function rounds numbers to the nearest integer

groups <- iris1 %>%
  distinct(group) %>%
  pull(group)

for(i in groups) {
  
  print(i)
  
  data1 <- iris1 %>%
    filter(group == i) %>%
    select(-group)
  
  write_csv(data1,
            paste0("path_group_", i, ".csv"))
  
}


## split data into groups based on species ----
groups <- iris %>%
  distinct(Species) %>%
  pull(Species)

for(i in groups) {
  
  print(i)
  
  data1 <- iris1 %>%
    filter(Species == i) 
  
  write_csv(data1,
            paste0("path_group_", i, ".csv"))
  
}
