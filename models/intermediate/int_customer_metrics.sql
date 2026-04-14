select customer_id,
count(order_id) as total_orders,
sum(total_order_value) as total_spend,
max(order_purchase_timestamp) as last_order_date

from {{ref('fct_orders')}}
group by customer_id
