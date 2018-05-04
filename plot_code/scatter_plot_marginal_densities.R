################################################################################
# Scatter Plot + Univariate Densities Using ggplot2
################################################################################

# Basic ggplot-related packages

library(ggplot2)
library(gridExtra)

rm(list = ls())

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Trees sample dataset has measurements of the height, weight, and length of
# 31 observations.

data(trees)

################################################################################
# Scatter Plot with Marginal Densities
################################################################################

# To generate this graph we'll use the `ggExtra` package

suppressWarnings(library(ggExtra))

# Basic scatter plot

plot.1 <- ggplot(trees, aes(x = Height, y = Volume)) + 
  geom_point(size = 1, color = "grey30") + 
  labs(title = "Continuous Densities", 
       y = "Volume", 
       x = "Height") +
  theme_bcg

# Adding marginal densities

p.1 <- ggMarginal(plot, type = "density")

# Basic scatter plot

plot.2 <- ggplot(trees, aes(x = Height, y = Volume)) + 
  geom_point(size = 1, color = "grey30") + 
  labs(title = "Histograms", 
       y = "", 
       x = "Height") +
  theme_bcg

p.2 <- ggMarginal(plot, type = "histogram")

grid.arrange(p.1, p.2, nrow = 1)


