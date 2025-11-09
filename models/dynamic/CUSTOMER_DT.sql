{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='COMPUTE_WH',
    target_lag='1 MINUTES'
) }}

WITH CUSTOMERS_DT AS (
    SELECT 
        CUST_ID,
        CUST_NAME,
        OUTSTANDING_AMT,
        CRID,
        LOCATION,
        CUST_CREATED
    FROM {{ source('RAWLAYER', 'CUSTOMER') }}
    QUALIFY ROW_NUMBER() OVER (PARTITION BY CUST_ID ORDER BY CUST_CREATED DESC) = 1
)
SELECT * FROM CUSTOMERS_DT