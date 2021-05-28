WITH source AS (
    SELECT * FROM {{ source('jaffle_shop', 'orders') }}
),

renamed AS (
    SELECT 
        -- keys
        id as order_id,
        user_id as customer_id,

        -- descriptions
        order_date,
        status,

        -- metadata
        _etl_loaded_at

    from {{ source('jaffle_shop', 'orders') }}
)

SELECT * FROM renamed