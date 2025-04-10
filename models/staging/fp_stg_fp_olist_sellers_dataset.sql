{{ config(
    materialized='view',
    description='Staging for sellers dataset, no derived columns can be calculated'
) }}

with source as (

    select * 
    from {{ source('dbakalov', 'fp_olist_sellers_dataset') }}

)

select * from source