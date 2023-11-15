with 
crime
    as
        (
            SELECT FORMAT_DATE("%Y-%m",date_occ) as month, date_occ from {{ref('crimes_cleaned')}}
        )
,rain
    as
        (
            SELECT AVG(scale) as scale, date from {{ref('rainy_day')}}  group by date
        )
,warm
    as
        (
            SELECT AVG(scale) as scale, date from {{ref('warm_day')}} group by date
        )
,wind
    as
        (
            SELECT AVG(scale) as scale, date from {{ref('windy_day')}}  group by date
        )


SELECT 

crime.month,
AVG(rain.scale) as rain_rate_avg,
AVG(warm.scale) as warm_rate_avg,
AVG(wind.scale) as wind_rate_avg,
count(*) as nb_of_crime

FROM 
crime
LEFT JOIN rain on rain.date = crime.date_occ
LEFT JOIN warm on warm.date = crime.date_occ
LEFT JOIN wind on wind.date = crime.date_occ
group by 1