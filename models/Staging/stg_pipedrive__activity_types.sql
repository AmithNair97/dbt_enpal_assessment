SELECT id AS activity_type_id, 
name ,
type AS activity_type_code
FROM {{ source('pipedrive','activity_types') }}
