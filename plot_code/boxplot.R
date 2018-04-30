################################################################################
# Boxplot Using ggplot2
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

# Scatter Plot with size and color of points specified

ggplot(Orange) + 
  geom_boxplot(aes(x = Tree, y = circumference), fill = "grey95") + 
  labs(title = "Sample Boxplot", 
       y = "Circumference (cm)", 
       x = "Tree") + 
  theme_bcg



