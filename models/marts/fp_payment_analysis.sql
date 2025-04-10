{{ config(
    materialized='table'
) }}

with payments_exploded as (
    select
        format_date('%Y-%m', order_purchase_timestamp) as order_month,
        customer_state,
        p.payment_type,
        p.payment_installments,
        p.payment_value
    from {{ ref('fp_int_combined') }}
    cross join unnest(payments) as p
)

select
    order_month,
    customer_state,
    payment_type,
    payment_installments,
    count(*) as num_payments,
    sum(payment_value) as total_payment_value,
    avg(payment_value) as avg_payment_value
from payments_exploded
where payment_type is not null
group by order_month, customer_state, payment_type, payment_installments
