getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\Multiple Linear Regression\\R")
data <- read.csv("50_Startups.csv")
View(data)


#encoding the independent variable
data$State =  factor(data$State, 
                       levels = c('New York' ,'California' ,'Florida'),
                       labels = c(1,2,3))

#test and train split
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data$Profit, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)


#fitting multiple regression
#dot is for writting formulae instead whole thing

regressor = lm(formula = Profit ~ .,
               d = training_set)

#predicting the test set results 

y_pred = predict(regressor,newdata = test_set)



#Building the optimal model using backward elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration +
                   Marketing.Spend + State,
               d = data)

summary(regressor)


#Building the optimal model using backward elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration +
                   Marketing.Spend ,
               d = data)

summary(regressor)



#Building the optimal model using backward elimination
regressor = lm(formula = Profit ~ R.D.Spend +
                   Marketing.Spend ,
               d = data)

summary(regressor)


#Building the optimal model using backward elimination
#since after removing marketing spend the model become worst so
#we dont have to remove that 
regressor = lm(formula = Profit ~ R.D.Spend  ,
               d = data)


#automatic implementation of backward elimination
backwardElimination <- function(x, sl) {
    numVars = length(x)
    for (i in c(1:numVars)){
        regressor = lm(formula = Profit ~ ., data = x)
        maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
        if (maxVar > sl){
            j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
            x = x[, -j]
        }
        numVars = numVars - 1
    }
    return(summary(regressor))
}

SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)

summary(regressor)









