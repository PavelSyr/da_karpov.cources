-- координаты центра Берлина:
-- 52.5200 с.ш. (latitude),
-- 13.4050 в.д. (longitude) 

WITH
    7 AS day_count
    , 100.0 AS min_price 
    , '2018-09-01' AS min_review_date
    , 52.5200 AS center_latitude
    , 13.4050 AS center_longitude
    , (
        SELECT 
            AVG(geoDistance(center_longitude, center_latitude, toFloat64OrNull(longitude), toFloat64OrNull(latitude)))
        FROM default.listings
      ) AS avg_to_center

SELECT
    host_id
    , id
    , geoDistance(center_longitude, center_latitude, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) AS dist_to_center
    , toFloat32OrNull(replaceRegexpAll(price, '[$,]','')) AS price_f
    , toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]','')) AS cleaning_fee_f
    -- , toFloat32OrNull(replaceRegexpAll(weekly_price, '[$,]','')) AS weekly_price_f
    , price_f + cleaning_fee_f / day_count AS total_price
    -- , multiSearchAnyCaseInsensitive(amenities, ['wifi']) AS has_wifi
    , toDateOrNull(last_review) AS last_review_d
    -- , last_review_d >= min_review_date AS has_review
    , toFloat32OrNull(review_scores_rating) as review_scores_rating_f
    
FROM default.listings

WHERE 
    total_price < min_price
	AND multiSearchAnyCaseInsensitive(amenities, ['wifi']) = 1
    -- AND has_wifi = 1
    AND last_review_d >= min_review_date

ORDER BY review_scores_rating_f DESC

LIMIT 10