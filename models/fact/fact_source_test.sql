select *
from {{ source("HEALTHCARE", "R_CLAIMS") }}
