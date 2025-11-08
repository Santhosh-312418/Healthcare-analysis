select
    index_encounter_id as readmit_inx_encounter_id,
    readmit_encounter_id,
    days_between as readmit_days_between
from healthcare.raw_data.raw_readmissions
where days_between > 15
