SELECT 
  a.deal_id,
  CASE 
    WHEN t.name = 'Sales Call 1' THEN '2.1'
    WHEN t.name = 'Sales Call 2' THEN '3.1'
  END AS funnel_step,
  t.name AS kpi_name,
  MIN(a.activity_date) AS call_time
FROM {{ ref('stg_pipedrive__activity') }} a
JOIN {{ ref('stg_pipedrive__activity_types') }} t 
  ON a.type = t.activity_type_code
WHERE a.done = TRUE
  AND t.name IN ('Sales Call 1', 'Sales Call 2')
GROUP BY a.deal_id, t.name
