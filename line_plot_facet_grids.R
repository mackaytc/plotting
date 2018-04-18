################################################################################
# Line Subplots with Facets Using ggplot2
################################################################################

# Basic ggplot-related packages

library(dplyr)
library(ggplot2)

# Load sample dataset with 2016 player statistics for all players in NBA

load("basketball.Rda")

################################################################################
# Facet Plots-- Splitting Players by Position
################################################################################

# We'll `dplyr` to reshape the data from `wide` to `long` format using the
# `gather` command and create a new dataset where each player in the data set
# has two rows-- one corresponding to their defensive BPM and one corresponding
# to their offensive BPM. 

facet.data <- select(nba.data, Player, Pos, OBPM, DBPM) %>% 
  gather(key = c(Player, Pos), value = BPM, OBPM:DBPM) %>% 
  rename(stat = `c(Player, Pos)`) %>% 
  arrange(Player)

# Facet Plot-- note the formatting options at the bottom to specify facet
# formatting

ggplot(facet.data) + facet_grid(Pos ~ .) +  
  geom_density(aes(x = BPM, color = stat)) + 
  scale_x_continuous(breaks = seq(0, 12, 2)) + 
  labs(title = "Comparing Offensive and Defensive BPM Scores by Position", 
       x = "BPM", y = "Density", color = "") + 
  theme_bcg + theme(strip.text.y = element_text(angle = 0),
                    strip.background = element_rect(color = "grey70", size = 0.5))
