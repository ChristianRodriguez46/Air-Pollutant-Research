###############################################################################
# Air Pollutants — Build + Clean, Readable Plots (tilted years on small facets)
###############################################################################

# 0) Setup --------------------------------------------------------------------
suppressPackageStartupMessages({
  if (!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
  if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")
  if (!requireNamespace("scales",    quietly = TRUE)) install.packages("scales")
  library(tidyverse); library(lubridate); library(scales)
})

# >>> EDIT THIS: folder that ALREADY contains your CSVs <<<
# Example: input_dir <- "~/Air-Pollutant-Research/Group Plots"
input_dir  <- "."
output_dir <- input_dir   # write outputs back to the same folder

# Color palette (colorblind-friendly)
pal_pollutant <- c(
  "CO"    = "#0072B2",
  "NO2"   = "#D55E00",
  "Ozone" = "#009E73",
  "PM2.5" = "#CC79A7",
  "SO2"   = "#56B4E9"
)

# Units per pollutant — edit if CO is ppm in your source
unit_map <- c("PM2.5" = "µg/m³", "NO2" = "ppb", "Ozone" = "ppb", "SO2" = "ppb", "CO" = "ppb")

# Helper: minimal, clean theme used across plots
theme_clean <- function(base = 13) {
  theme_minimal(base_size = base) +
    theme(
      panel.grid.minor   = element_blank(),
      panel.grid.major.x = element_line(color = "grey90"),
      panel.grid.major.y = element_line(color = "grey90"),
      strip.text         = element_text(face = "bold"),
      plot.title         = element_text(face = "bold", hjust = 0.5),
      legend.position    = "top",
      legend.box         = "horizontal"
    )
}

# Helper: if there are many year ticks, tilt labels; otherwise keep horizontal
tilt_if_dense <- function(breaks, threshold = 12, angle = 45) {
  if (length(breaks) > threshold) {
    theme(axis.text.x = element_text(angle = angle, vjust = 1, hjust = 1))
  } else {
    theme(axis.text.x = element_text(angle = 0))
  }
}

# 1) Read and combine CSVs ----------------------------------------------------
csvs <- list.files(input_dir, pattern = "wt_daily_complete\\.csv$", full.names = TRUE)
stopifnot("No *wt_daily_complete.csv files found in input_dir" = length(csvs) > 0)

read_one <- function(fp) {
  readr::read_csv(fp, show_col_types = FALSE) %>%
    rename_with(tolower) %>%
    { needed <- c("date","high","low","mid","disparity","year","doy","pollutant")
    miss <- setdiff(needed, names(.))
    if (length(miss)) stop("Missing columns in ", basename(fp), ": ", paste(miss, collapse=", "))
    . } %>%
    mutate(
      date      = as.Date(date),
      year      = as.integer(year),
      pollutant = as.character(pollutant)
    ) %>%
    select(date, year, doy, pollutant, low, mid, high, disparity, everything())
}

combined <- map_dfr(csvs, read_one) %>%
  mutate(
    pollutant = case_when(
      pollutant %in% c("PM25","pm25","Pm2.5","pm2.5") ~ "PM2.5",
      pollutant %in% c("NO₂","no2","NO2")            ~ "NO2",
      pollutant %in% c("o3","O3","ozone","Ozone")    ~ "Ozone",
      pollutant %in% c("so2","SO₂","SO2")            ~ "SO2",
      pollutant %in% c("co","CO")                    ~ "CO",
      TRUE ~ pollutant
    )
  )

# Save combined CSV (overwrite ok)
combined_csv <- file.path(output_dir, "combined_all_pollutants.csv")
readr::write_csv(combined, combined_csv)
message("✅ Combined CSV written: ", combined_csv)

# Shared axis breaks
year_min    <- min(combined$year, na.rm = TRUE)
year_max    <- max(combined$year, na.rm = TRUE)
year_breaks <- seq(year_min - (year_min %% 2), year_max, by = 2)
date_breaks <- as.Date(paste0(year_breaks, "-01-01"))

# 2) Yearly correlations (faceted; tilt years for small panels) --------------
corr_df <- combined %>%
  group_by(pollutant, year) %>%
  summarise(
    `Low–Mid`  = cor(low, mid,  use = "pairwise.complete.obs"),
    `Low–High` = cor(low, high, use = "pairwise.complete.obs"),
    `Mid–High` = cor(mid, high, use = "pairwise.complete.obs"),
    .groups    = "drop"
  ) %>%
  pivot_longer(-c(pollutant, year), names_to = "pair", values_to = "r")

p_corr <- ggplot(corr_df, aes(year, r, colour = pair)) +
  geom_hline(yintercept = 0, colour = "grey55", linewidth = 0.4) +
  geom_line(linewidth = 0.9) +
  geom_point(size = 1.6) +
  facet_wrap(~ pollutant, scales = "free_y") +
  scale_color_manual(values = c("Low–Mid"="#1b9e77","Low–High"="#d95f02","Mid–High"="#7570b3"), name = NULL) +
  coord_cartesian(ylim = c(-1, 1)) +
  scale_x_continuous(breaks = year_breaks) +
  labs(
    title    = "Yearly Pearson Correlations by Pollutant",
    subtitle = paste("California counties •", year_min, "–", year_max),
    x = "Year", y = "Pearson r"
  ) +
  theme_clean(13) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  # tilt for small facet panels

ggsave(file.path(output_dir, "grouped_correlation_plot.pdf"), p_corr, width = 11, height = 7, dpi = 300)
message("✅ Saved: grouped_correlation_plot.pdf")

# 3) Annual disparities (absolute split by unit; relative all together) -------
disp_year <- combined %>%
  mutate(unit = unit_map[pollutant]) %>%
  group_by(pollutant, unit, year) %>%
  summarise(y_low = mean(low, na.rm = TRUE),
            y_high = mean(high, na.rm = TRUE), .groups = "drop") %>%
  mutate(abs_disp = y_low - y_high,
         rel_disp = y_low / y_high)

# 3a) Absolute disparity — per unit (tilt only if many ticks)
plot_abs_unit <- function(u) {
  dat <- filter(disp_year, unit == u)
  ggplot(dat, aes(year, abs_disp, colour = pollutant)) +
    geom_hline(yintercept = 0, colour = "grey55", linewidth = 0.4) +
    geom_line(linewidth = 1) +
    geom_point(size = 1.9) +
    scale_colour_manual(values = pal_pollutant, guide = guide_legend(nrow = 1)) +
    scale_x_continuous(breaks = year_breaks) +
    labs(
      title    = paste("Annual Absolute Disparity (low − high) —", u),
      subtitle = paste(year_min, "–", year_max),
      x = "Year", y = paste0("Absolute disparity (", u, ")"), colour = "Pollutant"
    ) +
    theme_clean(13) +
    tilt_if_dense(year_breaks, threshold = 12, angle = 45)
}

for (u in unique(disp_year$unit)) {
  safe_unit <- gsub("/", "_", gsub("µ", "u", u))  # filename-safe
  fname <- paste0("abs_disparity_", safe_unit, ".pdf")
  ggsave(file.path(output_dir, fname), plot_abs_unit(u), width = 10.5, height = 6, dpi = 300)
  message("✅ Saved: ", fname)
}

# 3b) Relative disparity — all pollutants together (tilt only if many ticks)
p_rel <- ggplot(disp_year, aes(year, rel_disp, colour = pollutant)) +
  geom_hline(yintercept = 1, colour = "grey55", linewidth = 0.4) +
  geom_line(linewidth = 1) +
  geom_point(size = 1.9) +
  scale_colour_manual(values = pal_pollutant, guide = guide_legend(nrow = 1)) +
  scale_x_continuous(breaks = year_breaks) +
  labs(
    title    = "Annual Relative Disparity (low / high) — All Pollutants",
    subtitle = paste(year_min, "–", year_max),
    x = "Year", y = "Relative disparity (ratio)", colour = "Pollutant"
  ) +
  theme_clean(13) +
  tilt_if_dense(year_breaks, threshold = 12, angle = 45)

ggsave(file.path(output_dir, "relative_disparity_all.pdf"), p_rel, width = 10.5, height = 6, dpi = 300)
message("✅ Saved: relative_disparity_all.pdf")

# 4) Daily difference grid (uses 'disparity'; tilt years for small facets) ----
p_diff <- ggplot(combined, aes(date, disparity)) +
  geom_hline(yintercept = 0, colour = "red", linewidth = 0.8) +
  geom_line(colour = "#08306B", linewidth = 0.4) +
  facet_wrap(~ pollutant, ncol = 3, scales = "free_y") +
  scale_x_date(breaks = date_breaks, date_labels = "%Y",
               expand = expansion(mult = c(0.01, 0.02))) +
  labs(
    title    = "Population-weighted Daily Difference (Low − High)",
    subtitle = paste(year_min, "–", year_max),
    x = "Year", y = "Difference (units vary by pollutant)"
  ) +
  theme_clean(12) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))  # tilt for small facet panels

ggsave(file.path(output_dir, "diff_grid_by_pollutant.pdf"),
       p_diff, width = 12, height = 7.5, dpi = 300)
message("✅ Saved: diff_grid_by_pollutant.pdf")

###############################################################################
# Done. Outputs are in the same folder as your CSVs:
#   - grouped_correlation_plot.pdf
#   - abs_disparity_ppb.pdf &/or abs_disparity_ug_m3.pdf (auto-named by unit)
#   - relative_disparity_all.pdf
#   - diff_grid_by_pollutant.pdf
###############################################################################
