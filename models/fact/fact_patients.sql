{{ config(materialized="table") }}
select *
from healthcare.raw_data.raw_patients
where age >= 15
