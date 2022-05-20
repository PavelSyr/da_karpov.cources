-- координаты центра Берлина:
-- 52.5200 с.ш. (latitude),
-- 13.4050 в.д. (longitude) 
WITH
    'Private room' AS target_room_type
    , 52.5200 AS center_latitude
    , 13.4050 AS center_longitude
    , (
        SELECT 
            AVG(geoDistance(center_longitude, center_latitude, toFloat64OrNull(longitude), toFloat64OrNull(latitude)))
        FROM default.listings
        WHERE room_type = target_room_type
      ) AS avg_to_center

SELECT
     host_id
     , id
     , toFloat64OrNull(latitude) AS fLatitude
     , toFloat64OrNull(longitude) AS fLongitude
     , geoDistance(center_longitude, center_latitude, fLongitude, fLatitude) AS dist_to_center

FROM default.listings

WHERE
    room_type = target_room_type
    AND geoDistance(center_longitude, center_latitude, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) < avg_to_center

ORDER BY
    dist_to_center DESC
    
LIMIT 10