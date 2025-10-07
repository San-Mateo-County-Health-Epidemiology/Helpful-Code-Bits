# purpose: rename variables conditionally
# notes: this is a userful way to rename multiple variables at once. I find this particularly useful when I am joining data sets. You can use this code to add a prefix or remove all of the .x and .y's from a join 

library(palmerpenguins)
library(tidyverse)

data <- palmerpenguins::penguins

# here we remove the _mm and _g from any variable name
data %>% 
  rename_with(.cols = matches("_mm$|_g$"), ~ str_replace(.x, "_mm$|_g$", ""))

# here we append pp_ (palmer penguin) to the front of every variable
data %>%
  rename_with(.cols = everything(), ~ paste0("pp_", .x))
