trainy <- train['Count']
trainx <- train[-c(1,2,3)]
testy <- test['Count']
testx <- test[-c(1,2,3)]
trainx <- as.type(numeric)
trainy <- as.type(numeric)
testx <- as.type(numeric)
testy <- as.type(numeric)


trainx$weekday <- as.factor(trainx$weekday)
testx$weekday <- as.factor(testx$weekday)


library(BART)
model <- wbart(trainx, as.matrix(trainy), testx)
library(mltools)
pred = model$yhat.test.mean


trainpred = model$yhat.train.mean
train_mse = mse(trainpred, as.matrix(trainy))
test_mse = mse(pred, as.matrix(testy))

sort(model$varcount.mean)
pie(sort(model$varcount.mean))
hist(model$yhat.test[,28])
abline(v=338, col='blue')

train13y <- train13['Count']
train13x <- train13[-c(1,2,3)]
train13x <- as.type(numeric)
train13y <- as.type(numeric)
train14y <- train14['Count']
train14x <- train14[-c(1,2,3)]
train14x <- as.type(numeric)
train14y <- as.type(numeric)
train13x$weekday <- as.factor(train13x$weekday)
train14x$weekday <- as.factor(train14x$weekday)

trainx['year'] = 2015
train13x['year'] = 2013
train14x['year'] = 2014
testx['year'] = 2016
train_x = rbind(train13x, train14x, trainx)
train_y = rbind(train13y, train14y, trainy)
model <- wbart(train_x, as.matrix(train_y), testx)

