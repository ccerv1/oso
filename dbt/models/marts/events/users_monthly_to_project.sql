SELECT
  project_slug,
  segment_type,
  bucket_month,
  SUM(amount) AS amount
FROM 
  (
    SELECT * FROM {{ ref('int_devs') }}
    UNION ALL
    SELECT * FROM {{ ref('int_users') }}
  ) combined_data
GROUP BY
  project_slug,
  segment_type,
  bucket_month