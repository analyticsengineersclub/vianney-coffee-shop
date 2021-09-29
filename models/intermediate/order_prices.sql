with order_items as (
    select * from {{ref ("stg_order_items")}}
),

orders as (
    select * from {{ref ("stg_orders")}}
),

product_prices as (
    select * from {{ref ("stg_product_prices")}}
),

price_per_order_item as (

    select 
        order_items.order_item_id,
        order_items.order_id,
        orders.order_created_at,
        product_prices.product_category,
        product_prices.product_id,
        product_prices.product_price_id

    from order_items
    left join orders using (order_id)
    left join product_prices using (product_id)
)

select * from price_per_order_item