# purpose: get the newest file in a given folder
# notes: this works with any folder but we primarily use this for folders where we save new copies of the same dataset. You can also change how the data are sorted and pull an older file, a recently modified file, etc. 

library(tidyverse) 

# set the directory where the files are saved
directory <- ""
pattern <- "" # ex: "*.csv"

file <- file.info(list.files(path = directory,
                                   pattern = pattern,
                                   full.names = T)) %>%
  rownames_to_column(var = "file") %>%
  select(file, ctime) %>%
  arrange(desc(ctime)) %>%
  slice(1) %>%
  pull(file)

data <- rio::import(file)
