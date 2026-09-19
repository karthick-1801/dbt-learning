with bike as (
    select 
        distinct
        start_statio_id as start_station_id,
        start_station_name, 
        start_lat as start_station_lat,
        start_lng as start_station_lng
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
)
select * from bike