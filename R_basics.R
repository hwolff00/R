install.packages("tidyverse")
install.packages("ggrepel")
library(tidyverse)
library(ggrepel)

# Playing around with creating a dataframe from scratch in R
names <- c("Peter", "Jennifer", "Julie", "Alex")
age <- c(15, 19, 21, 25)
people <- data.frame(names, age)

# Preview up to 6 head rows
head(people)

# Look at metadata/structure of dataframe
str(people)

# Like str but more readable imo
glimpse(people)

# All column names
colnames(people)

# Mutate updates dataframe by adding new column (not in place)
mutate(people, age_in_20 = age + 20)

head(people)

# Pulling in data from tidyverse
data(mtcars)

# Read dataset from csv
ramen <- read_csv("Desktop/ramen-ratings.csv")

# View tibble of data
ramen

colnames(ramen)

ranked <- ramen %>%
  arrange(desc(Stars))

rara <- ramen %>% group_by(Country, Style, Stars, Brand) %>%
  drop_na()

rara

ggplot(data = rara, aes(x = Country, y = Stars, color= Style)) + 
  geom_point() 

ramenplot <- ggplot(data = rara, aes(x= Country, y = Stars, color= Style)) + 
  geom_point(size=3)


### Use geom_label_repel to help fit in the extra labels
ramenplot + 
  geom_label_repel(aes(label = Brand),
                   box.padding   = 0.4, 
                   point.padding = 0.6,
                   max.overlaps = 30,
                   segment.color = 'grey50') +
  theme_classic()


