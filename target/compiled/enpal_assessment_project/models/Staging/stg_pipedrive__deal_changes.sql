SELECT 
  deal_id,
  CAST(change_time AS TIMESTAMP) AS change_time,
  changed_field_key,
  new_value
FROM "postgres"."public"."deal_changes"