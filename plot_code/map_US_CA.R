################################################################################
# Bubble Chart: Scatter Plot with Variable Point Size Using ggplot2
################################################################################

library(dplyr)
library(ggplot2)

# Packages for map plotting-- `ggthemes` loads the `theme_minimal()` style 
# used below, while `gridExtra` lets you control layouts of displayed plots. 
# The `maps` package contains 

library(maps)
library(ggthemes)
library(gridExtra)

################################################################################
# Loading Data + Plotting Theme
################################################################################

# Loading geographic data for states + counties in the US. `map_data()` takes
# the series of points-based data provided by the `maps` package and converts
# into a df that is readable via ggplot2

counties <- map_data("county")
states   <- map_data("state")

# Theme below removes all unneccessary axes and tick marks from plots

ditch_the_axes <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank()
)

################################################################################
# Basic Map of United States and California
################################################################################

# Basic state-level plot of the United States. Note the use of `coord_fixed()` 
# to prevent distortion along the x / y axes-- setting alternative parameter
# options here "stretches" the along the y-axis.

p.1 <- ggplot(data = states, mapping = aes(x = long, y = lat, group = group)) + 
              coord_fixed(1) + geom_polygon(color = "black", fill = "gray95") + 
              theme_minimal() + ditch_the_axes 

# Plot of the counties within California

p.2 <- ggplot(data = subset(counties, region == "california"), 
              mapping = aes(x = long, y = lat, group = group)) + 
              coord_fixed(1) + geom_polygon(color = "black", fill = "gray95") + 
              theme_minimal() + ditch_the_axes 

# `grid.arrange()` to display them next to one another

grid.arrange(p.1, p.2, widths = 2:1)

