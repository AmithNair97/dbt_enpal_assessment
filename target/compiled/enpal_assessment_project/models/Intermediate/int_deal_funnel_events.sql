WITH deals_created AS (
  SELECT 
    dc.deal_id,
    '1' AS funnel_step,
    'Lead Generation' AS kpi_name,
    MIN(dc.change_time) AS event_time
  FROM "postgres"."public_pipedrive_analytics"."stg_pipedrive__deal_changes" dc
  WHERE dc.changed_field_key = 'add_time'
  GROUP BY dc.deal_id
),
stage_entries AS (
  SELECT 
    se.deal_id,
    CAST(se.stage_id AS VARCHAR) AS funnel_step,  
    s.stage_name AS kpi_name,
    se.stage_change_time AS event_time
  FROM "postgres"."public_pipedrive_analytics"."int_deal_stage_entries" se
  JOIN "postgres"."public_pipedrive_analytics"."stg_pipedrive__stages" s 
    ON se.stage_id = s.stage_id
),
sales_calls AS (
  SELECT 
    deal_id,
    funnel_step,
    kpi_name,
    call_time AS event_time
  FROM "postgres"."public_pipedrive_analytics"."int_deal_sales_calls"
)
SELECT * FROM deals_created
UNION ALL
SELECT * FROM stage_entries
UNION ALL
SELECT * FROM sales_calls