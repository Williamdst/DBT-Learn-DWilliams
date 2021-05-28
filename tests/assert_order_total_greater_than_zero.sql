SELECT
  order_id,
  SUM(total) AS total_amount
FROM {{ ref('stg_tt_orders') }}
GROUP BY order_id
HAVING NOT(total_amount >=0)