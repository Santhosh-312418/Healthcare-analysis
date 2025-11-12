{{ config(materialized="table") }}
select *
from {{ ref("fact_ephemeral_patients_wear") }}
