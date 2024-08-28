select
    *,
    ROUND(operational_margin-ads_cost,2) AS ads_margin
from
    {{ref('int_campaigns_day')}}
JOIN
    {{ref('finance_days')}}
USING(date_date)
ORDER BY
    date_date DESC