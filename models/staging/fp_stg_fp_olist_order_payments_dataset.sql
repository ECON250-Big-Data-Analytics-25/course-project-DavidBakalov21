{{ config(
    materialized='view',
    description='Staging for order payments dataset, added two derived columns first one is to define whether user used debit card, second one is to define whether type is defined'
) }}


with source as (

    select 
        *
    from {{ source('dbakalov', 'fp_olist_order_payments_dataset') }}

),

modified as (

    select
        order_id,
        payment_sequential,
        payment_type,
        payment_installments,
        payment_value,
        case when payment_type = 'debit_card' then true else false end as is_debit_card,
        case when payment_type = 'not_defined' then true else false end as not_defined

    from source

)

select * from modified