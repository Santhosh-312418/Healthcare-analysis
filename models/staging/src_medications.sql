with raw_cte_medications as (select * from healthcare.raw_data.raw_medications)

select
    medication_id,
    encounter_id,
    medication_name,
    dose_mg,
    form,
    frequency,
    case
        when frequency = 'PRN'
        then 'AS NEEDED'
        when frequency = 'OD'
        then 'ONCE DAILY'
        when frequency = 'BD'
        then 'TWICE DAILY'
        when frequency = 'TDS'
        then 'THRICE DAILY'
        else 'UNKNOWN'
    end as frequency_desc,
    to_char(start_date, 'DD-MM-YYYY') as start_date,
    to_char(end_date, 'DD-MM-YYYY') as end_date
from raw_cte_medications
