{{ config(
    materialized='table'
) }}

select
    customer_id,
    count(distinct order_id) as total_orders,
    sum(order_total_price + order_total_freight) as lifetime_value,
    case
        when min(date(order_purchase_timestamp)) = max(date(order_purchase_timestamp)) then 'new'
        else 'returning'
    end as customer_type
from {{ ref('fp_int_combined') }}
group by customer_id
