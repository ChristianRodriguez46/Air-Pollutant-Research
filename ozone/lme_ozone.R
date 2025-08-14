# Load necessary libraries
library(nlme)
library(lubridate)

# Assuming your data frame is named 'ozonewt_daily_complete'
# Convert 'date' column to Date type if it's not already
ozonewt_daily_complete$date <- as.Date(ozonewt_daily_complete$date)

# Extract year and day of year for seasonality
ozonewt_daily_complete$year <- year(ozonewt_daily_complete$date)
ozonewt_daily_complete$doy <- yday(ozonewt_daily_complete$date)

# Calculate disparity between low and high-income groups
ozonewt_daily_complete$disparity <- ozonewt_daily_complete$low - ozonewt_daily_complete$high


# Fit LME model with AR(1) correlation structure
lme_model <- lme(
  disparity ~ year + sin(2 * pi * doy / 365.25) + cos(2 * pi * doy / 365.25),
  data = ozonewt_daily_complete,
  random = ~1 | year,
  correlation = corAR1(form = ~ doy | year),
  method = "REML"
)

# Summarize the model
summary(lme_model)
