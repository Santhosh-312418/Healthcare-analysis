with
    raw_cte_encounters as (
        select * from healthcare.raw_data.raw_encounters where length_of_stay > 2
    )

select
    provider_id,
    department_id,
    to_char(admit_date, 'DD-MM-YYYY') as admit_date,
    to_char(discharge_date, 'DD-MM-YY') as discharge_date,
    length_of_stay,
    encounter_type,
    primary_icd10 as enc_icd_code,
    primary_icd10_desc as enc_icd_desc,
    readmitted_within_30d
from raw_cte_encounters
where readmitted_within_30d = 'FALSE'
