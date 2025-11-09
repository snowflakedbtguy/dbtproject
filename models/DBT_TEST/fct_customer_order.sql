WITH joined AS (
    SELECT 
        c.CUSTOMER_ID,
        c.CUSTOMER_NAME,
        c.CITY,
        o.ORDER_ID,
        o.PRODUCT_NAME,
        o.AMOUNT,
        o.ORDER_STATUS,
        o.ORDER_DATE
    FROM {{ ref('stgcustomer') }} c
    LEFT JOIN {{ ref('stgorder') }} o
        ON c.CUSTOMER_ID = o.CUSTOMER_ID
)
SELECT * FROM joined