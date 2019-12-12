# McKinsey Big Data Hackathon - CAX

### Crowd AnalytiX (CAX) - [McKinsey Big Data Hackathon](https://www.crowdanalytix.com/contests/mckinsey-big-data-hackathon) to predict the probability of an offer being accepted by a certain driver.

<br>

<p align="center"><img width=100% src=https://user-images.githubusercontent.com/44467789/69357126-94e17a80-0caa-11ea-9a02-84e6d2db9e1c.jpg> 
                                                              Source: AI News  
  
<br>  
<br>

## Table of Content

- [Objective](#objective)
- [Approach](#approach)
- [Study Dataset Creation](#study-dataset-creation)
- [Feature Analysis](#feature-analysis)
- [Exploratory Data Analysis](#exploratory-data-analysis)
-

<br>

## Objective 

The objective of this contest is to predict the probability of an offer being accepted by a certain driver.

<br>

## Approach 
- Study Dataset Creation 
- Raw data analysis and Feature Analysis
- Multivariate analysis - Using Tableau
- Exploratory Data Analysis - Data Cleaning 
- Apply Supervised Machine Learning Models on the Dataste
- Compare Results for diffrent datasets - choose the best fit
- Conclusion


<br>

<p align="right"><img width=37% src=https://user-images.githubusercontent.com/44467789/69726134-dd36e780-1145-11ea-9941-b84286575ca1.jpg>
  
<br>


## Study Dataset Creation

In this type of data preparation, we created new features distance_speed and distance_driver_origin. 

Where, duration_speed = duration_km / duration_min and 
distance_driver_origin = Ecludian distance on driver_latitude, driver_longitude,origin_order_latitude, origin_order_longitude. 

We also checked for outliers, missing values and completed ExploratoryData Analysis for the original dataset. The R code is written in -  [CAX_McK_Clean1.R](https://github.com/RutvijBhutaiya/McKinsey-Big-Data-Hackathon/blob/master/CAX_McK_Clean1.R) file. And we store the data in [CAX_Mck_Train_Clean1.csv] file. 

We build Machine Learning models and evaluated model performance. 

<br>

## Feature Analysis

For Feature analysis we decided to do multivariant analysis in Tableau. Tableau is powerful tool to analysis data in visual forms. As out target feature is driver_responce, our analysis includes particular variables the most. 

#### Unique Driver Code – Driver Response to the Offer

<p align="center"><img width=60% src=https://user-images.githubusercontent.com/44467789/70368722-82835580-18d4-11ea-904e-85d851ef88b1.png>
  
In the above-mentioned chart as we can see 1421 driver code got the maximum offers, however, driver accepted offer is only 90. Similarly, 3371 driver code, got around 500 offers, but driver accepted offer was 382. Hence, this driver did maximum business by accepting the offers. 

This patter is also shown in following maps,

<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70368727-a2b31480-18d4-11ea-9d7c-3ab659679aea.png>
  
As we can see in the map, based on the longitude and latitude the data is from the city Moscow, Russia. As we can see in the map, near to Moskva River, drivers getting more offers and accepting offers are also high compare to outskirts of the main city. Observant points, driver ID with 3371, 3665 and 6580 as shown in the map got good count on offer acceptance.


<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70368752-e86fdd00-18d4-11ea-9348-157a1dd26b09.png>

Hence, we can say that in the centre of the city drivers are able to get more acceptance due to short distance. 

As, we can see in the following chart Red market cluster are in the drivers in the centre of the city, and size of the circle shown average distance in km. However, as we can see in the blue clusters the distance outside the city rides are longer as size of the circles are bigger. 

<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70368787-16edb800-18d5-11ea-8a5f-62c17e77da3c.png>

This, normally happens in the city, where in the centre of the city due to short distance, drivers get available earlier and hence are also available to accept the next nearest ride. 

<br>

#### Day of Week - % Response (Accept) by Drivers with respect to Total Counts for the Day

Here, 0 – is Sunday and ascending weekdays 6 is Saturday. 
As we can see in the flowing bar chart Driver’s acceptance ratio is lower on Sunday and Friday, which is 70% and 71.1% out of all offers receiver by the drivers on the particular weekday. 

<p align="center"><img width=75% src=https://user-images.githubusercontent.com/44467789/70368808-7ea40300-18d5-11ea-932c-52a17a010ccc.png>
  
However, the best acceptance rate we can see is for Wednesday. And Thursday. 

Low acceptance ratios on Monday, Friday and Saturday, also means the availability of the drivers? Dose these days we observe overcrowd of passengers? However, we can’ totally deny that drivers were sitting ideal and not accepting the offers on Monday or Saturday. However, for Sunday the case could be different as it is a only week holiday. 

<br>

#### Hour of Week - % Response (Accept) by Drivers with respect to Total Counts for an Hour

Similarly, as we observer the bar chat for a week, we have also observer patterns for an hour. 

As sown in the following bar chart, Hight of the bar lines are the total counts response of the drivers and Green share indicated that acceptance rate of the driver. 

<p align="center"><img width=95% src=https://user-images.githubusercontent.com/44467789/70368831-d6426e80-18d5-11ea-8c6b-0cdbd50d81a7.png>
  
Hence, as we can see in the bar chart driver’s acceptance rate is high from 8 am in morning till 3 pm in the afternoon. 

However, the offer count is highest between evening 7 pm to 9-9.30 pm I at night. But mat be due to again availability of the drivers, more than 25% of the offers are not accepted. 

This is the time frame, where company need to work to turn bars into the green shade. 

<br>

#### Offer Class – With Respect Avg. Distance and Driver Response (Accept) To Overall size of the Offer Class

As we can see in the following bar chart, passengers prefer to book XL category car for long distance, and hence the average distance for the class group XL is the maximum, with around 20 km. 

<p align="center"><img width=97% src=https://user-images.githubusercontent.com/44467789/70368866-42bd6d80-18d6-11ea-9d98-a3876e4eee6c.png>
  
We have also observed that, driver’s response for accepting the ride is high for VIP+ and VIP category. However, distance in km are less for VIP+ class, mainly due to premium charges. 

On the other side, Economy and Standard class category group of drivers are one of the least groups for accepting the offer from the passengers with respect to both the class shares highest market share on Pie chart. Again, this might be mainly because of high rush in particular class groups due to low fairs and hence, drivers are not available to accept the incoming offer. 

#### Avg. Speed During Week based on Hour Key

Speed is a feature we created based on the distance and duration time. In the following multivariant analysis we took average speed during the hour and checked which day in a week has low and high traffic. We assumed low speed means high traffic. 

<p align="center"><img width=99% src=https://user-images.githubusercontent.com/44467789/70368880-857f4580-18d6-11ea-9eaf-f9f070119665.png>
  
Based on the chart, in the earlier hours of the day avg. speed is above average and as business hours begins speed decreases below average line. However, for the Sunday as we can see – mentioned in Orange colour – speed is above average. That indicates, due to less traffic cabs are able to achieve above avg. speed on Sunday.  

We can also see few outliers in the graph, from midnight to early morning hours. 

<br>

#### Driver Response – With Respect to Avg. Distance and Avg. Speed on Particular Day 

Based on the Avg. Speed During Week based on Hour Key analysis, we can nor relate the driver’s response based on the traffic. 

<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70368897-b95a6b00-18d6-11ea-970d-dc8c56148f61.png>
  
Here, 0 means Driver not accepted the offer and 1 means – Driver accepted the offer. Driver’s are not accepting offers when the Avg. distance in km is high, and Avg. Speed is low. 

Also, in the bar graph we can observe that for the Monday, offers from the passengers are above average but drivers acceptance rate is lower than the average. And for the Saturday, it’s reversed. 

#### % Of Driver Response (Accept) – With Respect to Offer Class Category on Given Week day

Based on the following Pie chart Standard and Economy class groups share the biggest market share, which can easily understand from the number of offers gets to these two class – as shown in in Bar charts also. 

<p align="center"><img width=101% src=https://user-images.githubusercontent.com/44467789/70368918-0cccb900-18d7-11ea-8d92-db4aa26dbbd2.png>

Based on the Red and Greed divergence – we can identify that Economy class drivers are accepting less offers on all the weekdays. And for Standard class we can see that the ratio of accepting is less only on Sunday (may be due to less drivers and a holiday). 

<br>

## Exploratory Data Analysis

For EDA we started with missing value identification and feature summary.

```
## Data Summary

dim(CAX_McK)

summary(CAX_McK)

str(CAX_McK)

colSums(is.na(CAX_McK))

attach(CAX_McK)
```
For Target variable : driver_respove we also checked the balance between class 0 and 1. 

```

## Driver Respond Ratio

as.matrix(prop.table(table(driver_response)))

# [,1]
# 0 0.2597694
# 1 0.7402306
```
For ourliers detection, under uni-variant alaysis

```
## Uni-variant Analysis

> summary(CAX_McK[, c(10,11,15)])

  distance_km        duration_min     distance_driver_origin
 Min.   :  -1.000   Min.   :  -1.00   Min.   : 0.00000      
 1st Qu.:  -1.000   1st Qu.:  -1.00   1st Qu.: 0.00562      
 Median :   6.923   Median :  15.38   Median : 0.01053      
 Mean   :  13.474   Mean   :  18.93   Mean   : 0.24131      
 3rd Qu.:  18.199   3rd Qu.:  28.93   3rd Qu.: 0.01924      
 Max.   :9137.747   Max.   :6752.48   Max.   :69.39688  
 
 
par(mfrow = c(2,2))

boxplot(distance_km, main = 'Distance in KM', col = 'darkolivegreen2')
boxplot(duration_min, main = 'Duration in Min', col = 'darkorchid2')
boxplot(duration_speed, main = 'Speed in KM/Min', col = 'coral')
boxplot(distance_driver_origin, main = 'Distance Order Pickup and Driver', col = 'cornflowerblue')
```

<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70690031-c2cf4300-1cdb-11ea-96d4-c860d3d1a838.png>

As we can see the outliers in the box plot for particular features, we decided to remove the outlires. Also, we decided to remove -1 observations when destination is not set. This gives skewness the dataset. 

```
## Outliers Remove with 97% percentile

## Remove -1 outliers 

CAX_McK = CAX_McK[which(duration_min >= 0 & 
                          distance_km >= 0 &
                          duration_speed >= 0 &
                           driver_latitude >= 0.1 &
                          driver_longitude >= 0.1 &
                          origin_order_latitude >= 0 &
                          origin_order_longitude >= 0),]

```
And hence, decided to check the quantiles, 
```
## At 95% quantile - run one more Outlier test

> quantile(distance_driver_origin, 0.95)
       95% 
0.03919821 
> quantile(duration_min, 0.95) 
   95% 
57.667 
> quantile(distance_km, 0.95)
   95% 
53.406 

CAX_McK = CAX_McK[which(distance_driver_origin <= 0.03919 & 
                    duration_min <= 57.667 &
                    distance_km <= 53.406), ]
                    
 ```
 
 After removing the outlires - summary and box plot. 
 
 ```
> ## Mean After Outlier Adjustment

> summary(CAX_McK[, c(10,11,15)])

 distance_km      duration_min   distance_driver_origin
 Min.   : 0.000   Min.   : 0.00   Min.   :0.000000      
 1st Qu.: 5.504   1st Qu.:13.22   1st Qu.:0.005593      
 Median :11.266   Median :21.13   Median :0.010292      
 Mean   :14.976   Mean   :23.35   Mean   :0.012424      
 3rd Qu.:20.903   3rd Qu.:31.80   3rd Qu.:0.017664      
 Max.   :53.406   Max.   :57.67   Max.   :0.039189 
 
 ```

<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70695774-6fafbd00-1ce8-11ea-8cea-8c075ddb48cc.png>
  
For Bi-variant analysis we did correlation study between features. 

Continious Variables - correlation analysis 
We decised to not to incluse, order_gk, driver_gk, offer_gk due to unique ids
We also decided to not to include, Discrit variables - hour_key, weekday_key as represents categorical variables.

```
corrplot(cor(CAX_McK[, c(6,7,8,9,10,11,12,15,16)]), type = 'upper', order = 'hclust', 
         col = brewer.pal(n = 7, name = 'YlGnBu'))
```

<p align="center"><img width=78% src=https://user-images.githubusercontent.com/44467789/70696681-295b5d80-1cea-11ea-9a8f-87eaec089c9c.png>
 
Remove High Correlatated features - Multicollinearity - duration_km and distance_km. Also, Remove, Origin_Order : latitude and longitude (High corr). We decided to keep duration_speed as it is created from km and min variables.

To remove non-significant variables in continious/numbers features, we used correlation. But, to identify non-significant variables in categorical features we used chi square test. However, we also performed t-test for continious variables. 

To check the significant impact on target variable we put threashold of 95%. 

```
## For Categorical Variables

chisq.test(as.factor(offer_gk), as.factor(driver_response)) ## NOT SIGNIFICANT : p-value: 0.499

chisq.test(as.factor(weekday_key), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(hour_key), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(driver_gk), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(order_gk), as.factor(driver_response)) ## NOT SIGNIFICANT : p-value: 1

chisq.test(as.factor(offer_class_group), as.factor(driver_response)) ## SIGNIFICANT

chisq.test(as.factor(ride_type_desc), as.factor(driver_response)) ## SIGNIFICANT


## For Continious Variables

t.test(distance_km, driver_response) ## SIGNIFICANT

t.test(distance_driver_origin, driver_response) ## SIGNIFICANT

t.test(duration_min, driver_response) ## SIGNIFICANT

t.test(duration_speed, driver_response) ## SIGNIFICANT
```

An hence, we removed non-significant feature from the dataset. 
 
                       

