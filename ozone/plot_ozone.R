library(tidyverse)
library(lubridate)
library(scales)

# ───────────────────────────────────────────────────────────────
# 1.  Annual % days low > high
# ───────────────────────────────────────────────────────────────
ann_pct_ozone <- ozonewt_daily_complete %>%
  mutate(date = as.Date(date),
         year = year(date),
         low_gt_high = low > high) %>% 
  group_by(year) %>% 
  summarise(pct_low_gt_high = mean(low_gt_high) * 100,
            .groups = "drop")

# ───────────────────────────────────────────────────────────────
# 2.  Base colours
# ───────────────────────────────────────────────────────────────
col_low   <- "#e6194B"
col_high  <- "#0571b0"
fill_blue <- "#64b5f6"

# ───────────────────────────────────────────────────────────────
# 3.  Shading
# ───────────────────────────────────────────────────────────────
shade_ozone <- ann_pct_ozone %>% 
  mutate(start = as.Date(make_date(year, 1, 1)),
         end   = as.Date(make_date(year, 12, 31)),
         alpha = rescale(pct_low_gt_high, to = c(0.05, 0.30)))

# ───────────────────────────────────────────────────────────────
# 4.  Ensure proper date formats
# ───────────────────────────────────────────────────────────────
ozonewt_daily_complete <- ozonewt_daily_complete %>%
  mutate(date = as.Date(date))

# Wildfire acreage
fire_year <- tribble(
  ~year, ~acres,
  2000,  295026,
  2001,  329126,
  2002,  969890,
  2003, 1020460,
  2004,  264988,
  2005,  222538,
  2006,  736022,
  2007, 1520362,
  2008, 1593690,
  2009,  422147,
  2010,  109529,
  2011,  168545,
  2012,  869599,
  2013,  601635,
  2014,  625540,
  2015,  893362,
  2016,  669534,
  2017, 1548429,
  2018, 1975086,
  2019,  259823,
  2020, 4397809,
  2021, 2568948,
  2022,  362455,
  2023,  324917
) %>% 
  mutate(
    mid = as.Date(make_date(year, 7, 1)),
    acres_scaled = acres / 1e5
  )

# ───────────────────────────────────────────────────────────────
# 5.  Plot base with shading and ozone series
# ───────────────────────────────────────────────────────────────
p_ozone <- ggplot() +
  geom_rect(data = shade_ozone,
            aes(xmin = start, xmax = end,
                ymin = -Inf,  ymax =  Inf,
                alpha = alpha),
            fill = fill_blue) +
  scale_alpha_identity() +
  geom_line(data = ozonewt_daily_complete,
            aes(date, low , colour = "Low-income"),  linewidth = .4) +
  geom_line(data = ozonewt_daily_complete,
            aes(date, high, colour = "High-income"), linewidth = .4) +
  scale_colour_manual(values = c("Low-income"  = col_low,
                                 "High-income" = col_high),
                      name = NULL) +
  geom_text(data = ann_pct_ozone,
            aes(x = make_date(year, 7, 1),
                y = max(c(ozonewt_daily_complete$low,
                          ozonewt_daily_complete$high), na.rm = TRUE) * 1.04,
                label = sprintf("%.0f%%", pct_low_gt_high)),
            size = 4.2, fontface = "bold", colour = "grey20") +
  scale_x_date(breaks = make_date(unique(ann_pct_ozone$year), 1, 1),
               date_labels = "%Y",
               expand = expansion(mult = c(0.01, 0.08))) +
  labs(
    title = "Daily population-weighted Ozone by income group (California)",
    subtitle = "Blue shade = % of days low-income > high-income • Numbers show annual % (2000–2023)",
    x = NULL,
    y = "Ozone (ppm)",
    caption = "Counties ≥ 90 % data completeness; population = California DOF"
  ) +
  coord_cartesian(clip = "off") +
  theme_minimal(base_size = 12) +
  theme(
    legend.position   = "top",
    legend.text       = element_text(size = 11, face = "bold"),
    plot.title        = element_text(face = "bold"),
    plot.margin       = margin(6, 60, 6, 6)
  )

# ───────────────────────────────────────────────────────────────
# 6.  Add wildfire overlay
# ───────────────────────────────────────────────────────────────
p_ozone_wf <- p_ozone + 
  geom_col(data = fire_year,
           aes(x = mid, y = acres_scaled),
           fill = "#ca0020", alpha = .25,
           inherit.aes = FALSE) +
  scale_y_continuous(
    sec.axis = sec_axis(~ . * 1e5,
                        name   = "Wildfire acreage (right)",
                        labels = label_comma())
  ) +
  theme(
    axis.title.y.right = element_text(colour = "#ca0020"),
    axis.text.y.right  = element_text(colour = "#ca0020")
  )

# ───────────────────────────────────────────────────────────────
# 7.  Save full-range plot
# ───────────────────────────────────────────────────────────────
out_dir <- "plots"
dir.create(out_dir, showWarnings = FALSE)

ggsave(
  filename = file.path(out_dir, "ozone_income_wildfire_2000-2023.pdf"),
  plot     = p_ozone_wf,
  width    = 12, height = 7, units = "in"
)

# ───────────────────────────────────────────────────────────────
# 8.  Slice helper + 2 time windows
# ───────────────────────────────────────────────────────────────
limit_plot <- function(plot_obj, x_min, x_max, subtitle) {
  plot_obj +
    coord_cartesian(xlim = c(x_min, x_max), clip = "off") +
    labs(subtitle = subtitle) +
    scale_x_date(date_breaks = "1 year", date_labels = "%Y")
}

p_ozone_0010 <- limit_plot(
  p_ozone_wf,
  x_min = as.Date("2000-01-01"),
  x_max = as.Date("2010-12-31"),
  subtitle = "Blue shade = % of days low > high • Wildfire bars • 2000–2010"
)

p_ozone_1123 <- limit_plot(
  p_ozone_wf,
  x_min = as.Date("2011-01-01"),
  x_max = as.Date("2023-12-31"),
  subtitle = "Blue shade = % of days low > high • Wildfire bars • 2011–2023"
)

ggsave(
  filename = file.path(out_dir, "ozone_income_wildfire_2000-2010.pdf"),
  plot     = p_ozone_0010,
  width    = 12, height = 7, units = "in"
)

ggsave(
  filename = file.path(out_dir, "ozone_income_wildfire_2011-2023.pdf"),
  plot     = p_ozone_1123,
  width    = 12, height = 7, units = "in"
)
