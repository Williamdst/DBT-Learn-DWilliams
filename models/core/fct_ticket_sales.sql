WITH valid_tickets as(
    SELECT * FROM {{ ref('stg_tt_tickets') }}
    WHERE status = 'valid'
),

events as(
    SELECT * FROM {{ ref('stg_tt_events') }}
),

orders AS( 
    SELECT * FROM {{ ref('stg_tt_orders') }}
),

joined as(
    SELECT 
        tickets.ticket_id,
        tickets.event_id,
        tickets.order_id,
        tickets.created_at,
        tickets.updated_at,
        events.name as event_name,
        events.timezone as event_timezone,
        orders.total as ticket_amount,
        CASE 
            WHEN orders.status = 'completed' then false
            WHEN orders.status = 'cancelled' then true
        END AS is_refunded
    FROM valid_tickets
    LEFT JOIN events
        USING (event_id)
    LEFT JOIN orders
        USING (order_id)
)

SELECT * FROM joined