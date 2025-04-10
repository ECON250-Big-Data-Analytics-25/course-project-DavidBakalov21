
{{ config(
    materialized='table',
    partition_by={"field": "order_purchase_timestamp", "data_type": "timestamp"},
    cluster_by=["customer_id"]
) }}

with orders as (
    select * from {{ ref('fp_stg_fp_olist_orders_dataset') }}
),

customers as (
    select * from {{ ref('fp_stg_fp_olist_customers_dataset') }}
),

order_items as (
    select * from {{ ref('fp_stg_fp_olist_order_items_dataset') }}
),

payments as (
    select * from {{ ref('fp_stg_fp_olist_order_payments_dataset') }}
),

products as (
    select * from {{ ref('fp_stg_fp_olist_products_dataset') }}
),

sellers as (
    select * from {{ ref('fp_stg_fp_olist_sellers_dataset') }}
),

categories as (
    select * from {{ ref('fp_stg_fp_product_category_name_translation') }}
),

seller_details as (
    select distinct
        oi.order_id,
        sel.seller_id,
        sel.seller_city,
        sel.seller_state
    from order_items oi
     join sellers sel on oi.seller_id = sel.seller_id
),

seller_agg as (
    select
        order_id,
        array_agg(struct(seller_id, seller_city, seller_state)) as sellers
    from seller_details
    group by order_id
),

item_agg as (
    select
        oi.order_id,
        sum(oi.price) as order_total_price,
        sum(oi.freight_value) as order_total_freight,
        array_agg(distinct cat.product_category_name_english) as product_categories_english,
        array_agg(distinct p.product_category_name) as product_categories_original
    from order_items oi
 join products p on oi.product_id = p.product_id
     join categories cat on p.product_category_name = cat.product_category_name
    group by oi.order_id
),

payment_agg as (
    select
        order_id,
        array_agg(struct(
            payment_type,
            payment_installments,
            payment_value,
            is_debit_card,
            not_defined
        )) as payments
    from payments
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    c.customer_state,
    c.customer_city,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    o.is_delivered,
    o.approve_time,

    ia.order_total_price,
    ia.order_total_freight,
    ia.product_categories_english,
    ia.product_categories_original,
    sa.sellers,

    pa.payments

from orders o
 join customers c on o.customer_id = c.customer_id
 join item_agg ia on o.order_id = ia.order_id
 join seller_agg sa on o.order_id = sa.order_id
 join payment_agg pa on o.order_id = pa.order_id
