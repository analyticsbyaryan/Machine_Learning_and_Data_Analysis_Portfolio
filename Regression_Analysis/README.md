# Regression Analysis of Boston Housing Dataset

## Overview
This project explores linear and multiple regression techniques to analyze the factors affecting housing prices in the Boston area. The analysis identifies significant predictors of median home values and evaluates the model's performance, addressing key assumptions and multicollinearity issues.

---

## Objectives
1. Investigate the relationship between housing characteristics and median home values (`MEDV`).
2. Build and interpret regression models.
3. Address violations of OLS assumptions (e.g., normality, homoskedasticity).
4. Evaluate the impact of multicollinearity on the model and refine it accordingly.

---

## Data
- **Dataset**: The dataset contains **506 observations** and **14 variables** representing various attributes of houses in the Boston area.
- **Key Variables**:
  - `MEDV` (dependent variable): Median value of owner-occupied homes.
  - `CRIM`: Per capita crime rate.
  - `ZN`: Proportion of residential land zoned for lots over 25,000 sq. ft.
  - `RM`: Average number of rooms per dwelling.
  - `LSTAT`: Percentage of lower-status population.
  - `PTRATIO`: Pupil-teacher ratio by town.
  - And more...

---

## Methodology
1. **Data Preparation**:
   - Imported dataset without column headers and assigned appropriate labels.
   - Verified the dataset structure and variable types.
2. **Exploratory Data Analysis**:
   - Generated summary statistics for the dependent variable (`MEDV`).
   - Plotted histograms and QQ plots to assess normality.
3. **Model Building**:
   - Built simple linear regression models to identify significant variables.
   - Developed a multiple linear regression model including all significant variables.
   - Addressed multicollinearity using VIF and correlation matrices.
   - Refined the model by removing insignificant variables.
4. **Scenario Predictions**:
   - Predicted home values under three distinct scenarios:
     - Urban Renewal Project
     - Suburban Family Community
     - Aging Industrial Town

---

## Results
- **Key Insights**:
  - Significant predictors of home values:
    - Higher `RM` (average rooms per dwelling) increases home prices.
    - Higher `LSTAT` (lower-status population) decreases home prices.
    - Proximity to the Charles River (`CHAS`) positively impacts home values.
  - Multicollinearity:
    - High multicollinearity was detected between `RAD` (highway access) and `TAX` (property tax).
    - A refined model excluding `TAX` showed improved interpretability with minimal loss in Adjusted R².
  - Final model explains **73.4% of the variance** in home values.

- **Scenario Predictions**:
  1. **Urban Renewal Project**: Predicted median value ≈ **$34,603**.
  2. **Suburban Family Community**: Predicted median value ≈ **$40,955**.
  3. **Aging Industrial Town**: Predicted median value ≈ **$240.76**.

---

## Tools and Libraries
- **Programming Language**: R
- **Libraries**:
  - `stargazer`: Exported regression results to Word.
  - `ggplot2`: Visualized data relationships.
  - `car`: Checked for multicollinearity using VIF.

---

## How to Run
1. Open the `regression_analysis.R` script in RStudio or any R IDE.
2. Install the required libraries:
   ```R
   install.packages(c("stargazer", "ggplot2", "car"))
