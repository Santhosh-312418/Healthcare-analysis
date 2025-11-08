with
    raw_cte_labresults as (
        select * from healthcare.raw_data.raw_lab_results where abnormal_flag = 'H'
    )

select *, to_char(test_date, 'DD-MM-YYYY') as test_date_fmtd
from raw_cte_labresults
