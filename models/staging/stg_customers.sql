select
  customer_id,
  name,
  region,
  date_of_birth
from {{ source('raw', 'customers') }}
