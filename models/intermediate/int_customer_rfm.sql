select customer_id, total_orders, total_spend,
DATEDIFF(
    'day',
    last_order_date,
    (SELECT MAX(last_order_date) FROM {{ ref('int_customer_metrics') }})
) AS recency_days
from {{ ref('int_customer_metrics') }}
