
train<-read.csv("pml-training.csv",header = TRUE, sep = ",",na.strings = c("NA", ""))
dim(train)
head(train,n=3)
tail(train,n=3)
summary(train$classe)
train1 <- train[, -c(1:7)]
dim(train1)

na_count <- sapply(train1, function(x) {sum(is.na(x))})
table(na_count)

naRatio <- function(x) {
  n <- length(x)
  nas <- sum(is.na(x))
  return(nas/n)
}

variable_naRatio<- sapply(train1, naRatio)
train2 <- train1[, variable_naRatio < 0.1]
dim(train2)

inTrain <- createDataPartition(y=train2$classe, p=0.7, list=FALSE)
training <- train2[inTrain,]
testing <- train2[-inTrain,]
dim(training)

set.seed(1000)
inTrainSub <-  createDataPartition(y=training$classe, p=0.01, list=FALSE)
trainingSub <- training[inTrainSub,]
dim(trainingSub)
modFit<-train(classe~., method="rf", data=trainingSub, prox=TRUE)
varImpObj <- varImp(modFit2)
plot(varImpObj, main = "Variable Importance of Top 20", top = 20)

trainingRest<- training[-inTrainSub,]
impThresh <- quantile(varImpObj$importance[, 1], 0.75)
impfilter <- varImpObj$importance[, 1] >= impThresh
finalTraingData <- trainingRest[, impfilter]
rfModel <- train(classe ~ ., data = finalTraingData, method = "rf")

pred<- predict(modFit2,testing)
confusionMatrix(pred,testing$classe)

test<-read.csv("pml-testing.csv",header = TRUE, sep = ",",na.strings = c("NA", ""))
dim(test)
test1 <- test[, -c(1:7)]
dim(test1)

na_count1<- sapply(test1, function(x) {sum(is.na(x))})
table(na_count1)

variable_naRatio1<- sapply(test1, naRatio)
test2 <- test1[, variable_naRatio1 < 0.1]
dim(test2)

pred<- predict(modFit2,test2)
pred
confusionMatrix(pred,test2$problem_id)

