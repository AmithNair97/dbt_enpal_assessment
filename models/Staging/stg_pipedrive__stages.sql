SELECT stage_id, stage_name
FROM {{ source('pipedrive','stages') }}
