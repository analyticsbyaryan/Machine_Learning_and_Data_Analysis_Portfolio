---
  title: "Customer_churn_analysis"
output: html_notebook
---
  

library(caTools)
library(partykit)
library(dplyr)
library(magrittr)
library(rpart)
library(rattle)
library(rpart.plot)

# Load raw data into a dataframe using read.csv()
d <- read.csv(file = "D:/DEPAUL/QUARTER 5/BUSINESS ANALYTICS TOOLS - 2/ASSIGNMENT/ASSIGNMENT - 4/customer_churn_dataset.csv", header = TRUE, sep = ',')

# Let's view the raw data set
View(d)

# Tabulating the outcome variable churn

table(d$Churn)

# Calculate the percentage of customers who have switched vendors
churn_percentage <- sum(d$Churn == "Yes") / nrow(d) * 100
print(paste("Percentage of customers who have switched vendors:", round(churn_percentage, 2), "%"))


# Set the seed
set.seed(123)

# Split the sample to 70% training 30% test data

sample <- sample.split(d$Churn, SplitRatio = 0.70)

# Create the training and testing sets
train_data <- subset(d, sample == TRUE)
test_data <- subset(d, sample == FALSE)
length(test_data)
# View the number of observations in each set
print(paste("Number of observations in training set:", nrow(train_data)))
print(paste("Number of observations in testing set:", nrow(test_data)))







# Estimate a full decision tree model using the training data set
tree_model <- rpart(Churn ~ ., data = train_data,parms = list(split = 'information'), method = "class", cp = -1)

# Print the tree model
print(tree_model)

# Get the number of splits in the full decision tree
summary(tree_model)
rpart.plot(tree_model, main = "Full Decision Tree")


# Estimate a pruned decision tree model
tree_model2 <- rpart(Churn ~ ., data = d,parms = list(split = 'information'), 
                    control = rpart.control(maxdepth = 3, 
                                            minsplit = 2,
                                            minbucket = 2))



# Plot the pruned decision tree
rpart.plot(tree_model2, main = "Pruned Decision Tree")

#rpart.plot(tree_model2)
# Get the height of the estimated tree
tree_height <- tree_model$frame$ncompete
print(paste("The height of the estimated tree is:", max(tree_height)))
#tree_height

# Get the highest ranking feature for the churn decision
highest_ranking_feature <- tree_model$frame$var[1]
print(paste("The highest ranking feature for the churn decision is:", highest_ranking_feature))

# Get the variables used in the tree construction
printcp(tree_model)







#question 3


# Predict the churn outcomes for the customers in the testing data set
predictions <- predict(tree_model2, test_data, type = "class")
predictions
# Display the confusion matrix/classification table for the pruned model
classification_table <- table(test_data$Churn, predictions)
classification_table

# Calculate the accuracy rate for the pruned model
accuracy_rate <- sum(diag(classification_table)) / sum(classification_table)
print(paste("The accuracy rate for the pruned model is:", round(accuracy_rate, 2)))

# Predict the churn probabilities for the customers in the testing data set
probabilities <- predict(tree_model2, test_data, type = "prob")
head(probabilities)
# Identify the customers with a greater than 70% probability of churning
  target_group <- which(probabilities[, 2] > 0.7)
  print(paste("The number of customers in the target group is:", length(target_group)))


# QUESTION 4

#Estimating a random forest model
  

  library(randomForest) 
rf_model <- randomForest(as.factor(Churn) ~ ., data = na.omit(train_data), 
                         ntree = 5000,
                         mtry = 3, 
                         importance = TRUE)
  
# Order of important values



randomForest::varImpPlot(rf_model, 
                         sort=TRUE, 
                         main="Variable Importance Plot")

#Predict churn outcomes

predictions2 <- predict(rf_model, na.omit(test_data))
head(predictions2)


#create a confusion matrix
confusion_matrix <- table(na.omit(test_data$Churn), predictions2)
print(confusion_matrix)

#Accuracy rate
accuracy_rate2 <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("The accuracy rate for the random forest model is:", round(accuracy_rate2, 2)))


#predicting churn probabilities
probabilities2 <- predict(rf_model, na.omit(test_data), type = "prob")
head(probabilities2)

#identifying the target group 
target_group2 <- which(probabilities2[, 2] > 0.7)
print(paste("The number of customers in the target group is:", length(target_group2)))


# Assuming you have the target group size from the pruned decision tree model stored in 'pruned_target_size'
if (length(target_group2) > length(target_group)) {
  print("The random forest model allocates more customers to the high risk group.")
} else if (length(target_group2) < length(target_group)) {
  print("The random forest model allocates less customers to the high risk group.")
} else {
  print("The random forest model allocates the same number of customers to the high risk group as the pruned decision tree model.")
}

length(target_group)
length(target_group2)














