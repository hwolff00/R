install.packages("tidyverse")
install.packages("ggrepel")
install.packages("janitor")
library(tidyverse)
library(ggrepel)
library(dplyr)
library(janitor)

#Read dataset from csv
ramen <- read_csv("Desktop/ramen-ratings.csv")

# View tibble of data
ramen

rara <- ramen %>% group_by(Country, Style, Stars, Brand) %>%
  drop_na()

View(rara)

select(rara,`Top Ten`)

ra <- rara %>% separate(`Top Ten`, c("Year", "Rank"), sep= " ")

ra <- ra %>%
  # recode empty strings "" by NAs
  na_if("") %>%
  # remove NAs
  drop_na()

View(ra)

ggplot(data = ra, aes(x = Stars, y = Brand, color=Variety)) + 
  geom_point() + 
  facet_wrap(~Year) + 
  labs(title="Ramen: Highest Ranked Brands by Year")







