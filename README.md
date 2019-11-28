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
- [Study Dataset Creation](#study-data-creation)
- [Feature Analysis](#featureanalysis)
-

<br>

## Objective 

The objective of this contest is to predict the probability of an offer being accepted by a certain driver.

<br>

## Approach 
- Study Dataset Creation 
- Raw data analysis and Feature Analysis
- Multivariate analysis
- Exploratory Data Analysis 
- Create Clean Dataset file 
- 


<br>

<p align="right"><img width=37.6% src=https://user-images.githubusercontent.com/44467789/69726134-dd36e780-1145-11ea-9941-b84286575ca1.jpg>
  
<br>


## Study Dataset Creation

In this study, we decided to try 3 different types of Datapreparation and check which dataset fits best for the output (driver response prediction). 

##### Type 1: 

In this type of data preparation, we created new features distance_speedand distance_driver_origin. 

Where, duration_speed = duration_km / duration_min and 
distance_driver_origin = Ecludian distance on driver_latitude, driver_longitude,origin_order_latitude, origin_order_longitude. 

We also checked for outliers, missing values and completed ExploratoryData Analysis for the original dataset. The R code is written in -  [CAX_McK_Clean1.R](https://github.com/RutvijBhutaiya/McKinsey-Big-Data-Hackathon/blob/master/CAX_McK_Clean1.R) file. And we store thedata in [ .csv] file. 
We build Machine Learning models and evaluated model performance. 

##### Type 2: 

In this type of data preparation, we took the database, which weprepared as CAX_McK_Clean1.csv and created a new feature above that. The R code is written in -  CAX_McK_Clean2.R 

We need to top-up this new feature and want to study, due to(-1) observations from duration_min and distance_km where the destination is notset. These observations give misrepresentations of the data [for example observationat duration_min is showing -1, when a destination is not set]. 

Hence, we created a new feature destination_set with a factor of Yes or No. And filled the featurewith respect to the observation where it was showing (-1) as a destination notset. And after normalization, we created a new dataset asCAX_McK_Clean2.csv to build models and evaluation.  

In conclusion, we will compare both the type of datasets foraccuracy – as mentioned AUC – to check which datasets fit right to predict drivers’response. 

