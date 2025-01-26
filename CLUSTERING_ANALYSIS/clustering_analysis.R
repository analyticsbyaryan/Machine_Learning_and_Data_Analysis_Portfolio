

# Load data into a dataframe using read.csv()
d <- read.csv(file = "D:/DEPAUL/QUARTER 5/BUSINESS ANALYTICS TOOLS - 2/WEEK - 7/BUSINESS ANALYTICS TOOLS II - 10222024 - 733 PM/chicago_cca.csv", header = TRUE, sep = ',')
View(d)
install.packages("ggfortify")
library("ggplot2")
library("dplyr")
library("ggfortify")

summary(d$Unemp)
summary(d$Income)

#Setting the seed
set.seed(23)

# Figuring out cluster size using within sum of squares - the Elbow method
tot_withinss <- vector(mode = "character", length = 15)

# Calculate and save the within sum of squares for cluster sizes 1 through 15
for (i in 1:15) {
  cluster_result <- kmeans(d[, 2:5], centers = i)
  tot_withinss[i] <- cluster_result$tot.withinss
}

# Plot withinss vs. # of clusters
plot(1:15, tot_withinss, type = "b", pch = 19,
     xlab = "Number of Clusters",
     ylab = "Within Sum of Squares (WCSS)",
     main = "Elbow Method for Choosing Number of Clusters")

kmean <- kmeans(d[, 2:5], 3)
kmean$centers

kmean$cluster
kmean

autoplot(kmean, d, frame = TRUE)

#clustering with only umemployment and income
kmean <- kmeans(d[, 4:5], 3)
kmean$centers

kmean$cluster
kmean

autoplot(kmean, d[, 4:5], frame = TRUE)

# Plot clusters
ggplot(d, aes(x = Unemp, y = Income, color = kmean$cluster )) +
  geom_point() +scale_color_gradient(low = "blue", high = "red")
  labs(title = "K-means Clustering of Custom Dataset",
       subtitle = "Clusters based on Unemployment and Income",
       x = "Unemployment Rate",
       y = "Income",
       color = "Cluster")