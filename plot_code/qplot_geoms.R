################################################################################
# Additional `qplot` Examples
################################################################################

# Examples below are taken from the R documentation for `qplot`

library(ggplot2)

rm(list=ls())

# Sample `cars` dataset

data("mtcars")

################################################################################
# Additional geom Options
################################################################################

# Facet plot by factor variable

qplot(mpg, wt, data = mtcars, facets = .~cyl)

# Specifying multiple `geom` options

qplot(factor(cyl), wt, data = mtcars, geom = c("boxplot", "jitter"))
