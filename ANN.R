#Artificial_neural_network
getwd()
setwd("C:\\Users\\gaura\\Desktop\\MachineLearning\\7.Deep_Learning\\Artificial_neural_network\\R")
dataset <- read.csv("Churn_Modelling.csv")
dataset=dataset[4:14] #preprocessing 1st steps
View(dataset)


#encoding the categorical variable as factors
dataset$Geography = as.numeric(factor(dataset$Geography,
                                      levels = c('France','Spain','Germany'),
                                      labels = c(1,2,3)))

dataset$Gender = as.numeric(factor(dataset$Gender,
                                      levels = c('Female','Male'),
                                      labels = c(1,2)))



#scaling of feature

training_set[-11] = scale(training_set[-11])
test_set[-11] = scale(test_set[-11])


#splitting test and train

#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Exited, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)




#fitting the ANN
install.packages('h2o')
library(h2o)
h2o.init(nthreads = -1) #strongly recommended to take -1
clf = h2o.deeplearning(y = 'Exited', 
                       training_frame = as.h2o(training_set),
                       activation = 'Rectifier',
                       hidden = c(6,6),
                       epochs = 100,
                       train_samples_per_iteration = -2)



#predict the test set resolver
prob_pred = h2o.predict(clf, newdata = as.h2o(test_set[-11]))
y_pred = (prob_pred >0.5)
y_pred= as.vector(y_pred)


#confusion matrix
cm = table(test_set[,11], y_pred)

h2o.shutdown()
