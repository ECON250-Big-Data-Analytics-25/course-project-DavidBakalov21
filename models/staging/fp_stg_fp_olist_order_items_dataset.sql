{{ config(
    materialized='view',
    description='Staging for order itmes dataset, just added total value as sum of price and freight value'
) }}

with source as (
    select * from {{ source('dbakalov', 'fp_olist_order_items_dataset') }}
),


modified as (

    select
        order_id,
        order_item_id,
        product_id,
        seller_id,
        shipping_limit_date
        price,
        freight_value,
        price + freight_value as total_value
    from source

)

select * from modified