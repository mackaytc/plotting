################################################################################
# Histogram with Grid Arrange Using ggplot2
################################################################################

# Basic ggplot-related packages

library(ggplot2)
library(gridExtra)

rm(list = ls())

# Airquality sample dataset has measurements of temperature, windspeed, and 
# daily air quality in New York from May to September, 1973.

data("airquality")

################################################################################
# Plotting
################################################################################

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5))

# Default Histogram

p.1 <- ggplot(data = airquality) + geom_histogram(aes(x = Wind)) + 
  labs(title = "Default Histogram (nbins = 30)", 
       y = "Count", 
       x = "Average Daily Wind Speed (mph)") + 
  theme_bcg

p.2 <- ggplot(data = airquality) + geom_histogram(aes(x = Wind), binwidth = 2) + 
  labs(title = "Histogram with Bin Width of 2 mph Specified", 
       y = "", 
       x = "Average Daily Wind Speed (mph)") + 
  theme_bcg

grid.arrange(p.1, p.2, nrow = 1)

