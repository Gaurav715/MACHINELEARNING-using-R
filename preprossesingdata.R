getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\Preprocessingofdata\\preprocessing using R")
data <- read.csv("Data.csv")
View(data)

#encoding the dependent variable
data$Age = ifelse(is.na(data$Age),ave(data$Age, 
                                      FUN = function(x) mean(x,na.rm =TRUE )),
                                      data$Age)

data$Salary = ifelse(is.na(data$Salary),ave(data$Age, 
                                      FUN = function(x) mean(x,na.rm =TRUE )),
                  data$Salary)


#encoding the independent variable
data$Country =  factor(data$Country, 
                      levels = c('France' ,'Spain' ,'Germany'),
                      labels = c(1,2,3))


data$Purchased =  factor(data$Purchased, 
                       levels = c('No' ,'Yes'),
                       labels = c(0,1))


#splitting test and train

install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

#scaling of feature

training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])

















