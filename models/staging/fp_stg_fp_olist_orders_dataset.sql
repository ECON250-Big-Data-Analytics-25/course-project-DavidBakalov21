{{ config(
    materialized='view',
    description='Staging for orders dataset, added two derived columns first one is to define whether order is delivered, second one is to how much time it takes to approve the order'
) }}


with source as (

    select 
        *
    from {{ source('dbakalov', 'fp_olist_orders_dataset') }}

),
modified as (

    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date
        order_delivered_customer_date,
        order_estimated_delivery_date,
        case when order_status = 'delivered' then true else false end as is_delivered,
        case 
            when order_approved_at is null or order_purchase_timestamp is null then null
            else DATE_DIFF(DATE(order_approved_at), DATE(order_purchase_timestamp), DAY)
        end as approve_time
    from source

)

select * from modified
