{{
    
      config(
        materialized = 'table',
        )
    
}}

SELECT 
listing_id,
date(date) as date,
reviewer_name,
initcap(comments)as comments,
upper(sentiment) as sentiment
FROM AIRBNB.RAW.RAW_REVIEWS