

CAX = read.csv('CAX_McK_Train_Clean1.csv')

attach(CAX)

library(xgboost)
library(magrittr)
library(dplyr)
library(Matrix)


## Convert FActors into Dummy vars

CAX = CAX[, -c(1)]
attach(CAX)

# Make Ratio of 30% and 70% for test and train dataset 

set.seed(1234)

ind = sample(2, nrow(CAX), replace = TRUE, prob = c(0.7,0.3))

train1 = CAX[ind == 1,]
test1 = CAX[ind == 2,]


### Create martix - to support XGBOOST

trainm = sparse.model.matrix(train1$driver_response ~ . -1, data = train1)

train1_lable = train1[,"driver_response"]

train1_matrix = xgb.DMatrix(data = as.matrix(trainm), label = train1_lable)


## For TEST

testm = sparse.model.matrix(test1$driver_response ~ . -1, data = test1)

test1_lable = test1[, "driver_response"]

test1_matrix = xgb.DMatrix(data = as.matrix(testm), label = test1_lable)


## PArameters

nc = length(unique(train1_lable))

xgb_par = list("objective" = "multi:softprob",
               "eval_metric" = "mlogloss",
               "num_class" = nc)

watchlist = list(train = train1_matrix, test = test1_matrix)

## xTream Gradient Boost Model

bst_model = xgb.train(params = xgb_par, data = train1_matrix, 
                      nrounds = 500,
                      watchlist = watchlist,
                      eta = 0.10,
                      max.depth = 6,
                      gamma = 0.1)
                      #subsample = 0.7)
                      #colsample_bytree =1,
                      #seed = 333)

## Train and TEst Erroe plot

bst_model

e = data.frame(bst_model$evaluation_log)
plot(e)
plot(e$iter, e$train_mlogloss, col = 'blue')
lines(e$iter, e$test_mlogloss, col = 'red')

min(e$test_mlogloss)


## Feature Imp

imp = xgb.importance(colnames(train1_matrix), model = bst_model)
print(imp)

xgb.plot.importance(imp)


## Prediction 

p = predict(bst_model, newdata = test1_matrix)

pred = matrix(p, nrow = nc, ncol = length(p)/nc) %>%   # <-- Here, we have twice of length on 'p'
  t() %>%
  data.frame() %>%
  mutate(lable = test1_lable, max_prob = max.col(. , 'last')-1) # <-- (-1) gives result in 0 and 1 instead of 1
  
head(pred)

#table(predicted  = pred$max_prob, actual = pred$lable)

library(caret)
library(pROC)

confusionMatrix(as.factor(pred$max_prob), as.factor(pred$lable))

roc(pred$max_prob, pred$lable, plot = TRUE, main = 'ROC Curve', col = 'darkseagreen')

