WITH source AS(
  SELECT *
  FROM {{ source('ticket_tailor', 'events') }}
),
renamed AS(
  SELECT
    --keys
    id AS event_id,

    --descriptions
    name,
    description,
    object,
    payment_methods,
    currency,
    timezone,
    url,
    venue,
    call_to_action,

    --status
    status,
    total_issued_tickets,
    total_orders,

    --booleans
    online_event as is_online_event,
    private as is_private,
    tickets_available as is_tickets_available,

    --timestamps
    created_at,

    --metadata
    _sdc_batched_at,
    _sdc_received_at,
    _sdc_sequence,
    _sdc_table_version

    --ignored
    -- 'end'
    -- 'start'
    -- ticket_groups
  FROM source
)
SELECT * FROM renamed