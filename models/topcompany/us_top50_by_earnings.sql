with companies_ranked_by_earnings as (

    select * from {{ ref('Companies_ranked_by_Earnings') }}

),

top_us50_by_earnings as (
    select * from companies_ranked_by_earnings
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_earnings


