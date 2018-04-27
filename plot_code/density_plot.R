################################################################################
# Basic Density Plot Using ggplot2
################################################################################

# Basic ggplot-related packages

library(ggplot2)
library(latex2exp)

rm(list = ls())

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Diamonds samples dataset has prices and other attributes of ~54,000 diamonds.

data(diamonds)

################################################################################
# Plotting
################################################################################

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data = diamonds, aes(x = depth)) + geom_density() + 
  labs(title = "Sample Density Plot", 
       y = "Density", 
       x = "Depth") + 
  theme_bcg
