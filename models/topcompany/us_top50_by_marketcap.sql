with companies_ranked_by_marketcap as (

    select * from {{ ref('Companies_ranked_by_Market_Cap') }}

),

top_us50_by_marketcap as (
    select * from companies_ranked_by_marketcap
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_marketcap

