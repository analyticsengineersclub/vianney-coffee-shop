select
  date_trunc(sold_at, month) as date_month,
  sum(case when product_category = 'coffee beans' then total_price end) as coffee_beans_amount,
  sum(case when product_category = 'merch' then total_price end) as merch_amount,
  sum(case when product_category = 'brewing supplies' then total_price end) as brewing_supplies_amount

from {{ ref('weekly_revenue_per_category') }}
group by 1