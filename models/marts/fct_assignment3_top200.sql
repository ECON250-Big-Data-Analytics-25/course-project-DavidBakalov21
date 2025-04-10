{{ config(materialized='table') }}

WITH no_meta_cte AS (
  SELECT
    *
  FROM {{ ref('int_assignment3_uk_wiki') }}
  WHERE is_meta_page = FALSE
),
calculations_cte AS (
  SELECT
    title,
    SUM(views) AS total_views,
    SUM(CASE WHEN src = 'mobile' THEN views ELSE 0 END) AS total_mobile_views
  FROM no_meta_cte
  GROUP BY title
),
final AS (
  SELECT
    *,
    SAFE_DIVIDE(total_mobile_views, total_views) * 100 AS mobile_percentage
  FROM calculations_cte
  ORDER BY total_views DESC
  LIMIT 200
)
SELECT * FROM final ORDER BY mobile_percentage