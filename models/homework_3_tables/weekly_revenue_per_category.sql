
with order_prices as (
    select * from {{ref ("order_prices")}}
),

weekly_revenue_per_category as (
    select 
        order_created_at as sold_at,
        product_category,
        --order_item_id,
        sum(product_price_id) as total_price

    from order_prices
    group by 1,2
)

select * from weekly_revenue_per_category