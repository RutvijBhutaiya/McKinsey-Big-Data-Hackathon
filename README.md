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

