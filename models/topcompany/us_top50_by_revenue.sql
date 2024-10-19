with companies_ranked_by_revenue as (

    select * from {{ ref('Companies_ranked_by_Revenue') }}

),

top_us50_by_revenue as (
    select * from companies_ranked_by_revenue
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_revenue

