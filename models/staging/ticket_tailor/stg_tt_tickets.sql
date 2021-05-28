WITH source AS(
  SELECT * 
  FROM {{ source('ticket_tailor', 'issued_tickets') }}
),
renamed AS(
  SELECT 
    -- keys
    event_id,
    id as ticket_id,
    order_id,
    ticket_type_id,

    -- descriptions
    barcode,
    barcode_url,
    object,

    --status
    status,

    -- timestamps
    created_at,
    updated_at,
    voided_at,

    -- metadata
    _sdc_batched_at,
    _sdc_received_at,
    _sdc_sequence,
    _sdc_table_version
  FROM source
)
SELECT * FROM renamed