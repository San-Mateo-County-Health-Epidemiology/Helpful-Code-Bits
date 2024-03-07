########################################
# 
# using accumulate 
# accumulate allows you to calculate a value for a row based on the calculated value of the previous row. Think cumulative sums, but for more operations
# 
########################################

rm(list = ls())

library(tidyverse)
library(lubridate)

# accumulate vs. for loop --------------
## accumulate basically applies a for loop within a dataset. If you can't get accumulate to do what you want, you can try using a for loop first to figure out exactly what you're looking for

## summing values using a for loop ----
result <- 0 # initialize the result variable
for(i in 1:12) {
  
  result <- i+ result
  print(result)
  
}

## summing values using accumulate ----
data.frame(number = 1:12) %>%
  mutate(accumulate = accumulate(.x = number,
                                 .f = `+`))

# using accumulate --------------------
## you don't necessarily need to use accumulate for summing because there is a function called 'cumsum' that does the same thing, but you can use it for a lot of other operations that don't have functions
data.frame(number = 1:12) %>%
  mutate(accumulate = accumulate(.x = number,
                                 .f = `+`),
         cumsum = cumsum(number),
         cum_subtraction = accumulate(.x = number,
                                      .f = `-`),
         cum_multiplcate = accumulate(.x = number, 
                                      .f = `*`))

# starting with a specific value ----------
## sometimes you want to start with a value that is not the first value of .x. If you do this, you also need to use the head(.x, -1) to drop the last value of the .x vector in the calculations. If you don't do that, you'll get an error that the output vector is 1 too long
## here we're doing a cumulative sum of number but we're starting with 10
data.frame(number = 1:12) %>%
  mutate(new_var = accumulate(.x = head(number, -1),
                              .init = 10,
                              .f = `+`))

# more complicated operations ------------
## you can also use functions in accumulate that will allow you to make more complicated calculations

## ex: calculating a simple loan payoff --- 
interest <- 0.05
test_fun <- function(first_val, next_val) {
  # input = the balance value which will start at 2000
  # output = the next balance
  
  first_val + (first_val*interest) - next_val
  
}

data.frame(payment = rep(200, 12)) %>%
  mutate(balance = accumulate(.x = head(payment, -1),
                              .init = 2000,
                              .f = test_fun))

