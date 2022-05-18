--52.5200 с.ш., 13.4050 в.д – координаты центра Берлина

SELECT
     id
     , toFloat64OrNull(latitude) AS fLatitude
     , toFloat64OrNull(longitude) AS fLongitude
     , geoDistance(13.4050, 52.5200, fLongitude, fLatitude) AS DistToCenter

FROM default.listings

WHERE room_type = 'Private room'

ORDER BY
    DistToCenter ASC
    
LIMIT 10