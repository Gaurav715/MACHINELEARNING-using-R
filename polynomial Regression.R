#import the dataset
getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\Polynomial Regression\\R")
data <- read.csv("Position_Salaries.csv")
data = data[2:3]
View(data)

#fitting of linear regression to the dataset 
lin_reg = lm(formula = Salary ~ .,
             d = data)


#fitting polynomial regression to the dataset
data$level2 = data$Level^2
data$level3 = data$Level^3
data$level4 = data$Level^4
poly_reg = lm(formula = Salary ~ .,
              d= data)


#visualizing the linear result
library(ggplot2)
ggplot()+
    geom_point(aes(x = data$Level, y = data$Salary ),
               colour = 'red')+
    geom_line(aes(x = data$Level , y= predict(lin_reg , newdata = data)),
                  colour = 'Blue')+
                  
    ggtitle('Truth OR bluff(Linear Regression)')+
    xlab('levels')+
    ylab('salary')


#visualizing the polynomial result

ggplot()+
    geom_point(aes(x = data$Level, y = data$Salary ),
               colour = 'red')+
    geom_line(aes(x = data$Level , y= predict(poly_reg , newdata = data)),
              colour = 'Blue')+
    
    ggtitle('Truth OR bluff(Linear Regression)')+
    xlab('levels')+
    ylab('salary')



#predict the result using linear Regression model
y_pred = predict(lin_reg , data.frame(Level = 6.5) )


#predict the result using Polynomial Regression model
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      level2 = 6.5^2,
                                      level3 = 6.5^3,
                                      level4 = 6.5^4))







