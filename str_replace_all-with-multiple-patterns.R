# using str_replace_all to replace multiple patterns 
## you can use str_replace_all to replace multiple sets of patterns in a single function call. 

library(tidyverse)

# ACS data come through the API with verbose age groups. These are examples of how they might look:
data <- data.frame(
  age_groups = c("Under 5", "5 to 9", "10 to 15", "15 and 16", "17 plus")
)
data

# you might be tempted to use a lot of `str_replace_all()` calls to reformat the age groups:
data %>%
  mutate(age_groups_new = str_replace_all(age_groups, "Under ", "<"),
         age_groups_new = str_replace_all(age_groups_new, " to | and ", "-"),
         age_groups_new = str_replace_all(age_groups_new, " plus", "+"))
         
# however, you actually can do this all in one function call!
data %>%
  mutate(age_groups_new = str_replace_all(age_groups,
                                          c("Under " = "<",
                                            " to | and " = "-",
                                            " plus" = "+")))
