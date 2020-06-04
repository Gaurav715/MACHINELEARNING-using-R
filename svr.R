#SVR


#import the dataset
getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\support vector Reggresion\\R")
dataset <- read.csv("Position_Salaries.csv")
dataset = dataset[2:3]
View(dataset)

#fitting the SVR dataset
install.packages('e1071')
library(e1071)

regressor = svm(formula = Salary ~ .,
                data = dataset,
                type ='eps-regression')

#prediction

y_pred = predict(regressor ,data.frame(Level = 6.5))

#visualization

library(ggplot2)
ggplot()+
    geom_point(aes(x = dataset$Level, y = dataset$Salary ),
               colour = 'red')+
    geom_line(aes(x = dataset$Level , y= predict(regressor , newdata = dataset)),
              colour = 'Blue')+
    
    ggtitle('Truth OR bluff(svm)')+
    xlab('levels')+
    ylab('salary')