{{ config(
    materialized='table'
) }}

select
    format_date('%Y-%m', order_purchase_timestamp) as order_month,
    order_status,
    count(distinct order_id) as total_orders,
    sum(order_total_price + order_total_freight) as total_revenue
from {{ ref('fp_int_combined') }}
where order_status = 'delivered'
group by order_month, order_status
--interesting notice in 2016 only one order was delivered, probably it is because it takes lots of time to complete the proces from client placing order to client gets his order delivered