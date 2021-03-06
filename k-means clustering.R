#k-means clustering

#import the dataset
getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\3.clustering\\kmeans clustering\\R")
dataset <- read.csv("Mall_Customers.csv")
View(dataset)
X <- dataset[4:5]

#using elbow methods to find the optimal number of clusters
set.seed(6)
wcss <- vector()
for (i in 1:10)wcss[i] <- sum(kmeans(X, i)$withinss)
plot(1:10, wcss, type = "b", main = paste('clusters of client'), xlab = 'Number of clusters', ylabs='wcss')


#applying the k-means to the mall dataset
set.seed(29)
kmeans <- kmeans(X, 5 ,iter.max = 300 ,nstart = 10)

#visualing the clusters 
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         platchar = FALSE,
         span  = TRUE,
        main = paste('cluster of client'),
        xlab = "Annual Income",
        ylab  = "Spending score")