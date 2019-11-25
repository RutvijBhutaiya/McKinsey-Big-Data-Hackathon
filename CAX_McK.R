
## ************  McKinsey Big Data Hackathon  ************ ##


CAX_McK = read.csv('CAX_TrainingData_Mck.csv')

library(ggplot2)
library(rpivotTable)
library(ggcorrplot)
library(corrplot)
library(RColorBrewer)
library(Boruta)


## Data Summary

dim(CAX_McK)

summary(CAX_McK)

str(CAX_McK)

colSums(is.na(CAX_McK))

attach(CAX_McK)


## CREATED NEW FEATURES in Excel

## duration_speed and distance_driver_origin

## duration_speed = duration_km / duration_min

## distance_driver_origin = Ecludian distance on driver_latitude, 
##                          driver_longitude, origin_order_latitude, 
##                          origin_order_longitude

## EDA : Exploratery data Analysis

## Driver Respond Ratio

as.matrix(prop.table(table(driver_response)))

# [,1]
# 0 0.2597694
# 1 0.7402306

## Variables correlation analysis

## We decised to not to incluse, order_gk, driver_gk, offer_gk due to unique ids
## We also decided to not to include, Discrit variables - hour_key, weekday_key


ggcorrplot(cor(CAX_McK[, -c(1,2,3,4,5,14,13)]), method = 'circle',  type = 'lower', lab = TRUE)

corrplot(cor(CAX_McK[, -c(1,2,3,4,5,14,13)]), type = 'upper', order = 'hclust', 
         col = brewer.pal(n = 7, name = 'YlGnBu'))

## Feature Selection

attach(CAX_McK)

set.seed(123)

# boruta.train <- Boruta(driver_response ~ . , data=CAX_McK, doTrace = 2)

## Box Plot


