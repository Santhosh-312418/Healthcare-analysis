{{ config(materialized="table") }}
with
    dim_patients as (
        select
            patient_id,
            first_name,
            gender,
            age,
            concat(city, ' ', state) as address,
            primary_provider_id
        from {{ ref("src_patients") }}
    ),
    dim_encounters_history as (
        select
            admit_date,
            length_of_stay,
            encounter_type,
            enc_icd_code,
            enc_icd_desc,
            provider_id
        from healthcare.develop.src_encounters
    )

select distinct (d_enc.provider_id) as dist_prv_id, *
from dim_patients d_pat
inner join dim_encounters_history d_enc on d_pat.primary_provider_id = d_enc.provider_id
where d_enc.encounter_type = 'emergency'
