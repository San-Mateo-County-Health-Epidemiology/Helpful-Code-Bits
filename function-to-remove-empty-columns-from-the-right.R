# purpose: remove the furthest right column if it is empty ----
# author: elizabeth jump
## this only removes ONE column. if you want to remove more than one column, you can re-run the function 

remove_last_empty_col <- function(x) {
  empty_last_col <- x %>%
    select(last_col()) %>%
    select_if(~ all(is.na(.))) %>%
    colnames() # returns a column name or a NULL
  
  x1 <- x %>%
    select(-any_of(empty_last_col))
  x1
}
