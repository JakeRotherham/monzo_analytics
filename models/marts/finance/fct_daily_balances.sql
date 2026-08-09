select
    customer_id,
    account_id,
    transaction_date,
    running_balance
from {{ ref('int_customer_balances') }}
order by account_id, transaction_date
