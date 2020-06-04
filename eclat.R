#elcat

getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\4.Association Rule Learning\\eclat\\R")
dataset <- read.csv("Market_Basket_Optimisation.csv", header = FALSE)
dataset

#data preprocessing
install.packages('arules')
library(arules)
dataset <- read.csv("Market_Basket_Optimisation.csv", header = FALSE)
dataset <- read.transactions('Market_Basket_Optimisation.csv' ,sep= ',', rm.duplicates= TRUE)
summary(dataset)
#a density of 0.03288973  means this is non zero values in the dataset

itemFrequencyPlot(dataset,topN = 10)


#training eclat on the dataset
rules = eclat(data = dataset , parameter = list(support = 0.004, minlen = 2 ))


#visualizing the results
inspect(sort(rules, by= 'support') [1:10])



