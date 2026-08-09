select
  account_id,
  customer_id,
  account_type,
  opened_date
from {{ source('raw', 'accounts') }}
