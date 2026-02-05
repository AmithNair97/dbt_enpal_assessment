
  
    

  create  table "postgres"."public_pipedrive_analytics"."stg_pipedrive__activity__dbt_tmp"
  
  
    as
  
  (
    SELECT 
  activity_id,
  type,
  deal_id,            
  done::boolean AS done,
  CAST(due_to AS TIMESTAMP) AS activity_date  
FROM "postgres"."public"."activity"
  );
  