
library(psych)
data= diamonds
dimensionStats <- describeBy(
  x = diamonds$price,
  group = diamonds$cut,
  data = diamonds,
  mat = TRUE,
  quant = c(0.2, 0.4,0.6,0.8)
) %>%
  mutate(
    vars = case_when(
      vars == 1 ~ "Price($)",
    )
  ) %>%
  select(Cut = group1, Price = vars, Count = n,
         Minimum=min, "first QUIN-tile"
         = Q0.2, "second QUIN-tile" = Q0.4,Meaidan=median,"third QUIN-tile" = Q0.6,"fourth QUIN-tile" = Q0.8, Maximun=max, Mean=mean,"Stander Divination"=sd)
dimensionStats %>%
  kable(
    caption = "Cut and Depth separate relation for diamonds " ,
    booktabs =TRUE,
    align = c("l", rep("c",3))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )