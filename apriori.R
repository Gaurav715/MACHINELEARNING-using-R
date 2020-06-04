#apriori 

getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\4.Association Rule Learning\\apriori\\R")
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


#training apriori on the dataset
rules = apriori(data = dataset , parameter = list(support = 0.004, confidence = 0.2 ))


#visualizing the results
inspect(sort(rules, by= 'lift') [1:10])



