# Companies Open Data Analysis with dbt and DuckDB

This project demonstrates how to create top 50 US companies using dbt with DuckDB as the database engine. We'll create various rankings and metrics using publicly available company data.

## Project Overview

Analyze Fortune 5o companies across multiple dimensions:
- Market Capitalization
- Annual Revenue
- Price-to-Earnings (P/E) Ratio
- Earnings Per Share (EPS)
- Dividend Yield

## Prerequisites

- Python 3.8+
- dbt-core
- dbt-duckdb
- DBeaver Community Edition
- Git

## Installation

```bash
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install required packages
pip install dbt-core dbt-duckdb

# Clone the repository
git clone https://github.com/gloriahuangg/csv-duckdb-dbt.git
cd csv-duckdb-dbt


## Project Structure

```plaintext
csv-duckdb-dbt/
├── README.md
├── dbt_project.yml
├── profiles.yml
├── topcompany.duckdb
├── seeds/
│   ├── Companies_ranked_by_Dividend_Yield.csv
│   ├── Companies_ranked_by_Earnings.csv
│   ├── Companies_ranked_by_Market_Cap.csv
│   ├── Companies_ranked_by_P_E_ratio.csv
│   ├── Companies_ranked_by_Revenue.csv
├── models/
│   ├── topcompany/
│   │   ├── top_us50_by_dividendyield.sql
│   │   ├── top_us50_by_earnings.sql
│   │   ├── top_us50_by_marketcap.sql
│   │   ├── top_us50_by_peratio.sql
│   │   ├── top_us50_by_revenue.sql
│   │   └── schema.yml
│   └── analysis/
└── data/
```

## Data Sources

This project uses the following seed data open data set:
1. `Companies_ranked_by_Dividend_Yield.csv`: Open dataset for all companies ranked by dividend yield.
2. `Companies_ranked_by_Earnings.csv`: Open dataset for all companies ranked by earnings.
3. `Companies_ranked_by_Market_Cap.csv`: Open dataset for all companies ranked by market cap.
4. `Companies_ranked_by_P_E_ratio.csv`: Open dataset for all companies ranked by PE ratio.
5. `Companies_ranked_by_Revenue.csv`: Open dataset for all companies ranked by revenue.

Data is open source dataset.

## Use DBeaver

 Configure DBeaver:
- Install DBeaver Community Edition
- Add new connection
- Select DuckDB
- Browse to your project's `topcompany.duckdb` file

## Running the Project

```bash
# Load seed data
dbt seed

# Run models
dbt run


# Generate documentation
dbt docs generate
dbt docs serve
```

## Available Models

### topcompany Models
1. us_top50_by_deividendyield
```sql
with companies_ranked_by_dividendyield as (

    select * from {{ ref('Companies_ranked_by_Dividend_Yield') }}

),

top_us50_by_dividendyield as (
    select * from companies_ranked_by_dividendyield
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_dividendyield
```

2. us_top50_by_earnings
```sql
with companies_ranked_by_earnings as (

    select * from {{ ref('Companies_ranked_by_Earnings') }}

),

top_us50_by_earnings as (
    select * from companies_ranked_by_earnings
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_earnings
```

3. us_top50_by_marketcap
```sql
with companies_ranked_by_marketcap as (

    select * from {{ ref('Companies_ranked_by_Market_Cap') }}

),

top_us50_by_marketcap as (
    select * from companies_ranked_by_marketcap
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_marketcap
```

4. us_top50_by_peratio
```sql
with companies_ranked_by_peratio as (

    select * from {{ ref('Companies_ranked_by_P_E_ratio') }}

),

top_us50_by_peratio as (
    select * from companies_ranked_by_peratio
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_peratio
```

5. us_top50_by_revenue
```sql
with companies_ranked_by_revenue as (

    select * from {{ ref('Companies_ranked_by_Revenue') }}

),

top_us50_by_revenue as (
    select * from companies_ranked_by_revenue
    where country = 'United States' 
    limit 50
)

select * from top_us50_by_revenue
```

