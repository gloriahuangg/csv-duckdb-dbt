with companies_ranked_by_dividendyield as (

    select * from {{ ref('Companies_ranked_by_Dividend_Yield') }}

),

top_us50_by_dividendyield as (
    select * from companies_ranked_by_dividendyield
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_dividendyield


