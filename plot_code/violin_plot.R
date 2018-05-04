################################################################################
# Violin Plot by Factor Variable Using ggplot2
################################################################################

# Basic ggplot-related packages

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
# Violin Plot by Factor Variable-- Splitting Players by Position
################################################################################

# Violin plot

ggplot(nba.data) + 
  geom_violin(aes(x = Pos, y = DBPM)) + 
  labs(title = "Comparing Defensive BPM Scores by Position", 
       x = "DBPM", y = "Density", color = "") + 
  theme_bcg + theme(strip.text.y = element_text(angle = 0),
                    strip.background = element_rect(color = "grey70", size = 0.5))
