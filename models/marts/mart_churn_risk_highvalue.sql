select customer_id, total_spend, recency_days,
case
when total_spend >=500 and recency_days >90 then 'High_value_at_risk'
else 'not_risk'
end as chrun_risk

from {{ ref('int_customer_rfm') }}
