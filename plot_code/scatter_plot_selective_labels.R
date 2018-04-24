################################################################################
# Scatter Plot with Selectively Labeled Points Using ggplot2
################################################################################

library(dplyr)
library(ggplot2)

# Load sample dataset with 2016 player statistics for all players in NBA

load("basketball.Rda")

################################################################################
# Comparing True Shooting Pct and Three Point Attempt Rate
################################################################################

# We'll use the `ggrepel` package to get neatly formatted labels

library(ggrepel)

# Subsetting data to just look at guards with over 2000 minutes of game time

plt.data <- filter(nba.data, (Pos == "PG" | Pos == "SG") & MP > 2000) 

# We want to look at highest and lowest rated players by free throw attempt 
# rate (FTr) and 3 pt attempt rate (X3PAr), defined as 5th and 95th percentiles

x.min <- quantile(plt.data$X3PAr, seq(0, 1, 0.05))[2]
x.max <- quantile(plt.data$X3PAr, seq(0, 1, 0.05))[20]
y.min <- quantile(plt.data$FTr, seq(0, 1, 0.05))[2]
y.max <- quantile(plt.data$FTr, seq(0, 1, 0.05))[20]

# Subset plotting dataset to just the observations that we want to have names
# included on the plot

lbls.df <- filter(plt.data, X3PAr < x.min | X3PAr > x.max | 
                  FTr > y.max | FTr < y.min)

# Scatter Plot

ggplot(data = plt.data, aes(x = X3PAr, y = FTr)) + 
  geom_point(shape = 1, color = "grey30") + 
  geom_text_repel(data = lbls.df, aes(x = X3PAr, y = FTr, label = Player), 
                  family = "Palatino", box.padding = 0.5, 
                  segment.color = "grey80") + 
  labs(title = "Bubble Plot with Factor Labelling", 
       x = "Percent of Shots Taken from 3-Point Line", 
       y = "Free Throws per Field Goal Attempt (FTr)") + 
  theme_bcg 
