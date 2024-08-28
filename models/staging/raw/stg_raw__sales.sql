with 

source as (

    select 
    *,
    concat(orders_id,"_",pdt_id) AS PK
    from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity,
        PK

    from source

)

select *
from renamed

