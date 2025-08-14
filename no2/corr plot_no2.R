library(tidyverse)
library(lubridate)

# ───────────────────────────────────────────────────────────────
# 1.  Year-wise pair-wise correlations  --------------------------
# ───────────────────────────────────────────────────────────────
corr_yearly_no2 <- no2wt_daily_complete %>% 
  mutate(year = year(date)) %>% 
  group_by(year) %>% 
  summarise(
    low_mid  = cor(low, mid,  use = "pairwise.complete.obs"),
    low_high = cor(low, high, use = "pairwise.complete.obs"),
    mid_high = cor(mid, high, use = "pairwise.complete.obs"),
    .groups  = "drop"
  ) %>% 
  pivot_longer(-year, names_to = "pair", values_to = "r")

# ───────────────────────────────────────────────────────────────
# 2.  Line plot of r vs year  -----------------------------------
# ───────────────────────────────────────────────────────────────
p_lines_no2 <- ggplot(corr_yearly_no2, aes(year, r, colour = pair)) +
  geom_hline(yintercept = 0, colour = "grey60") +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  scale_colour_manual(values = c("low_mid"  = "#1b9e77",
                                 "low_high" = "#d95f02",
                                 "mid_high" = "#7570b3"),
                      labels  = c("Low–Mid", "Low–High", "Mid–High"),
                      name    = NULL) +
  scale_x_continuous(breaks = seq(2000, 2023, 2)) +
  scale_y_continuous(limits = c(-1, 1)) +
  labs(
    title = "Year-wise Pearson correlation of population-weighted NO2",
    subtitle = "California counties • 2000 – 2023",
    x = "Year",
    y = "Pearson r"
  ) +
  theme_minimal(base_size = 13) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        legend.position = "top")

print(p_lines_no2)

# ───────────────────────────────────────────────────────────────
# 3.  Save as PDF  ----------------------------------------------
# ───────────────────────────────────────────────────────────────
ggsave("no2_income_correlations_2000-2023.pdf",
       plot   = p_lines_no2,
       width  = 8,
       height = 5)
