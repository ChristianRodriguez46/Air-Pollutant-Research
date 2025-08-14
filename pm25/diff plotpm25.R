# 1. Difference series -------------------------------------------------
diff_daily_pm25 <- pm25wt_daily_complete |>
  transmute(
    date,
    diff = low - high
  ) |>
  mutate(date = as.Date(date))   # fix: ensure date is a Date object

# 2. Plot --------------------------------------------------------------
p_diff_simple_pm25 <- ggplot(diff_daily_pm25, aes(date, diff)) +
  geom_line(colour = "#08306B", linewidth = 0.4) +
  geom_hline(yintercept = 0, colour = "red", linewidth = 0.8) +
  scale_x_date(
    breaks      = make_date(seq(2000, 2023, 2), 1, 1),
    date_labels = "%Y",
    expand      = expansion(mult = c(0.01, 0.02))
  ) +
  labs(
    title = "Population-weighted daily PM2.5 difference (low - high income)",
    x     = NULL,
    y     = "Delta PM2.5 (µg/m³)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title.position = "plot",
    plot.title = element_text(
      face = "bold",
      hjust = 0.5,
      size = 14,
      margin = margin(b = 8)
    ),
    plot.margin = margin(20, 36, 6, 6)
  )

print(p_diff_simple_pm25)
