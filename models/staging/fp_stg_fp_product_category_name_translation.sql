{{ config(
    materialized='view',
    description='Staging for category name, added column to define whether names are idnetical'
) }}


with source as (

    select * 
    from {{ source('dbakalov', 'fp_product_category_name_translation') }}

),

modified as (

    select
        lower(product_category_name) as product_category_name,
        lower(product_category_name_english) as product_category_name_english,
        case
            when product_category_name is null or product_category_name_english is null then null
            when lower(product_category_name_english) = lower(product_category_name) then true
            else false
        end as is_identical

    from source

)

select * from modified