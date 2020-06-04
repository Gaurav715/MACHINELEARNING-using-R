getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\simpleLinearReggresion\\R")
data <- read.csv("Salary_Data.csv")
View(data)

#test and train split
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data$Salary, SplitRatio = 2/3)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)


#simple regression

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#predict the test set result 
y_pred = predict(regressor , newdata = test_set)

# visualazing the trainning set result 

ggplot() + 
    geom_point(aes(x = training_set$YearsExperience , 
                   y = training_set$Salary),
               color = 'red')+
    geom_line(aes(x = training_set$YearsExperience , 
                  y = predict(regressor ,
                              newdata = training_set)),
              color = 'blue')+
    ggtitle('Salary vs Exp')+
    xlab('Year of Exp')+
    ylab('Salary')


#visualization of test set 
ggplot() + 
    geom_point(aes(x = test_set$YearsExperience , 
                   y = test_set$Salary),
               color = 'red')+
    geom_line(aes(x = training_set$YearsExperience , 
                  y = predict(regressor ,
                              newdata = training_set)),
              color = 'blue')+
    ggtitle('Salary vs Exp(test set)')+
    xlab('Year of Exp')+
    ylab('Salary')
