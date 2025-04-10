# purpose: read in and append multiple files with the same structure
## notes: Make sure all of the files you're appending have the same variable names (order doesn't matter). If you know all of the variable types are the same, you can get rid of the `mutate(across...)` step. You also do this with a for loop if you prefer

library(purrr)

# map_dfr ----
## reading in a .csv and converting everything to a character so it can be appended without any incompatible type errors 
appended_df <- map_dfr(files, 
                       ~ read_csv(.x) %>% 
                         mutate(across(everything(), as.character)))
