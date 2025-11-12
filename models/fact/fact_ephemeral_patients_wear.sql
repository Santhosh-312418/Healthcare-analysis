{{ config(materialized="ephemeral") }}

select
    pat.patient_id,
    pat.first_name,
    pat.age,
    wear.wearable_id,
    wear.date,
    wear.steps,
    wear.sleep_hours
from {{ ref("src_patients") }} pat
left join {{ ref("src_wearable") }} wear on pat.patient_id = wear.patient_id
where wear.wearable_id is not null
