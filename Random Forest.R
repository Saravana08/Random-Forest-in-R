library(randomForest)
data1=read.csv('heart.csv')
head(data1)

str(data1)

summary(data1)

set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]

summary(TrainSet)
summary(ValidSet)

model1 <- randomForest(target ~ ., data = TrainSet, importance = TRUE)
model1

model2 <- randomForest(target ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)
model2

predTrain <- predict(model2, ValidSet, type = "class")
mean(predTrain == ValidSet$target)

importance(model1)        

varImpPlot(model2)        


