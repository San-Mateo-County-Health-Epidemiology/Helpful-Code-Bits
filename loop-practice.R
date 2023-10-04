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

# the inner loop has to finish before it goes to a new iteration of the outer loop
## this starts with the first value of the outer loop, then it goes through the whole inner loop, and then goes to the second outer loop and so on...
for(i in numbers) {
  for(j in list) {
    print(paste0(i, " ", j))
  }
}
