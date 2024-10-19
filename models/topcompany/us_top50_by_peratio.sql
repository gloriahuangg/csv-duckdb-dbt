with companies_ranked_by_peratio as (

    select * from {{ ref('Companies_ranked_by_P_E_ratio') }}

),

top_us50_by_peratio as (
    select * from companies_ranked_by_peratio
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_peratio

