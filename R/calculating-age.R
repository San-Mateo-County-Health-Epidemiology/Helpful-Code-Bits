# purpose: this code will calculate ages based on dob and another date 
# notes: you can use this for two dates or within a mutate step to calculate the age per row using two columns. You can also get someone's age today by using Sys.Date()

library(tidyverse)
library(lubridate)

dob <- as.Date("2003-02-28")
end_date <- as.Date("2016-02-28")

# best option: ------------------
## using lubridate intervals ----
trunc((dob %--% end_date) / years(1))       

interval(dob, end_date)/years(1)

# note, we had previously recommended using this version, but found it doesn't work well if a person dies on their date of birth and if either of those dates fall in a leap year:
## decimal_date: ----
floor(decimal_date(end_date)-decimal_date(dob))
