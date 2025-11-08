with
    raw_cte_vitals as (
        select
            vital_id,
            encounter_id,
            heart_rate,
            concat(systolic_bp, '/', diastolic_bp) as bp_rate,
            spo2,
            temperature_f,
            recorded_at
        from healthcare.raw_data.raw_vitals
    )

select *, cast(recorded_at as timestamp_tz) as record_wt_tz
from raw_cte_vitals

