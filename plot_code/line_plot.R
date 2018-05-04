################################################################################
# Line Plot Using ggplot2
################################################################################

# Basic ggplot-related packages

library(ggplot2)

rm(list = ls())

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Airmiles data set contains figures for the revenue passenger miles flown by 
# commercial airlines in the United States for each year from 1937 to 1960

data(airmiles)

################################################################################
# Line Plot
################################################################################

# Constructing dataframe to pass to `ggplot`

df <- as.data.frame(cbind(1937:1960, 
                    airmiles[1:24]))

# Basic line plot

ggplot(df) + 
  geom_line(aes(x = V1, y = V2), size = 0.5, color = "grey30") + 
  labs(title = "Sample Line Plot", 
       y = "Total Miles Flown by All Commerical Airlines", 
       x = "Year") + 
  theme_bcg



