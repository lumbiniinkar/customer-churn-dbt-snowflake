SELECT
    review_id,
    order_id,
    review_score,
    review_creation_date,
    review_answer_timestamp

FROM {{ source('raw', 'raw_order_reviews') }}

WHERE order_id IS NOT NULL
