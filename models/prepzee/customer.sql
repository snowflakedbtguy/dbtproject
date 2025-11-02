{{config (materialized ='ephemeral')}}
SELECT 
* FROM {{source ('snowflake_sample_data','CUSTOMER')}}