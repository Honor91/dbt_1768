with margin_ship as(

select
    orders_id,
    date_date,
    margin,
    shipping_fee,
    CAST(ship_cost AS float64) AS ship_cost,
    logcost
from
    {{ref("init_sales_margin")}}
join
    {{ref("stg_raw__ship")}}
using(orders_id)
)
select
    orders_id,
    date_date,
    ROUND(SUM(margin+shipping_fee-logcost-ship_cost),2) AS operational_margin
from
    margin_ship
GROUP BY
    orders_id,
    date_date
ORDER BY
    orders_id desc,
    date_date