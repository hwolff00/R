# Create a facet_wrap set of scatterplots using ggplot and the tidyverse 
# diamonds dataset
library(dplyr)
library(tidyverse)
library(janitor)

as_tibble(diamonds)

# Filter diamonds
d<- diamonds %>%
  filter(cut == "Ideal" & price >= 6000)

# Stacked bar chart
ggplot(data = d) +
  geom_bar(aes(carat, fill=color)) +
  labs(title= "$6000+ Diamond Carats")

