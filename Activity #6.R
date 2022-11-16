library(dplyr)
library(tidyverse)
library(dcData)


FirstName <- BabyNames %>%
  filter(name == "Marco",sex=="M")
SecondName <- BabyNames %>%
  filter(name == "Tom",sex=="M")
ThirdName <- BabyNames %>%
  filter(name == "Steve",sex=="M")

BabyNames %>%

  ggplot() +
  geom_step(data = FirstName, mapping = aes(x = year, y = count), alpha = 2,color="#F61506") +

  geom_step(data = ThirdName, mapping = aes(x = year, y = count), alpha = 2,color="#06EAF6") +
  labs(
    x = "Years change bettween 1875-2017",
    y = "How many people be name as those name",
    title = "Babies named \"Steve,Marco,Tom\" have grown in popularity over time",
    subtitle = "                   Red : Marco Yellow:Tom Blue Steve"
  ) +
  theme_minimal()




