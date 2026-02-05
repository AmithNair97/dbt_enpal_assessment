SELECT 
  activity_id,
  type,
  deal_id,            
  done::boolean AS done,
  CAST(due_to AS TIMESTAMP) AS activity_date  
FROM "postgres"."public"."activity"