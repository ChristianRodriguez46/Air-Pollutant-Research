library(dplyr)
library(lubridate)
library(readr)   # for write_csv()

# ───────────────────────────────────────────────────────────────
# 1.  Compute year-wise correlations (low, mid, high) ------------
# ───────────────────────────────────────────────────────────────
corr_yearly_no2 <- no2wt_daily_complete %>% 
  mutate(year = year(date)) %>% 
  group_by(year) %>% 
  summarise(
    low_mid  = cor(low,  mid,  use = "pairwise.complete.obs"),
    low_high = cor(low,  high, use = "pairwise.complete.obs"),
    mid_high = cor(mid,  high, use = "pairwise.complete.obs"),
    .groups  = "drop"
  )

# ───────────────────────────────────────────────────────────────
# 2.  Inspect in the console ------------------------------------
# ───────────────────────────────────────────────────────────────
print(corr_yearly_no2, n = Inf)   # show all years

# ───────────────────────────────────────────────────────────────
# 3.  (Optional) save to CSV ------------------------------------
# ───────────────────────────────────────────────────────────────
write_csv(corr_yearly_no2, "yearly_correlations_co_income.csv")
