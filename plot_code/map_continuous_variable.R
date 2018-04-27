################################################################################
# Plotting Continuous Variables on Maps Using ggplot2
################################################################################

library(dplyr)
library(ggplot2)

rm(list = ls())

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

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

states.data <- map_data("state") 

# Crime data comes from `USArrests` sample data set

data("USArrests")

USArrests$region <- tolower(rownames(USArrests))

# Use `dplyr` to merge data sets using region (state) as ID variable

map.df <- inner_join(states.data, USArrests, by = "region")

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
# Plotting State Murder Rate Data
################################################################################

# Mapping state level murder counts. Check out the URL below for ggplot colors
#   http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/

ggplot(map.df, aes(x = long, y = lat, group = group)) + 
  geom_polygon(color = "white", fill = "white") + 
  geom_polygon(data = map.df, aes(fill = Murder)) + 
  scale_fill_gradient(low = "grey90", high = "red") + 
  coord_fixed(1) + labs(fill = "Murders per 100k\nPeople") + 
  theme_minimal(base_size = 9, base_family = "Palatino") + 
  ditch_the_axes

