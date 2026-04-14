select 
    so.order_id,
    so.customer_id,
    so.order_status,
    so.order_purchase_timestamp,
    sum(soi.price) as total_order_value,
    sum(soi.freight_value) as total_freight_value
from {{ref('stg_orders')}} so
left join {{ref("stg_order_items")}} soi
on so.order_id = soi.order_id

group by 
so.order_id,so.customer_id,so.order_status,so.order_purchase_timestamp
