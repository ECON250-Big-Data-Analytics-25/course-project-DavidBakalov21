with combined as (
    select 
        count(*) as full_payment_count
    from {{ ref('fp_int_combined') }},
         unnest(payments) as p
    where p.payment_type is not null
),

mart as (
    select 
        sum(num_payments) as mart_payment_count
    from {{ ref('fp_payment_analysis') }}
)

select *
from combined, mart
where full_payment_count != mart_payment_count