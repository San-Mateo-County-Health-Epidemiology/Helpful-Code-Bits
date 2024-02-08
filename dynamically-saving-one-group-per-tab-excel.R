# purpose: split a dataset into groups and save each group on its own tab in Excel 
## this shows you how to do this using a loop and using the map function. Both methods achieve the same thing

library(tidyverse)
library(writexl)

# load data -------------------------------------
iris <- datasets::iris

species <- iris %>%
  mutate(Species = as.character(Species)) %>%
  distinct(Species) %>%
  pull(Species)

# with a loop ----------------------------------
## make an empty list to store values in ----
loop_dfs <- list()

## create an index to keep track of the loop number ----
index <- 0

## loop through the species and save one dataset per species in the list ----
for(i in species) {
  
  index <- index + 1
  
  data <- iris %>%
    filter(Species == i)
  
  loop_dfs[[index]] <- data
  
}

loop_dfs

# using map -------------------------------------
## this does the same thing as the loop code above but is way more concise ----
map_dfs <- species %>% 
  map(~ iris %>% filter(Species == .x)) 
map_dfs

# name the list ---------------------------------
## this is the same for both methods ----
names(loop_dfs) <- species
names(map_dfs) <- species

# write the file --------------------------------
write_xlsx(loop_dfs, "out_loop.xlsx")
write_xlsx(map_dfs, "out_map.xlsx")
