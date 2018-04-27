################################################################################
# `qplot` Examples
################################################################################

# Examples below are taken from the R documentation for `qplot`

library(ggplot2)
library(gridExtra)

rm(list=ls())

# Sample `cars` dataset

data("mtcars")

################################################################################
# Basic `qplot` examples
################################################################################

# Scatter plot

p.1 <- qplot(mpg, wt, data = mtcars) 

# Scatter plot with factor variable categorization

p.2 <- qplot(mpg, wt, data = mtcars, color = cyl)

# Chooding `size` instead of `color`

p.3 <- qplot(mpg, wt, data = mtcars, size = cyl)

grid.arrange(p.1, p.2, p.3, layout_matrix = rbind(c(1,1),c(2,3)), 
             nrow = 2, ncol = 2)