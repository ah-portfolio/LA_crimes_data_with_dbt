with
    warm 
    as 
    (
        {{weather_scale ('tmax')}}
    )


select
    tb.date,
    tb.tmax,
    case
        when tb.tmax is null then 0
        WHEN tb.tmax = 0.0 then 0 
        else warm.scale
    end as scale
from
{{ source("raw", "weather") }} tb
LEFT JOIN  
warm
on warm.date = tb.date
