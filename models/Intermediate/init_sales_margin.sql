with tmp1 as(
select
    orders_id,
    date_date,
    revenue,
    quantity,
    purchase_price,
    from {{ref("stg_raw__sales")}}
    join {{ref("stg_raw__product")}}
    using(products_id)
)
select
    tmp1.orders_id,
    tmp1.date_date,
    ROUND(SUM(tmp1.revenue),2) as revenue,
    ROUND(SUM(tmp1.quantity),2) as quantity,
    ROUND(SUM(tmp1.quantity*tmp1.purchase_price),2) as purchase_cost,
    ROUND(SUM(tmp1.revenue-tmp1.quantity*tmp1.purchase_price),2) as margin
from
    tmp1
GROUP BY
    tmp1.orders_id,
    tmp1.date_date 
ORDER BY
    tmp1.orders_id DESC,
    tmp1.date_date DESC