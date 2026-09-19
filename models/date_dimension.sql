WITH CTE AS (
    SELECT 
        STARTED_AT::TIMESTAMP AS STARTED_AT,
        STARTED_AT::DATE AS DATE_STARTED_AT,
        HOUR(STARTED_AT::TIMESTAMP) AS HOUR_STARTED_AT,
        {{ get_day_type('STARTED_AT') }} AS DAY_TYPE, --Used macro 'like function'
        {{ get_season('STARTED_AT') }} AS STATION_OF_YEAR --Used macro 'like function'
    FROM {{source('demo', 'bike')}}
    WHERE STARTED_AT != 'started_at'
)
SELECT * FROM CTE