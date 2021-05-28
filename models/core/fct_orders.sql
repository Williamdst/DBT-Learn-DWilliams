WITH orders AS (
    SELECT * FROM {{ ref('stg_orders')}}
),

payments AS(
    SELECT * FROM {{ref('stg_payments')}}
),

order_payments AS (
    SELECT
     order_id,
     SUM(CASE WHEN status='success' THEN amount ELSE 0 END) AS amount
    FROM payments group by order_id 
),

final AS(
    SELECT
      o.order_id,
      o.customer_id,
      o.order_date,
      coalesce(op.amount, 0) as amount
    FROM orders o
    LEFT JOIN order_payments op
    USING (order_id)
)

SELECT * FROM final