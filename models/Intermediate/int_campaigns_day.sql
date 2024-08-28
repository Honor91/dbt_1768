SELECT
    date_date,  
    ROUND(SUM(ads_cost),2) AS ads_cost,
    ROUND(SUM(impression),2) as ads_impression,
    ROUND(SUM(click),2) as ads_clicks
FROM {{ref('int_campaign')}}
GROUP BY
    date_date
    