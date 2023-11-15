{%macro weather_scale (column_name) %}

select date, {{column_name}}, ntile(100)  over (order by  {{column_name}} asc) as scale from {{ source("raw", "weather") }}
where  {{column_name}}!=0.0 and  {{column_name}} is not null 

{%endmacro%}