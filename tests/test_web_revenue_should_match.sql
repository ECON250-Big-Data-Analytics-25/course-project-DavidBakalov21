select date, revenue_sum from {{ref("fct_web_daily_stats")}} join( 
    
    {{ref("week5_transactions_deduplicated_view")}}
)




