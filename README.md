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

<br>

## Objective 

The objective of this contest is to predict the probability of an offer being accepted by a certain driver.

<br>

## Approach 
- Study Dataset Creation 
- Raw data analysis and Feature Analysis
- Multivariate analysis - Using Tableau
- Exploratory Data Analysis 
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


p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70368752-e86fdd00-18d4-11ea-9348-157a1dd26b09.png>

Hence, we can say that in the centre of the city drivers are able to get more acceptance due to short distance. 

As, we can see in the following chart Red market cluster are in the drivers in the centre of the city, and size of the circle shown average distance in km. However, as we can see in the blue clusters the distance outside the city rides are longer as size of the circles are bigger. 

<p align="center"><img width=85% src=https://user-images.githubusercontent.com/44467789/70368787-16edb800-18d5-11ea-8a5f-62c17e77da3c.png>





