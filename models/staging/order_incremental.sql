{{ config(
    materialized='incremental',
    unique_key='order_id',
    ) }}

WITH src AS (
    SELECT * FROM {{ ref('stg_order') }}
)

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    updated_at
FROM src

{% if is_incremental() %}
-- Only pull records newer than latest in the incremental table
WHERE src.updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
