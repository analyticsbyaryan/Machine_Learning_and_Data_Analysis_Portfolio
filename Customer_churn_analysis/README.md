# Customer Churn Analysis

## Overview
This project focuses on analyzing customer churn using decision tree and random forest models. The objective is to identify high-risk customers who are likely to churn, allowing the company to target them with retention strategies.

---

## Objectives
1. Predict customer churn using decision tree and random forest algorithms.
2. Compare the accuracy of the pruned decision tree and random forest models.
3. Identify high-risk customers with a churn probability greater than 70%.
4. Determine the most important features contributing to churn.

---

## Dataset
- **Observations**: 1,000 rows
- **Variables**: 14 features, including:
  - `Churn`: Binary variable indicating whether a customer churned (dependent variable).
  - `Total_Charges`: Total amount charged to the customer.
  - `Monthly_Charges`: Monthly charges for services.
  - `Agreement_Period`: Length of the service agreement.
  - `Technical_Support`: Availability of technical support.
  - And other categorical and numerical variables.

---

## Methodology
### 1. Decision Tree Analysis
- **Model**:
  - Built a full decision tree with all features.
  - Pruned the tree to improve interpretability by setting:
    - `maxdepth = 3`
    - `minsplit = 2`
    - `minbucket = 2`
- **Evaluation**:
  - Confusion matrix and accuracy rate calculated on the testing data.
  - Accuracy of pruned decision tree: **79%**.
- **High-Risk Group**:
  - Identified customers with a churn probability > 70% (24 customers).

### 2. Random Forest Analysis
- **Model**:
  - Built a random forest model with:
    - `ntree = 5000` (5,000 trees).
    - `mtry = 3` (3 features randomized per tree).
- **Feature Importance**:
  - Top features contributing to churn (based on Gini index):
    1. `Monthly_Charges`
    2. `Total_Charges`
    3. `Term`
    4. `Agreement_Period`
- **Evaluation**:
  - Confusion matrix and accuracy rate calculated on the testing data.
  - Accuracy of random forest model: **82%**.
- **High-Risk Group**:
  - Identified customers with a churn probability > 70% (29 customers).

---

## Results
- **Model Comparison**:
  - The random forest model outperformed the pruned decision tree with an accuracy of **82%** compared to **79%**.
  - The random forest model identified **29 high-risk customers**, while the pruned decision tree identified **24**.
- **Insights**:
  - `Total_Charges`, `Monthly_Charges`, and `Agreement_Period` are the most important features in predicting churn.
  - Advanced models like random forest provide better accuracy but may sacrifice interpretability.

---

## Tools and Libraries
- **Programming Language**: R
- **Key Libraries**:
  - `rpart`: Built and pruned decision tree models.
  - `randomForest`: Built random forest models.
  - `caTools`: Split data into training and testing sets.
  - `rpart.plot`: Visualized the decision tree.

---

## How to Run
1. Open the `customer_churn_analysis.R` script in RStudio.
2. Install required libraries:
   ```R
   install.packages(c("rpart", "randomForest", "caTools", "rpart.plot"))
##Limitations
The pruned decision tree sacrifices accuracy for interpretability.
Random forest models are more accurate but harder to interpret due to their complexity.
The dataset is specific to a single company and may not generalize to other industries.


##Future Work
Explore gradient boosting models (e.g., XGBoost) for improved accuracy.
Perform feature engineering to create new predictors based on existing data.
Implement a cost-sensitive analysis to account for the financial impact of false positives and false negatives.
