{{ config(materialized="incremental", on_schema_change="fail") }}

select *
from {{ ref("fact_claims") }}
where
    claim_status = 'submitted'
    {% if is_incremental() %} 
    and paid_date = current_date 
    {% endif %}
