with margin_ship as(

select
    orders_id,
    date_date,
    margin,
    shipping_fee,
    CAST(ship_cost AS float64) AS ship_cost,
    logcost,
    quantity,
    revenue,
    purchase_cost
from
    {{ref("init_sales_margin")}}
join
    {{ref("stg_raw__ship")}}
using(orders_id)
)
select
    orders_id,
    date_date,
    margin,
    shipping_fee,
    logcost,
    ship_cost,
    ROUND(margin+shipping_fee-logcost-ship_cost,2) AS operational_margin,
    quantity,
    revenue,
    purchase_cost
  
from
    margin_ship
ORDER BY
    orders_id desc