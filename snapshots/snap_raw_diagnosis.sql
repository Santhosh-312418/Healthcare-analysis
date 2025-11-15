{% snapshot snap_raw_diagnosis %}
    {{
        config(
            unique_key="DIAGNOSIS_ID",
            strategy = "check",
            check_cols = ["ENCOUNTER_ID", "ICD10_CODE"],
            invalidate_hard_deletes=true,
        )
    }}

    select *, current_timestamp() as snap_at, true as is_active
    from healthcare.raw_data.raw_diagnoses

{% endsnapshot %}
