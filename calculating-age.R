# purpose: this code will calculate ages based on dob and another date 
# notes: you can use this for two dates or within a mutate step to calculate the age per row using two columns. You can also get someone's age today by using Sys.Date()

library(tidyverse)
library(lubridate)

dob <- as.Date("2004-02-29")
end_date <- as.Date("2016-02-29")

# two options: ------------------
## decimal_date: ----
floor(decimal_date(end_date)-decimal_date(dob))

## using lubridate intervals ----
trunc((dob %--% end_date) / years(1))       
