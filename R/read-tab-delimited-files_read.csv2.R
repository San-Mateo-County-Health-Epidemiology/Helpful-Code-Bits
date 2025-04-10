# purpose: code to read in a tab delimited file
## this function/code is particularly useful with CalREDIE exports though it can also be used for other things

read_tsv_new <- function(file) {
  
  data <- read.csv2(file, header = T, sep = "\t", stringsAsFactors = FALSE, quote = "", na.strings = "")
  
  data1 <- data %>%
    mutate_all(~case_when(.x != "" ~ .x))
  
  data1
  
}