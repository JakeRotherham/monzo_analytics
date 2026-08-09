with enriched as (
    select * from {{ ref('int_transactions_enriched') }}
)

select
    customer_id,
    account_id,
    count(*) as transaction_count,
    sum(case when amount < 0 then amount else 0 end) as total_spend,
    sum(case when amount > 0 then amount else 0 end) as total_income,
    avg(amount) as avg_transaction_value
from enriched
group by customer_id, account_id
