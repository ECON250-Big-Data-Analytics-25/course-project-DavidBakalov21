{{ config(materialized='view') }}
SELECT
  *,
 CASE 
    WHEN SPLIT(title, ':')[OFFSET(0)] IN (
      'Користувач', 'Вікіпедія', 'Файл', 'MediaWiki', 'Шаблон', 'Довідка',
      'Категорія', 'Портал', 'Модуль', 'Додаток', 'Обговорення',
      'Обговорення_користувача', 'Спеціальна', 'Медіа', 'InfoboxImage'
    )
    THEN SPLIT(title, ':')[OFFSET(0)]
    ELSE "Not meta page"
  END AS meta_page_type,
  CASE 
    WHEN SPLIT(title, ':')[OFFSET(0)] IN (
      'Користувач', 'Вікіпедія', 'Файл', 'MediaWiki', 'Шаблон', 'Довідка',
      'Категорія', 'Портал', 'Модуль', 'Додаток', 'Обговорення',
      'Обговорення_користувача', 'Спеціальна', 'Медіа', 'InfoboxImage'
    )
    THEN TRUE ELSE FALSE
  END AS is_meta_page
FROM {{ ref('stg_assignment3_uk_wiki') }}