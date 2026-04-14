SELECT
    product_id,
    product_category_name

FROM {{ source('raw', 'raw_products') }}

WHERE product_id IS NOT NULL
