with order_items as (
    select * from {{ref ("stg_order_items")}}
),

orders as (
    select * from {{ref ("stg_orders")}}
),

base as (
select 
EXTRACT(WEEK FROM orders.order_created_at) as week,
product_id,
count (*) as num_products

from order_items
left join orders
using (order_id)
group by 1,2
order by 1 asc
)

select * from base