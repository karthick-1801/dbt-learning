with bike as (
    select 
        ride_id,
        rideable_type,
        date(started_at::timestamp) as trip_date,
        start_statio_id as start_station_id,
        end_station_id,
        member_csual as member_casual,
        timestampdiff(second, started_at::timestamp, ended_at::timestamp) as trip_duartion_seconds
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
)
select * from bike