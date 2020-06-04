#Hierachial  clustering

#import the dataset
getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\3.clustering\\Hierarchical Clustering\\R")
dataset <- read.csv("Mall_Customers.csv")
View(dataset)
X <- dataset[4:5]

#using the dendrogram to find the optimal number of cluster
dendrogram = hclust(dist(X, method = 'euclidean'),method = 'ward.D')
plot(dendrogram,
     main =paste('Dendrogram'),
     xlab = 'Customer',
     ylab = 'Euclidean Distance')

#fitting the hierarchical clustering to the mall dataset

hc = hclust(dist(X, method = 'euclidean'),method = 'ward.D')
y_hc = cutree(hc, 5)

#visualization of clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         platchar = FALSE,
         span  = TRUE,
         main = paste('cluster of client'),
         xlab = "Annual Income",
         ylab  = "Spending score")
