################################################################################
# Scatter Plot with Labeled Points Using ggplot2
################################################################################

library(dplyr)
library(ggplot2)

# Load sample dataset with 2016 player statistics for all players in NBA

load("basketball.Rda")

################################################################################
# Plotting Relationship between Offensive and Defensive Box Plus-Minus (BPM)
################################################################################

# We can use the `ggrepel` package for neatly formatted point labelling

library(ggrepel)

# Use `dplyr` to select + sort the top 10 players by total minutes played

arrange(filter(nba.data, MP > 2000),-MP)[1:12,] %>% 
  ggplot(aes(x = OBPM, y = DBPM)) + 
  geom_point(size = 1, color = "grey30") + 
  geom_text_repel(aes(label = Player), family = "Palatino", size = 3.2,
                  segment.color = NA, box.padding = 0.6) + 
  labs(title = "Offensive and Defensive Box Plus-Minus for Minutes Leaders", 
         y = "Defensive BPM", x = "Offensive BPM") + theme_bcg

