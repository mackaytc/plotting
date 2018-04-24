################################################################################
# Scatter Plot Using ggplot2
################################################################################

# Basic ggplot-related packages

library(ggplot2)
library(latex2exp)

rm(list = ls())

# Trees sample dataset has measurements of the height, weight, and length of
# 31 observations.

data(trees)

################################################################################
# Plotting
################################################################################

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5))

# Scatter Plot

ggplot(data = trees) + geom_point(aes(x = Height, y = Volume)) + 
  labs(title = "Sample Scatter Plot", 
       y = "Volume", 
       x = "Height") + 
  theme_bcg


