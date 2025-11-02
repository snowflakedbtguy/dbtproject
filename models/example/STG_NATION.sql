{{config (materialized ='table',transient=false )}}

WITH CTE AS
(
    SELECT * FROM {{ source ('snowflake_sample_data','NATION')}}
)

SELECT * FROM CTE