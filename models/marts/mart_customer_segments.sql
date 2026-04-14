select customer_id, total_orders, total_spend,  recency_days,

case
when total_spend >=500 and recency_days <= 30 then 'High_value'
when total_spend >= 500 and recency_days >90 then 'At_risk_high_vale'
when total_spend < 500 and recency_days >90 then 'low_value_churned'
else 'regular'
end as customer_segment

from {{ref('int_customer_rfm')}}
