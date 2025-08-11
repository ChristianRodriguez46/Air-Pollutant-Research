library(tidyverse)
library(lubridate)

# ───────────────────────────────────────────────────────────────
# 1.  Annual population-weighted means  (low & high) ------------
# ───────────────────────────────────────────────────────────────
annual_means <- so2wt_daily_complete %>% 
  mutate(year = year(date)) %>% 
  group_by(year) %>% 
  summarise(
    y_low  = mean(low ,  na.rm = TRUE),   # Ȳ_low,t^(p)
    y_high = mean(high, na.rm = TRUE),   # Ȳ_high,t^(p)
    .groups = "drop"
  )

# ───────────────────────────────────────────────────────────────
# 2.  Absolute (Δ) & Relative (R) disparities  ------------------
# ───────────────────────────────────────────────────────────────
disp_year <- annual_means %>% 
  mutate(
    abs_disp = y_low  - y_high,  # Δ_t^(p)  (µg/m³)
    rel_disp = y_low  / y_high   # R_t^(p)  (ratio)
  ) %>% 
  select(year, abs_disp, rel_disp)

print(disp_year, n = Inf)        # show all years in console

# ───────────────────────────────────────────────────────────────
# 3.  Save to CSV  ----------------------------------------------
# ───────────────────────────────────────────────────────────────
write_csv(disp_year, "annual_disparities_low_vs_high_pm25_2000_2023.csv")

cat("✓ CSV written to 'annual_disparities_low_vs_high_pm25_2000_2023.csv'\n")

library(ggplot2)
library(readr)   # if you read disp_year from disk

# If disp_year is already in memory, skip this line
# disp_year <- read_csv("annual_disparities_low_vs_high_pm25_2000_2023.csv")

# ───────────────────────────────────────────────────────────────
# 1.  Absolute disparity plot  (µg/m³) ---------------------------
# ───────────────────────────────────────────────────────────────
p_abs <- ggplot(disp_year, aes(year, abs_disp)) +
  geom_hline(yintercept = 0, colour = "grey50") +
  geom_line(colour = "#d73027", linewidth = 1) +
  geom_point(colour = "#d73027", size = 2) +
  labs(
    title = "Annual absolute disparity (low – high) in population-weighted SO2",
    x = "Year", y = "Absolute disparity (µg/m³)"
  ) +
  theme_minimal(base_size = 13) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5))

# ───────────────────────────────────────────────────────────────
# 2.  Relative disparity plot  (ratio) ---------------------------
# ───────────────────────────────────────────────────────────────
p_rel <- ggplot(disp_year, aes(year, rel_disp)) +
  geom_hline(yintercept = 1, colour = "grey50") +
  geom_line(colour = "#1a9850", linewidth = 1) +
  geom_point(colour = "#1a9850", size = 2) +
  labs(
    title = "Annual relative disparity (low / high) in population-weighted SO2",
    x = "Year", y = "Relative disparity (ratio)"
  ) +
  theme_minimal(base_size = 13) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5))

# Display
print(p_abs)
print(p_rel)

# ───────────────────────────────────────────────────────────────
# 3.  Save each plot as PDF  ------------------------------------
# ───────────────────────────────────────────────────────────────
ggsave("pm25_abs_disparity_2000_2023.pdf", plot = p_abs,
       width = 7, height = 4.5, units = "in")

ggsave("pm25_rel_disparity_2000_2023.pdf", plot = p_rel,
       width = 7, height = 4.5, units = "in")

