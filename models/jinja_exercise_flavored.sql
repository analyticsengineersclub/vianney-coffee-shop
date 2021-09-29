select

  {% for product_category in ['coffee_beans','merch','brewing_supplies'] %} 
  
  sum(case when product_category = '{{product_category}}' 
    then total_price end) as {{product_category}}_amount,
  
  {%endfor%}

  date_trunc(sold_at, month) as date_month
 
from {{ ref('weekly_revenue_per_category') }}
group by date_month