{% macro get_season(x)%}

    CASE WHEN MONTH({{ x }}::TIMESTAMP) IN (12, 1, 2) THEN 'WINTER'
         WHEN MONTH({{ x }}::TIMESTAMP) IN (3, 4, 5) THEN 'SPRING'
         WHEN MONTH({{ x }}::TIMESTAMP) IN (6, 7, 8) THEN 'SUMMER'
         ELSE 'AUTUMN'
    END

{% endmacro %}


{% macro get_day_type(x)%}

    CASE WHEN DAYNAME({{ x }}::TIMESTAMP) IN ('Sat', 'Sun') THEN 'WEEKEND'
         ELSE 'BUSINESSDAY'
    END

{% endmacro %}