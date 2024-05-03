{# 
  All events weekly from a project
#}
{{ 
  config(meta = {
    'sync_to_db': True
  }) 
}}

select
  e.project_id,
  e.event_type,
  TIMESTAMP_TRUNC(e.bucket_day, week) as bucket_week,
  SUM(e.amount) as amount
from {{ ref('events_daily_from_project') }} as e
where e.project_id is not null
group by 1, 2, 3
