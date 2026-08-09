with enriched as (
    select * from {{ ref('int_transactions_enriched') }}
)

select
    customer_id,
    account_id,
    transaction_date,
    sum(amount) over (
        partition by account_id
        order by transaction_date
        rows between unbounded preceding and current row
    ) as running_balance
from enriched
