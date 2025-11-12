select * from {{ ref("src_claims") }} where claim_status = 'peing'
