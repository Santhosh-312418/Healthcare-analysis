with
    raw_cte_claims as (
        select * from healthcare.raw_data.raw_claims where claim_status != 'paid'
    )

select *
from raw_cte_claims
limit 10000
