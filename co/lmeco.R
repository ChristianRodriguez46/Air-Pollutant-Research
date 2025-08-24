# Load necessary libraries
library(nlme)
library(lubridate)

# Assuming your data frame is named 'cowt_daily_complete'
# Convert 'date' column to Date type if it's not already
cowt_daily_complete$date <- as.Date(cowt_daily_complete$date)

# Extract year and day of year for seasonality
cowt_daily_complete$year <- year(cowt_daily_complete$date)
cowt_daily_complete$doy <- yday(cowt_daily_complete$date)

# Calculate disparity between low and high-income groups
cowt_daily_complete$disparity <- cowt_daily_complete$low - cowt_daily_complete$high


# Fit LME model with AR(1) correlation structure
lme_model <- lme(
  disparity ~ year + sin(2 * pi * doy / 365.25) + cos(2 * pi * doy / 365.25),
  data = cowt_daily_complete,
  random = ~1 | year,
  correlation = corAR1(form = ~ doy | year),
  method = "REML"
)

# Summarize the model
summary(lme_model)