{{ config(
      materialized= 'view'
)}}

with
    raw_cte_diagnoses as (
        select * from healthcare.raw_data.raw_diagnoses where diagnosis_id < 2000
    )

select
    diagnosis_id, encounter_id, icd10_code as diag_code, icd10_description as diag_desc
from raw_cte_diagnoses
