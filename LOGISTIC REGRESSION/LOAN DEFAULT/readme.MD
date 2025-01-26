# Logistic Regression Analysis for Loan Default Prediction

## Overview
This project focuses on predicting bank loan default probabilities using logistic regression techniques. The analysis involves building predictive models, addressing multicollinearity, and evaluating model performance. Additionally, the project highlights the limitations of linear regression for probability estimation and discusses ethical considerations in machine learning (ML) algorithms.

---

## Objectives
- Predict loan default probabilities using logistic regression.
- Examine multicollinearity among predictors.
- Evaluate the accuracy of logistic regression models on test data.
- Highlight limitations of linear regression in modeling probabilities.

---

## Dataset
### Loan Default Data
- **Observations**: 1,000 rows
- **Key Variables**:
  - `Checking_amount`: Checking account balance.
  - `Term`: Loan term duration.
  - `Credit_score`: Individual's credit score.
  - `Saving_amount`: Savings account balance.
  - `Age`: Age of the borrower.
  - `Default`: Binary variable indicating loan default.

---

## Methodology
1. **Regression Models**:
   - Built multiple linear and logistic regression models to predict loan defaults.
   - Removed insignificant predictors and addressed multicollinearity.
   - Compared models based on metrics like R² and Akaike Information Criterion (AIC).

2. **Model Refinement**:
   - Conducted feature selection to retain only statistically significant variables.
   - Used training and testing datasets to evaluate model performance.

3. **Classification and Performance**:
   - Created a classification table with a 70% cutoff for default predictions.
   - Evaluated the accuracy of the logistic regression model on test data.

4. **Ethical Considerations**:
   - Discussed biases in ML models used for justice system decisions.
   - Explored systemic issues in ML-driven business models (e.g., Amazon's delivery service).

---

## Results
- **Significant Predictors**:
  - Higher savings and credit scores reduce default probabilities.
  - Loan term and checking account balance positively impact default probabilities.
- **Logistic Regression Accuracy**:
  - Achieved **92% accuracy** on the testing dataset with a 70% cutoff probability.

---

## Tools and Libraries
- **Programming Language**: R
- **Key Libraries**:
  - `stargazer`: Exported regression results to Word.
  - `ggplot2`: Visualized data relationships.
  - `car`: Checked for multicollinearity using VIF.
  - `corrplot`: Created correlation heatmaps.

---

## How to Run
1. Open the `loan_default_analysis.R` script in RStudio.
2. Install required libraries:
   ```R
   install.packages(c("stargazer", "ggplot2", "car", "corrplot"))
