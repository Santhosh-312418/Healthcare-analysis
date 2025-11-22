# dbt_project.yml vars usage
select * from {{ var("raw_schema") }}.src_json_3k_records
