

SELECT 
  date_trunc('month', event_time) AS month,
  funnel_step,
  kpi_name,
  COUNT(DISTINCT deal_id) AS deals_count
FROM "postgres"."public_pipedrive_analytics"."int_deal_funnel_events"
GROUP BY 
  date_trunc('month', event_time),
  funnel_step,
  kpi_name
ORDER BY 
  month,
  funnel_step