################################################################################
# Plotting Discrete Variables on Maps Using ggplot2
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

nc.counties <- map_data("county") %>% 
  subset(region == "north carolina")

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
# Plot the Counties in North Carolina with a Particular Type of Law in Effect
################################################################################

# We want to a plot that highlights the counties in North Carolina that have a 
# particular type of law in effect

# We can start with a basic map of the counties in NC

nc.map <- ggplot(nc.counties, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1) + geom_polygon(color = "black", fill = "white") + 
  theme_minimal() + ditch_the_axes 

# Now we can create a variable set equal to 1 if a particular county has the
# type of law we're interested in 

btb.counties <- c("buncombe", "cumberland", "durham", "mecklenburg", "wake")

nc.counties$btb.law <- 0

# Set btb.law dummy variable equal to 1 if the county name is in the list
# of `btb.counties`

nc.counties[nc.counties$subregion %in% btb.counties, ]$btb.law <- 1

# Creating map with counties that have law in effect shaded in 

nc.map + 
  geom_polygon(data = nc.counties, aes(fill = as.factor(btb.law)), 
               color = alpha("black", 0.2)) +
  scale_colour_discrete() +  
  scale_fill_manual(values = alpha(c("gray95", "black"), .85)) +
  geom_polygon(color = "black", fill = NA) +
  theme_bcg + ditch_the_axes + theme(legend.position="none")

