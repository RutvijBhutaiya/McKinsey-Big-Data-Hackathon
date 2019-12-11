
## ********** MODEL BUILDING ********** ##

CAX = read.csv('CAX_McK_Train_Clean1.csv')

attach(CAX)

library(caret)
library(SDMTools)
library(pROC)

## Convert FActors into Dummy vars

offer_class = model.matrix( ~ offer_class_group - 1, data = CAX)
CAX = data.frame(CAX, offer_class)

ride_type = model.matrix( ~ ride_type_desc - 1, data = CAX)
CAX = data.frame(CAX, ride_type)


CAX = CAX[, -c(1,8,9)]
attach(CAX)


# Make Ratio of 30% and 70% for test and train dataset 


ind = sample(2, nrow(CAX), replace = TRUE, prob = c(0.7,0.3))

train1 = CAX[ind == 1,]
test1 = CAX[ind == 2,]

test22 = test1[, -c(8)]  ## Remove Targer Var for Test

## MOdel Building

## Build Logit Model

CAX_logit = glm(train1$driver_response ~ . , data = train1, family = binomial())

summary(CAX_logit)

train1 = train1[, -c(1,3,7,12,14,15,16,17,18,19,20)]


## Prediction Test

test22$predict = predict.glm(CAX_logit, test22, type = 'response')

test22$predict_class = round(test22$predict)


## Perfirmance Measurement


confusionMatrix(as.factor(test1$driver_response), as.factor(test22$predict_class))

roc(test1$driver_response, test22$predict, plot = TRUE, main = 'ROC Curve', col = 'darkseagreen')


