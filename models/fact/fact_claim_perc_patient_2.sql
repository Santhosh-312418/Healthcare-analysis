select
    pat.patient_id,
    pat.first_name,
    pat.city,
    pat.insurance_id,
    claims.amount_billed,
    claims.amount_paid as amount_settled,
    round(
        {{
            mac_find_claim_percentage(
                "claims.insurance_id", "claims.AMOUNT_PAID", "claims.AMOUNT_BILLED"
            )
        }},
        2
    ) as percentage_settled
from healthcare.develop.fact_patients pat
left join
    healthcare.develop.fact_claims claims on pat.insurance_id = claims.insurance_id
where claims.amount_paid != 0
