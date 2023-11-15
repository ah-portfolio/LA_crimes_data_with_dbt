with
    windy 
    as 
    (
        {{weather_scale ('wspd')}}
    )


select
    tb.date,
    tb.wspd,
    case
        when tb.wspd is null then 'N' 
        WHEN tb.wspd = 0.0 then 'N' 
        else 'Y' 
    end as wind,
    case
        when tb.wspd is null then 0
        WHEN tb.wspd = 0.0 then 0 
        else windy.scale
    end as scale
from
{{ source("raw", "weather") }} tb
LEFT JOIN  
windy
on windy.date = tb.date