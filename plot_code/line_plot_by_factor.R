################################################################################
# Line Plot Grouped by Levels of Factor Variable Using ggplot2
################################################################################

# Basic ggplot-related packages

library(ggplot2)
library(latex2exp)

rm(list = ls())

# Setting options for plot formatting, including font type + size, and title
# alignment, using `minimal` theme

theme_bcg <- theme_minimal(base_size = 9, base_family = "Palatino") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Orange sample data set has 7 measurements of age and circumference for 5 
# different oranges (total of 35 observations)

data(Orange)

################################################################################
# Plotting
################################################################################

# Start by creating a observation count by ID variable using `dplyr`. Note that 
# data needs to be in *long* form. 

library(dplyr)

df <- group_by(Orange, Tree) %>% 
  mutate(count = row_number()) 

# Creating re-ordered `tree` factor variable

df$Tree <- factor(df$Tree, levels = c(1,2,3,4,5))

# Line Plot-- notice options for setting x-axis ticks + legend label

ggplot(df) + 
  geom_line(aes(x = count, y = circumference, color = Tree)) +
  labs(title = "Sample Line Plot with Factor Groupings", 
       y = "Circumference (mm)", x = "Observation",
       color = "Tree") + 
  scale_x_continuous(breaks=seq(1, 7, 1)) + 
  theme_bcg
