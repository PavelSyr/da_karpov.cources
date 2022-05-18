SELECT
     host_id
     , groupArray(id) AS PlaceIds
     , MAX(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS MaxPrice
     , MIN(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS MinPrice
     , MaxPrice - MinPrice AS DiffPrice
    
FROM default.listings

GROUP BY host_id

ORDER BY
    DiffPrice DESC
    
LIMIT 10