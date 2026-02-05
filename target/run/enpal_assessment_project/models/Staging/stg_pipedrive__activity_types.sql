
  
    

  create  table "postgres"."public_pipedrive_analytics"."stg_pipedrive__activity_types__dbt_tmp"
  
  
    as
  
  (
    SELECT id AS activity_type_id, 
name ,
type AS activity_type_code
FROM "postgres"."public"."activity_types"
  );
  