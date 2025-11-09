
{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='COMPUTE_WH',
    target_lag='1 MINUTES'
) }}

WITH CUST_ITEM_DT AS (
    SELECT 
        c.cust_id,
        c.cust_name,
        c.crid,
        c.location,
        c.cust_created,
        i.item_id,
        i.item_category,
        i.item_status,
        i.price,
        i.counts,
        ROUND(i.price / i.counts, 2) AS PRICE_PER_ITEM
    FROM {{ ref('CUSTOMER_DT') }} c
    INNER JOIN {{ ref('ITEM_DT') }} i
        ON c.cust_id = i.cust_id
)
SELECT * FROM CUST_ITEM_DT