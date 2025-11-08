with raw_cte_risk_scores as (select * from healthcare.raw_data.raw_risk_scores)

select *
from raw_cte_risk_scores
where diabetes_score > '0.1'
order by diabetes_score desc
