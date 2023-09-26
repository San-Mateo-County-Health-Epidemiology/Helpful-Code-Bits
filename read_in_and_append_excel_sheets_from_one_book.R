# purpose: to read in and append multiple tabs from the same workbook
# author: elizabeth jump
# notes: if you get an excel workbook where each page of data is in the same format, you can use this to read them in and append them into one large dataset

library(readxl)

# identify the file you are using ----
file <- "***.xlsx"

# pull out the tab names ----
tabs <- excel_sheets(file)

# use a loop to read them in and append them to one another ----
data <- data.frame()
for(i in tabs) {
  data_new <- read_xlsx(file,
                        sheet = i)
  
  data1 <- data %>%
    bind_rows(data_new)
  
  data1
}
