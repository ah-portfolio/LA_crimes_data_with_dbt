with 
monthly_nb_crime_per_type
    as
    (
        SELECT 
            FORMAT_DATE("%Y-%m",crime.date_occ) month, 
            crime.crm_cd_desc as crime_description,
            count(*) as number_of_crime, 
        FROM {{ref('crimes_cleaned')}} crime
        group by 1,2
        order by 1 desc
    )
,monthly_crime_rank_tb
    as
    (
        select month, crime_description, number_of_crime, rank() over( partition by month order by number_of_crime desc) monthly_crime_rank
        from monthly_nb_crime_per_type
    )

select 
    month, crime_description, number_of_crime, monthly_crime_rank
from monthly_crime_rank_tb
where monthly_crime_rank <= 3