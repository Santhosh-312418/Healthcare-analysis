{{config(
    materialized='table'
)}}
select *
from {{ source("HEALTHCARE", "R_CLAIMS") }}
