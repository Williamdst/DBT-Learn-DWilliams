WITH source AS(
    SELECT * FROM {{ source('jaffle_shop', 'customers') }}
),
renamed as (
    SELECT
        -- keys
        id AS customer_id,

        -- description
        first_name,
        last_name
    FROM source
)
SELECT * FROM renamed