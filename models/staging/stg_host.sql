seLECT id as host_id,
name,
CASE WHEN is_superhost = 'f' THEN 'FALSE' ELSE 'TRUE' END is_superhost,
created_at,
updated_at
FROM airbnb.raw.raw_hosts