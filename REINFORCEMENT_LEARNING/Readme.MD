# Reinforcement Learning Stock Trading and GDP Time Series Analysis

## Overview
This project comprises two main sections:
1. **Reinforcement Learning for Stock Trading**:
   - Explores the use of reinforcement learning techniques to create a basic stock trading engine.
   - Defines training tuples using historical stock price data, focusing on current state, action, reward, and next state.

2. **Time Series Analysis of Real GDP Growth**:
   - Analyzes real GDP data using time series methods.
   - Performs stationarity tests, ARMA modeling, and future GDP growth forecasts.

---

## Objectives
### Reinforcement Learning
- Define training tuples for reinforcement learning using historical stock prices.
- Identify current state, actions (buy, hold, sell), rewards, and next states to form training data.

### Real GDP Analysis
- Import and preprocess real GDP data.
- Perform stationarity checks and transform GDP data into growth rates.
- Build ARMA models to analyze and forecast GDP growth.
- Compare models using metrics like AIC (Akaike Information Criterion).

---

## Dataset
### Stock Price Data
- **Source**: Historical stock price data (specific source not included; assumes access to financial data API or CSV file).

### Real GDP Data
- **Source**: [FRED Economic Data](https://fred.stlouisfed.org/series/GDPC1).
- **Observations**: 311 rows (dates from 1947 to the most recent quarter).
- **Variables**:
  - `Date`: Date of observation.
  - `Real GDP`: Seasonally adjusted real GDP.

---

## Methodology
### Reinforcement Learning
1. **Training Data Preparation**:
   - Used historical stock prices to create sequential data for reinforcement learning.
   - Defined:
     - `State (si)`: Current stock price.
     - `Action (ai)`: Trading decision (buy, hold, sell).
     - `Reward (ri+1)`: Portfolio value change or profit from a sell action.
     - `Next State (si+1)`: Updated stock and portfolio information.

### Real GDP Analysis
1. **Data Preprocessing**:
   - Imported GDP data from FRED and converted the date column to `Date` format using the `lubridate` library.
   - Filtered data for observations post-1990.
2. **Stationarity Tests**:
   - Examined stationarity of GDP and GDP growth using plots and the Augmented Dickey-Fuller test.
3. **ARMA Modeling**:
   - Used ACF and PACF plots to determine ARMA model order.
   - Built ARMA models using `Arima()` and `auto.arima()` functions in R.
   - Compared models using AIC values.
4. **Forecasting**:
   - Generated 4-period-ahead forecasts with confidence intervals for GDP growth.

---

## Results
### Reinforcement Learning
- **Training Tuples**:
  - Successfully created sequential data for reinforcement learning.
  - Reward system focused on realized profit for sell actions.
- **Next Steps**:
  - Implement a trading policy to optimize rewards using reinforcement learning algorithms.

### Real GDP Analysis
- **Stationarity**:
  - Real GDP was non-stationary, but GDP growth showed stationarity with a p-value < 0.01 in the Augmented Dickey-Fuller test.
- **ARMA Model**:
  - Optimal model suggested by ACF/PACF plots: MA(1).
  - Generated accurate 4-period-ahead forecasts.
- **Model Comparison**:
  - AIC values of ARMA models estimated using `Arima()` and `auto.arima()` were identical, suggesting consistency in model selection.

---

## Tools and Libraries
- **Programming Language**: R
- **Key Libraries**:
  - `lubridate`: Handled date formatting for time series data.
  - `forecast`: Performed ARMA modeling and forecasting.
  - `tseries`: Conducted the Augmented Dickey-Fuller test.
  - `ggplot2`: Visualized GDP and GDP growth trends.

---

## How to Run
1. Open the `reinforcement_learning_and_gdp_analysis.R` script in RStudio.
2. Install required libraries:
   ```R
   install.packages(c("lubridate", "forecast", "tseries", "ggplot2"))

##Limitations
1.Reinforcement Learning:
  The current reward system is simplified and may not reflect complex trading strategies.
2.GDP Analysis:
  Time series models are sensitive to the dataset and assumptions of stationarity.
Results are based on past trends and may not capture structural economic shifts.

##Future Work
-Enhance the reinforcement learning model with dynamic trading policies (e.g., Q-learning).
-Expand GDP analysis to include structural breaks and external predictors.
-Apply advanced time series models like SARIMA or VAR for improved forecasting.
