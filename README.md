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

- 3 weather KPI developed : 
     + RAIN
     + WARM
     + WIND
- Crime data cleaned
    
#### Reporting :

monthly_crime_weather : number of crime per month and the weather associated

most_commited_crime_monthly :  3 most commited crime per month 

## Data lineage :
![image](https://github.com/ah-portfolio/LA_crimes_data_with_dbt/assets/110063004/1905cd79-8d52-4341-9d4c-b03f2309652a)

    
