# purpose: practicing basic loops in R ----
## notes: these go over the two main ways to make loops. there are lots of good tutorials on the internet that can help supplement this

# two methods to loop through a list ----
## note the different output from each of the methods - one returns a value and the other returns a number
list <- c("blue", "green", "yellow", "orange", "pink", "red", "purple")

## loop by item in the list ----
for(i in list){
  print(i)
}

## loop by position in the list ----
for(i in 1:length(list)) {
  print(i)
}

## you can also make the print statement more interesting ----
for(name in list){
  
  path <- paste0("H:/", name, ".csv")
  
  print(path)

}

# loop within a loop ----
list <- c("blue", "green", "yellow", "orange", "pink")
numbers <- 1:3

## the inner loop has to finish before it goes to a new iteration of the outer loop
## this starts with the first value of the outer loop, then it goes through the whole inner loop, and then goes to the second outer loop and so on...
for(i in numbers) {
  for(j in list) {
    print(paste0(i, " ", j))
  }
}

# appending data within a loop ----
## get the list you want to loop through. In this case it's a character vector, but this also could be a list of file paths
list <- c("blue", "green", "yellow", "orange", "pink", "red", "purple")

## make an empty dataset in which to store your results
colors <- data.frame()

for(color in list) {
  
  print(color)
  
  # in this case, we're creating a mini data frame for each color. If you were using a vector of file paths, you could have an import step here
  new_data <- data.frame(
    color = color
  )
  
  # in each loop, this pastes the data from new_data set below the existing data in the colors data frame. In each loop it adds new data and overwrites the previous colors data frame with a more complete version
  colors <- colors %>%
    rbind(new_data)
}

colors

