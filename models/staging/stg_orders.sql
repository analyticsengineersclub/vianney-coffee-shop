with source as (

    select * from {{ source('coffee_shop', 'orders') }}

),

renamed as (

    select
        id as order_id,
        created_at as order_crreated_at,
        customer_id,
        total as num_total_orders,
        address,
        state,
        zip

    from source

)

select * from renamed