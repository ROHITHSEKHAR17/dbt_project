{{
  config(
    materialized = 'table',
    )
}}
SELECT
id as listings_id,
initcap(name) as name,
upper(room_type) as room_type,
minimum_nights,
host_id,
replace(price,'$','')::int as price,
created_at,
updated_at
FROM AIRBNB.RAW.RAW_LISTINGS