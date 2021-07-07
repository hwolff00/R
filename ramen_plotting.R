install.packages("tidyverse")
install.packages("dplyr")
install.packages("janitor")
library(tidyverse)
library(dplyr)
library(janitor)

#Read dataset from csv
ramen <- read_csv("Desktop/ramen-ratings.csv")

# View tibble of data
ramen

rara <- ramen %>% 
  group_by(Country, Style, Stars, Brand) %>%
  # use janitor to turn black columns into NA to make cleaning easier later
  na_if("")

# Saves Dataframe as a new file
View(rara)

select(rara,`Top Ten`)

ra <- rara %>% separate(`Top Ten`, c("Year", "Rank"), sep= " ")

ra <- ra %>%
  drop_na()

View(ra)

ggplot(data = ra, aes(x = Stars, y = Brand, color=Variety)) + 
  geom_point() + 
  facet_wrap(~Year) + 
  labs(title="Ramen: Highest Ranked Brands by Year")







