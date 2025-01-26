#   QUESTION 2 IMPORT LOAN DEFAULT DATA
#Load Libraries
library(stargazer)
library(corrplot)
library(ggplot2)
library(reshape2)
library(caTools)
library(car)

L <- read.csv(file = "D:/DEPAUL/QUARTER 5/BUSINESS ANALYTICS TOOLS - 2/ASSIGNMENT/ASSIGNMENT - 3/loan_default_dataset.csv", header = TRUE, sep = ',')
# Let's view the entire data set
View(L)




#Calculating the summary statistics for numerical variables
summary(L$Checking_Amount)
summary(L$Term)
summary(L$Credit_score)
summary(L$Amount)
summary(L$Saving_amount)
summary(L$Emp_duration)
summary(L$Age)
summary(L$No_of_credit_accounts)


#tabulating the Categorical Variables
table(L$Gender)
table(L$Marital_status)
table(L$Car_loan)
table(L$Personal_loan)
table(L$Home_loan)
table(L$Education_loan)
table(L$Emp_status)

L$emp <- ifelse(L$Emp_status == "employed",1,0)
#multiple regression using all variables

# Fit linear regression model using all variables
linear_model <- lm(Default ~ ., data = L)

# Summary of the linear regression model
summary(linear_model)
stargazer(linear_model, type = "text", title = "multiple regression using all variables to determine default rates")


#model with 3 star variables

linear_model2 <- lm(Default ~ Checking_amount+ Term+ Credit_score+ emp+ Saving_amount+ Age, data = L)

# Summary of the linear regression model
summary(linear_model2)
stargazer(linear_model2, type = "text", title = "Final Model")


#model without Employment status since it is showing no significance

#linear_model3 <- lm(Default ~ Checking_amount+ Term+ Credit_score+ Saving_amount+ Age, data = L)

# Summary of the linear regression model
#summary(linear_model3)
#stargazer(linear_model3, type = "text", title = "Final Model")


# CHECKING MULTICOLINEARITY


# Calculate the correlation matrix for all explanatory variables
correlation_matrix <- cor(linear_model2$model)

# Print the correlation matrix
print(correlation_matrix)

# Visualization of the correlation matrix

# Create a data frame for the lower triangular matrix
cor_data <- correlation_matrix 
print(cor_data)
# set upper triangle values to null and do not include diagonal as part of upper triangle
cor_data[upper.tri(cor_data, diag = FALSE)] <- NA 

# converting wide format to long format for better graph making
melted_corr <- melt(cor_data, na.rm = TRUE)
print(melted_corr)

# creation of heat map

# mentioning data source, x-axis, y-axis, fill in correlation values
ggplot(melted_corr, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  # label related settings
  geom_text(aes(label = round(value, 2)), color = "black", size = 3) +  
  scale_fill_gradient2(low = "purple", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), 
                       name = "Correlation") +
  theme_minimal() +
  # labelling title and axes
  labs(title = "Lower Triangular Correlation Heatmap", x = "", y = "") +
  
  # customize label text
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



# VIF  CALCULATION

vif_values <- vif(linear_model2)
vif_values

# visualization of VIF values

barplot(vif_values,
        main = "Variance Inflation Factor (VIF) Values",
        ylab = "VIF",
        xlab = "Explanatory Variables",
        col = "lightblue")

abline(h = 5, col = "red", lty = 2)



#TESTING MODEL FOR PROBABILITY IRREGULARITIES


# Scenario 1: Negative Checking Amount

predict(linear_model2, data.frame(Checking_amount = -1000,emp= 1, Term = 24, Credit_score = 600, Saving_amount = 5000, Age = 30))

# Scenario 2: High Credit Score
predict(linear_model2, data.frame(Checking_amount = 500, emp =1, Term = 20, Credit_score = 1100, Saving_amount = 3000, Age = 30))

# Scenario 3: Extreme Values
predict(linear_model2, data.frame(Checking_amount = 1500,emp=1, Term = 30, Credit_score = 350, Saving_amount = 4500, Age = 50))

# Scenario 4: Very Low Credit Score and High Term
predict(linear_model2, data.frame(Checking_amount = 200,emp= 0, Term = 30, Credit_score = 350, Saving_amount = 3000, Age = 25))

# Scenario 5: Very High Term and Low Savings
predict(linear_model2, data.frame(Checking_amount = 100,emp=0, Term = 35, Credit_score = 400, Saving_amount = 2000, Age = 28))

# Scenario 6: Low Age and High Checking Amount
predict(linear_model2, data.frame(Checking_amount = 1500,emp=0, Term = 18, Credit_score = 380, Saving_amount = 2500, Age = 18))





#QUESTION 3


#MULTIPLE LOGISTIC REGRESSION

# Fit the logistic regression model
logistic_model <- glm(Default ~ Checking_amount + Term + Credit_score + emp + Saving_amount + Age,data = L, family = binomial)

# Display the summary of the model
summary(logistic_model)
stargazer(logistic_model, type="text", "Multiple Logistic Regression for Loan Default")


#Remove any insignificant variables to arrive at your final logistic regression model. 

logistic_model2 <- glm(Default ~ Checking_amount + Term + Credit_score + Saving_amount + Age,data = L, family = binomial)

# Display the summary of the model
summary(logistic_model2)
stargazer(logistic_model2, type="text", "Final Multiple Logistic Regression for Loan Default")



#probability of a loan default for an individual with a 600 credit score vs. an otherwise similar individual but with an 800 credit score


predict(logistic_model2, data.frame(Checking_amount = 100,emp=0, Term = 35, Credit_score = 600, Saving_amount = 2000, Age = 28), type= "response")
predict(logistic_model2, data.frame(Checking_amount = 100,emp=0, Term = 35, Credit_score = 800, Saving_amount = 2000, Age = 28), type= "response")



predict(logistic_model2, data.frame(Checking_amount = 1500,emp=1, Term = 30, Credit_score = 600, Saving_amount = 4500, Age = 50), type= "response")
predict(logistic_model2, data.frame(Checking_amount = 1500,emp=1, Term = 30, Credit_score = 800, Saving_amount = 4500, Age = 50), type= "response")


predict(logistic_model2, data.frame(Checking_amount = -1000,emp= 1, Term = 24, Credit_score = 600, Saving_amount = 5000, Age = 30), type= "response")
predict(logistic_model2, data.frame(Checking_amount = -1000,emp= 1, Term = 24, Credit_score = 800, Saving_amount = 5000, Age = 30), type= "response")


predict(logistic_model2, data.frame(Checking_amount = 689,emp= 1, Term = 24, Credit_score = 600, Saving_amount = 3400, Age = 45), type= "response")
predict(logistic_model2, data.frame(Checking_amount = 689,emp= 1, Term = 24, Credit_score = 800, Saving_amount = 3400, Age = 45), type= "response")

summary(L$Saving_amount)




#QUESTION 4

#Splitting the data 70% to training data and 30% to testing data

set.seed(123)

sample_data <- sample.split(L, SplitRatio = 0.7)
training_data <- subset(L, sample_data == TRUE)
test_data <- subset(L, sample_data == FALSE)

#Logistic regression model using variables in logistic_model2

Training_data_model <- glm(Default ~ Checking_amount + Term + Credit_score + Saving_amount + Age,data = training_data, family = binomial)

# Display the summary of the model
summary(Training_data_model)
stargazer(Training_data_model, type="text", "Logistic Regression for Training data")

# Using the trained model predict the probabilities 
# for the individuals in the test data set
probabilities <- predict(Training_data_model, test_data, type ="response")
probabilities

# Apply decision criteria using 70% as the cutoff
# Store the decisions of the model in a result variable
results <- ifelse(probabilities > 0.7, 1 ,0)
results

# Tabulate the actual values and the results together. 
# This is called the Classification Table
classification_table <- table(test_data$Default, results)
classification_table

# Using the classification table we can calculate the accuracy rate as 
# (# of correct predictions) / (# of total predictions)
(classification_table[1,1] + classification_table[2,2]) / sum(classification_table)

