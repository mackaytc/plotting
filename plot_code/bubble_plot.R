################################################################################
# Bubble Chart: Scatter Plot with Variable Point Size Using ggplot2
################################################################################

library(dplyr)
library(ggplot2)

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Load sample dataset with 2016 player statistics for all players in NBA

load("basketball.Rda")

################################################################################
# Comparing True Shooting Pct and Foul Rate
################################################################################

# Subsetting data to just look at guards with over 2000 minutes of game time

plt.data <- filter(nba.data, (Pos == "PG" | Pos == "SG") & MP > 2000) 

# `geom_jitter()` is a variation of `geom_point()` that prevents points from 
# "piling up" when they're close to one another. We can set bubble (point)
# size using the `aes(size = ...)` call below. 

ggplot(plt.data, aes(x = X3PAr, y = FTr)) + 
  geom_jitter(aes(size = OBPM), color = "grey30", shape = 1) + 
  labs(title = "Bubble Plot with Factor Labelling", 
       x = "Percent of Shots Taken from 3-Point Line", 
       y = "Free Throws per Field Goal Attempt (FTr)", 
       size = "Offensive Box \nPlus-Minus") + 
  theme_bcg 

