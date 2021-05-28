WITH source AS (
    SELECT * FROM {{ source('stripe', 'payment') }}
),
renamed AS (

    SELECT 
        -- keys
        id as payment_id,
        orderid as order_id,

        -- description
        paymentmethod as payment_method,
        status,
        amount / 100 AS amount,
        created AS created_at,

        --metadata
        _batched_at
    FROM source
)
SELECT * FROM renamed