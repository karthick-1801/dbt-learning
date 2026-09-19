with daily_weather as (
    select 
        date(time) as daily_weather,
        weather,
        avg(temp) as avg_temp,
        avg(pressure) as avg_pressure,
        avg(humidity) as avg_humidity,
        avg(clouds) as avg_clouds
    from {{ source('demo', 'weather') }}
    group by date(time), weather
    qualify row_number() over(partition by date(time) order by count(weather) desc)=1
)
select * from daily_weather