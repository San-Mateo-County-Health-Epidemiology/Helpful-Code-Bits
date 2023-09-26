# code to only keep numbers and letters (remove spaces and special characters) ----
# author: elizabeth jump

library(stringr)

test <- "ABC12 * 33-21 // xyz"

# keep only numbers and letters ----
str_replace_all(test, "[^A-Za-z0-9]", "")

# keep only numbers ----
str_replace_all(test, "[^0-9]", "")

# keep all letters ----
str_replace_all(test, "[^A-Za-z]", "")

# keep uppercase letters ----
str_replace_all(test, "[^A-Z]", "")

# keep lowercase letters ----
str_replace_all(test, "[^a-z]", "")
