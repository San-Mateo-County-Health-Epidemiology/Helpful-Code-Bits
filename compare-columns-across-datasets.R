# purpose: compare columns of two datasets
# notes: you can use this to see which columns from the first dataset aren't in the second dataset

# make sample datasets ----
data1 <- data.frame(
  "a" = sample(1:10, 10, replace = T),
  "b" = seq(1, 30, by = 3),
  "c" = rep(NA, 10),
  "d" = rnorm(n = 10, mean = 0, sd = 1)
)

data2 <- data.frame(
  "c" = sample(1:100, 15, replace = F),
  "d" = 1:15,
  "e" = rep(c("blue", "green", "yellow"), 5)
)

# see which columns are in data2 and not data1 
setdiff(colnames(data2), colnames(data1))

# see which columns are in data1 and not data2
setdiff(colnames(data1), colnames(data2))
