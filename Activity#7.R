data(rawArmyData)
ArmyDate <- rawArmyData %>%
  filter(maritalStatus == "Joint Service Marriage")


library(dplyr)
library(kableExtra)
library(knitr)
library(janitor)

ArmyTable <- ArmyDate %>%
  tabyl(sex, payGrade) %>%
  adorn_totals(where = c("row","col")) %>%
  adorn_percentages(denominator = "all") %>%
  adorn_pct_formatting(digits =2 ) %>%
  adorn_title(
    placement ="combined",
    row_name = "sex",
    col_name = "payGrade"
  )

formatNs <- attr(ArmyTable, "core") %>%
  adorn_totals(where= c("row","col")) %>%
  mutate(
    across(where(is.numeric),format, big.mark =",")
  )

ArmyFreqtab <- ArmyTable %>%
  adorn_ns(position = "front",ns= formatNs )


ArmyFreqtab %>%
  kable(
    caption = "Sex and paygrade of Joint Service Marriage in Army" ,
    booktabs =TRUE,
    align = c("l", rep("c",6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )

