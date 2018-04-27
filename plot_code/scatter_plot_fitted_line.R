################################################################################
# Scatter Plot with Fitted Line Using ggplot2
################################################################################

library(dplyr)
library(ggplot2)

rm(list = ls())

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Load sample dataset with 2016 player statistics for all players in NBA

load("basketball.Rda")

################################################################################
# Scatter Plot with Minutes Played and Player Efficiency Rating (PER)
################################################################################

# Data is filtered to only players with at least one full game (48 minutes)
# worth of playing time during the season. `geom_smooth` options set to display
# a 3rd-degree polynomial fitted line with SE bands displayed

ggplot(filter(nba.data, MP > 48), aes(x = MP, y = PER)) + 
  geom_point(size = 0.5, color = "grey30") + 
  geom_smooth(method = "lm", formula = y ~ x + I(x^2) + I(x^3), se = TRUE) + 
  labs(title = "Relationship between Minutes Played and PER", 
       y = "Player Efficiency Rating (PER)", 
       x = "Minutes Played (MP)") + 
  theme_bcg