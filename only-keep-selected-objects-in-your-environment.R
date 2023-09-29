# author: beth
# purpose: keep only specific objects in your environment
# notes: this code will allow you to delete all objects except the ones you specify. be careful with this because sometimes you end up deleting objects that you didn't realize you wanted to keep

# only keeping one object ---------------------
# make objects:
a <- "hello"
b <- "hello sunshine"
c <- rep("hello sunshine!", 2)

# let's say we only want to keep z. We can do this:
rm(list=setdiff(ls(), "c"))

## note: the variable we want to keep is in quotes (as if it were a string). Usually we don't refer to objects in quotes, but in this case we do

# keeping more than one object -----------------
# make objects:
x <- "goodnight"
y <- "goodnight moon"
z <- "goodnight stars"

# let's say we only want to keep z. We can do this:
rm(list=setdiff(ls(), c("y", "z")))

