select *
from {{ ref("fact_eph_wearables") }}
where patient_id >= 1 and patient_id <= 100
