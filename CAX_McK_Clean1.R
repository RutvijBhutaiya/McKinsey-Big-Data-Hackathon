
## ************  McKinsey Big Data Hackathon  ************ ##


CAX_McK = read.csv('CAX_TrainingData_Mck.csv')

library(ggplot2)
library(rpivotTable)
library(ggcorrplot)
library(corrplot)
library(RColorBrewer)

library(outliers)


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

attach(CAX_McK)

## *****  EDA : Exploratery data Analysis  ***** ##

## Driver Respond Ratio

as.matrix(prop.table(table(driver_response)))

# [,1]
# 0 0.2597694
# 1 0.7402306

str(CAX_McK)

## Categorical vars :  2,3,4,5,13,14, 16 <- Target
## Continious Vars : 6,7,8,9 <- Location, 10,11,12, 15




## Uni-variant Analysis

## Mean Befor Outlier Adjustment

summary(CAX_McK[, c(10,11,15)])

## ## Outliers Detection - Continious Vars Box Plot

par(mfrow = c(2,2))

boxplot(distance_km, main = 'Distance in KM', col = 'darkolivegreen2')
boxplot(duration_min, main = 'Duration in Min', col = 'darkorchid2')
boxplot(duration_speed, main = 'Speed in KM/Min', col = 'coral')
boxplot(distance_driver_origin, main = 'Distance Order Pickup and Driver', col = 'cornflowerblue')


## Outliers Remove with 97% percentile


## Remove -1 outliers 

CAX_McK = CAX_McK[which(duration_min >= 0 & 
                          distance_km >= 0 &
                          duration_speed >= 0 &
                           driver_latitude >= 0.1 &
                          driver_longitude >= 0.1 &
                          origin_order_latitude >= 0 &
                          origin_order_longitude >= 0),]

attach(CAX_McK)

## At 95% quantile - run one more Outlier test

quantile(distance_driver_origin, 0.95)
                          
quantile(duration_min, 0.95) 

quantile(distance_km, 0.95)



CAX_McK = CAX_McK[which(distance_driver_origin <= 0.03919 & 
                    duration_min <= 57.667 &
                    distance_km <= 53.406), ]

## Mean After Outlier Adjustment

summary(CAX_McK[, c(10,11,15)])



## Bi-Variant Analysis

## Continious Variables - correlation analysis 

## We decised to not to incluse, order_gk, driver_gk, offer_gk due to unique ids
## We also decided to not to include, Discrit variables - hour_key, weekday_key


ggcorrplot(cor(CAX_McK[, c(6,7,8,9,10,11,12,15,16)]), method = 'circle',  type = 'lower', lab = TRUE)

corrplot(cor(CAX_McK[, c(6,7,8,9,10,11,12,15,16)]), type = 'upper', order = 'hclust', 
         col = brewer.pal(n = 7, name = 'YlGnBu'))

## Remove High Correlatated features - Multicollinearity - duration_km and distance_km
## Alos, Remove, Origin_Order : latitude and longitude (High corr)
## We decided to keep duration_speed as it is created from km and min variables

CAX_McK = CAX_McK[ -c(10,11,8,9)]


## categorical variables

## Two Way Table 

table(as.factor(driver_response), as.factor(weekday_key))

as.matrix(prop.table(table(as.factor(driver_response), as.factor(weekday_key))))

table(as.factor(driver_response), as.factor(hour_key))

## as.matrix(prop.table(table(as.factor(driver_response), as.factor(hour_key))))

table(as.factor(driver_response), as.factor(offer_class_group))

## as.matrix(prop.table(table(as.factor(driver_response), as.factor(offer_class_group))))

table(as.factor(driver_response), as.factor(ride_type_desc))

## as.matrix(prop.table(table(as.factor(driver_response), as.factor(ride_type_desc))))


## Chi-Square / z-test / ANOVA

## For Categorical Variables

chisq.test(as.factor(offer_gk), as.factor(driver_response)) ## NOT SIGNIFICANT

chisq.test(as.factor(weekday_key), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(hour_key), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(driver_gk), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(order_gk), as.factor(driver_response)) ## NOT SIGNIFICANT

chisq.test(as.factor(offer_class_group), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(ride_type_desc), as.factor(driver_response)) ## SIGNIFICANT


## For Continious Variables

t.test(distance_km, driver_response) ## SIGNIFICANT

t.test(distance_driver_origin, driver_response) ## SIGNIFICANT

t.test(duration_min, driver_response) ## SIGNIFICANT

t.test(duration_speed, driver_response) ## SIGNIFICANT


## Remove NOT SIGNIFICANT Features from the dataset

CAX_McK = CAX_McK[, -c(1,5)]


## Normalization ()

## Histogram

par(mfrow = c(1,2)) 

hist(duration_speed, main = 'Speed in KM/Min', col = 'coral')
hist(distance_driver_origin, main = 'Distance Order Pickup and Driver', col = 'cornflowerblue')

## Boxcox Lambda Test

library(moments)
library(forecast)

# duration_speed

BoxCox.lambda(CAX_McK$duration_speed)

CAX_McK$duration_speed = sqrt(CAX_McK$duration_speed)

#CAX_McK$duration_speed = log(CAX_McK$duration_speed)


# distance_driver_origin

BoxCox.lambda(CAX_McK$distance_driver_origin)

CAX_McK$distance_driver_origin = log(CAX_McK$distance_driver_origin)
CAX_McK$distance_driver_origin = (CAX_McK$distance_driver_origin)^2
CAX_McK$distance_driver_origin = 1 / CAX_McK$distance_driver_origin

write.csv(CAX_McK, 'CAX_McK_Train_Clean1.csv')





