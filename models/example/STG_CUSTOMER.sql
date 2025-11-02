{{config (materialized ='table',transient=false )}}
WITH CTE AS 
(
SELECT * FROM {{ source ('snowflake_sample_data','CUSTOMER')}}
)
SELECT * FROM CTE 