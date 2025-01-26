
# ECO 520 Business Analytics II
# Time Series Analysis - ARIMA Models

#Importing GDP data

raw_data <- read.csv("D:/DEPAUL/QUARTER 5/BUSINESS ANALYTICS TOOLS - 2/ASSIGNMENT/ASSIGNMENT - 6/GDPC1.csv"
                     , header = TRUE, sep = ',')

View(raw_data)

# Check data types
str(raw_data)

# lubridate library helps convert any string data into proper date format
install.packages("lubridate")
library(lubridate)

# Hmisc library contains some handy time series commands
install.packages("Hmisc")
library(Hmisc)

raw_data$DATE <- ymd(raw_data$DATE)

str(raw_data)

# Select post 1990 data only
data <- with(raw_data, raw_data[(DATE >= "1990-01-01"), ])
View(data)

#Plot GDP

plot(data$DATE,data$GDPC1)


#Create lag GDP

data$lagGDP <- Lag(data$GDPC1)
View(data)

#Calculare GDP growth
# (GDPt − GDPt−1)/GDPt−1 ∗ 400.
data$GDPgrowth <- ((data$GDPC1 - data$lagGDP)/data$lagGDP)*400
View(data)


#plot GDP growth
plot(data$DATE, data$GDPgrowth)


# Test for stationarity

# Time series diagnostic tests
#install.packages("tseries") # contains tseries tools such as adf test to check for stationarity
library(tseries)

# Adjusted Dickey Fuller test - a p value < 0.05 indicates
# the time series is stationary
adf.test(na.omit(data$GDPgrowth))


# Autocorrelations and partial autocorrelations - which correlations are significant?
acfgrowth <- acf(na.omit(data$GDPgrowth))
pacfgrowth <- pacf(na.omit(data$GDPgrowth))


# ARIMA modeling
#install.packages("forecast")
library(forecast) 
library(ggplot2)
# Estimate AR(2) model by setting p=0, i=0, q=1
model <- Arima(na.omit(data$GDPgrowth), order = c(0,0,1))
summary(model)
AIC(model)
# Forecasting using AR(2) Model - note the smooth decay in the forecast
forecastedValues <- forecast(model, 4)
plot(forecastedValues, main = "Graph with Forecasting", 
     col.main = "darkgreen") 

# Plot the forecasted values with confidence intervals
autoplot(forecastedValues) +
  ggtitle("4-Period Ahead Forecast of Real GDP Growth") +
  xlab("Time") +
  ylab("Real GDP Growth") +
  theme_minimal()

# Automated ARIMA Using the auto.arima function
automodel <- auto.arima(na.omit(data$GDPgrowth))
summary(automodel)
AIC(automodel)

# Forecasting using AR(2) Model - note the smooth decay in the forecast
forecastedValues2 <- forecast(automodel, 4)
plot(forecastedValues, main = "Graph with Forecasting", 
     col.main = "darkgreen") 

# Plot the forecasted values with confidence intervals
autoplot(forecastedValues2) +
  ggtitle("4-Period Ahead Forecast of Real GDP Growth") +
  xlab("Time") +
  ylab("Real GDP Growth") +
  theme_minimal()