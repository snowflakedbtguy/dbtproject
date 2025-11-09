{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='COMPUTE_WH',
    target_lag='1 MINUTES'
) }}

WITH ITEM_DT AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY CUST_ID ORDER BY PRICE DESC) AS rn
    FROM {{ source('RAWLAYER', 'ITEM') }}
)
SELECT * FROM ITEM_DT WHERE rn = 1