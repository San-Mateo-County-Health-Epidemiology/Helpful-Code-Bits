# creating and renaming objects in a loop
# elizabeth jump
# notes: I usually use this when I'm reading in new datasets from a loop, that way I can see which datasets came from which files. 

colors <- c("blue", "green", "yellow", "orange")

for(color in colors){
  
  # create a dataset based on the color
  data <- data.frame(
    "a" = color,
    "b" = seq(1, 30, by = 3),
    "c" = sample(1:10, 10, replace = T),
    "d" = rnorm(n = 10, mean = 0, sd = 1)
  ) 
  
  # rename the dataset based on the color
  assign(color, data)
}

rm(data)
