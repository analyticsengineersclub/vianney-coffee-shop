select
 date_trunc(sold_at, month) as date_month,

  {% for product_category in ['coffee_beans','merch','brewing_supplies'] %} 
  sum(case when product_category = '{{product_category}}' 
    then total_price end) as {{product_category}}_amount
  {% if not loop.last %},{% endif %}
  {%endfor%}
 
from {{ ref('weekly_revenue_per_category') }}
group by 1
-- this doesn't include 'coffee beans' because of the space. Need to change the name somewhere