{{ config(
    materialized='view',
    description='Staging for customers dataset, it appears that no derived columns can be calculated'
) }}

with source as (
    select * from {{ source('dbakalov', 'fp_olist_customers_dataset') }}
)

select * from source