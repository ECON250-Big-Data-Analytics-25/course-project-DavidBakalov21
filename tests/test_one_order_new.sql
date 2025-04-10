with combined as (
  select
    customer_id,
    min(date(order_purchase_timestamp)) as first_order,
    max(date(order_purchase_timestamp)) as last_order
  from {{ ref('fp_int_combined') }}
  group by customer_id
)

select a.*
from {{ ref('fp_customer_behaviour') }} a
join combined co using(customer_id)
where co.first_order = co.last_order
  and a.customer_type != 'new'