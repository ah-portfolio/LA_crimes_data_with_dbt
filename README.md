# Los Angeles crimes data analysis from 2020

This project aims to use dbt with big query to analyse and comparate crime data and weather in the city of LA.

In this project these dbt functionalities were used:

  - macros
  - generical tests
  - docs & data lineage

## Data sources :

Two data sources were used on this project :
  
  From US governement : https://catalog.data.gov/dataset/crime-data-from-2020-to-present

  From meteostat : https://meteostat.net/fr/place/us/los-angeles?s=KCQT0&t=2020-01-01/2023-11-01

Those documents were upload on GCS and integrated through external table on bigquery.

## Modelisation :

Three layers was build in three different datasets : 
  1. Raw layer : raw data stored on external table and directly queryable from bq
  2. Staging layer : data cleaned & deeper analysed
  3. Reporting layer : agregated data, ready to be ploted from an eventual BI tool

#### Staging :

- 3 weather KPI developed. For each day a grade between 0 and 100 is given for rain, warm and wind. For exemple a grade of 100/100 of rain corresponds to the rainest day from 2023. This grade is based on ntile. 
     + RAIN
     + WARM
     + WIND
- Crime data cleaned
    
#### Reporting :

monthly_crime_weather : number of crime per month and the weather associated

most_commited_crime_monthly :  3 most commited crime per month 


## Data lineage :
![image](https://github.com/ah-portfolio/LA_crimes_data_with_dbt/assets/110063004/1905cd79-8d52-4341-9d4c-b03f2309652a)


## Results :
On Looker Studio :
Number of crime per month (from 2020 to 2022)
  ![image](https://github.com/ah-portfolio/LA_crimes_data_with_dbt/assets/110063004/11fa2646-0d2f-46ff-8e09-71db28ed7716)

Number of crime function of wind average rate (each point is a month between 2020-01 and 2022-12)
![image](https://github.com/ah-portfolio/LA_crimes_data_with_dbt/assets/110063004/8e782b04-35ae-4065-844c-de95526f9469)

