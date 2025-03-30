{{ config(materialized='view') }}

SELECT
  datehour,
  title,
  views,
  "desktop" AS src,
  FORMAT_TIMESTAMP('%Y-%m-%d', datehour) AS date,
  CASE EXTRACT(DAYOFWEEK FROM datehour)
    WHEN 1 THEN 7
    WHEN 2 THEN 1
    WHEN 3 THEN 2
    WHEN 4 THEN 3
    WHEN 5 THEN 4
    WHEN 6 THEN 5
    WHEN 7 THEN 6
  END AS day_of_week,
  EXTRACT(HOUR FROM datehour) AS hour_of_day
FROM {{ source('test_dataset', 'assignment3_input_uk') }}

UNION ALL

SELECT
  datehour,
  title,
  views,
  "mobile" AS src,
  FORMAT_TIMESTAMP('%Y-%m-%d', datehour) AS date,
  CASE EXTRACT(DAYOFWEEK FROM datehour)
    WHEN 1 THEN 7
    WHEN 2 THEN 1
    WHEN 3 THEN 2
    WHEN 4 THEN 3
    WHEN 5 THEN 4
    WHEN 6 THEN 5
    WHEN 7 THEN 6
  END AS day_of_week,
  EXTRACT(HOUR FROM datehour) AS hour_of_day
FROM {{ source('test_dataset', 'assignment3_input_uk_m') }}