select
  transaction_id,
  account_id,
  timestamp,
  amount,
  merchant,
  category,
  cast(timestamp as date) as transaction_date
from {{ source('raw', 'transactions') }}
