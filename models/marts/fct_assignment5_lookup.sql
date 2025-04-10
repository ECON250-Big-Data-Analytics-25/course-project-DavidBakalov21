{{
config(
materialized ='incremental',
unique_key ='title'
)
}}

with source_data as (
  select
    title,
    date(timestamp(datehour)) as date,
    views
  from {{ source('test_dataset', 'assignment5_input') }}
  {% if is_incremental() %}
  where date(timestamp(datehour)) >= (
    select max(last_appearance)
    from {{ this }}
  )
  {% endif %}
)

select
  title,
  min(date) as first_appearance,
  max(date) as last_appearance,
  sum(views) as total_views,
  CURRENT_TIMESTAMP() as insert_time
from source_data
group by title

