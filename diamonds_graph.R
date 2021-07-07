# Create a facet_wrap set of scatterplots using ggplot and the tidyverse 
# diamonds dataset

head(diamonds)
as_tibble(diamonds)
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + 
  geom_point() +
  facet_wrap(~cut)



