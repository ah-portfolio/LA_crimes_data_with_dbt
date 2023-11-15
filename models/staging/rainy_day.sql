with
    rainy 
    as 
    (
        {{weather_scale ('prcp')}}
    )


select
    tb.date,
    tb.prcp,
    case
        when tb.prcp is null then 'N' 
        WHEN tb.prcp = 0.0 then 'N' 
        else 'Y' 
    end as rain,
    case
        when tb.prcp is null then 0
        WHEN tb.prcp = 0.0 then 0 
        else rainy.scale
    end as scale
from
{{ source("raw", "weather") }} tb
LEFT JOIN  
rainy
on rainy.date = tb.date