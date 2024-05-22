# purpose: this experiments with how to restrict function inputs 
# notes: this just looks at restricting strings and numbers

# string lists ----
## you can use arg_match from rlang to match to a specific list 
fun <- function(input = "blue") {

  input <- rlang::arg_match(input, c("blue","orange", "yellow", "green"))
  print(input)
  
}

fun()
fun("green")
fun("pink")

# numerical inputs ----
## can't use arg_match here - instead you need to use ifelse
fun_num <- function(input = 12) {
  
  input <- ifelse(input < 6, 6, ifelse(input > 60, 60, input))
  print(input)
  
}

fun_num()
fun_num(80)
fun_num(2)
fun_num(18)


switch(plot_lines,
       horizontal = {panel.grid.major.y <- ggplot2::element_line(color = grid_color)},
       vertical = {panel.grid.major.y <-  ggplot2::element_blank()},
       both = {panel.grid.major.y <- ggplot2::element_line(color = grid_color)},
       none = {panel.grid.major.y <- ggplot2::element_blank()})