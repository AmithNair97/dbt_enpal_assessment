
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_deal_stage_entries__dbt_tmp"
  
  
    as
  
  (
    WITH stage_changes AS (
  SELECT dc.deal_id, 
         CAST(dc.new_value AS INTEGER) AS stage_id,
         dc.change_time,
         ROW_NUMBER() OVER (
             PARTITION BY dc.deal_id, dc.new_value 
             ORDER BY dc.change_time
         ) AS stage_change_rank
  FROM "postgres"."public_pipedrive_analytics"."stg_pipedrive__deal_changes" dc
  WHERE dc.changed_field_key = 'stage_id'
)
SELECT sc.deal_id, sc.stage_id, sc.change_time AS stage_change_time
FROM stage_changes sc
JOIN "postgres"."public_pipedrive_analytics"."stg_pipedrive__stages" s 
  ON sc.stage_id = s.stage_id
WHERE sc.stage_change_rank = 1
  );
  