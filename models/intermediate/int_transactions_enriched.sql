with transactions as (
    select * from {{ ref('stg_transactions') }}
),

accounts as (
    select * from {{ ref('stg_accounts') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
)

select
    t.transaction_id,
    t.account_id,
    t.timestamp,
    t.transaction_date,
    t.amount,
    t.merchant,
    t.category,
    a.customer_id,
    a.account_type,
    c.name as customer_name,
    c.region as customer_region
from transactions t
left join accounts a using (account_id)
left join customers c using (customer_id)
