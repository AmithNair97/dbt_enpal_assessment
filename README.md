## Project: Enpal dbt Assessment

This dbt project models Pipedrive CRM data into a clean, analytics friendly structure to support funnel reporting and sales performance analysis.

### Project Layers

- `Staging`: Cleans and renames raw source tables
- `Intermediate`: Transforms raw data into event-level funnel steps
- `Data Mart`: Aggregated metrics for reporting 

### Key Models

- `stg_pipedrive__activity`: Cleans raw activity data
- `int_deal_funnel_events`: Combines deal creation, stage movement, and sales calls
- `rep_sales_funnel_monthly`: Final report aggregating monthly funnel steps
