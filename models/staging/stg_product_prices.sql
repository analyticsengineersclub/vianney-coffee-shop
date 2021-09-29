with product_prices as (

    select * from {{ source('coffee_shop', 'product_prices') }}

),

products as (

    select * from {{ source('coffee_shop', 'products') }}

),

stg_product_prices as (

    select
        product_prices.id as product_price_id,
        product_prices.product_id,
        products.name as product_name,
        products.category as product_category,
        product_prices.price,
        products.created_at as product_created_at,
        product_prices.created_at as price_created_at,
        product_prices.ended_at price_ended_at

    from product_prices
    left join products 
    on product_prices.product_id = products.id

)

select * from stg_product_prices
