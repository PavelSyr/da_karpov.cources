SELECT
     host_id
     , groupArray(id) AS PlaceIds
     , AVG(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS AvgPrice
    
FROM default.listings

GROUP BY host_id

HAVING length(groupArray(id)) > 2

ORDER BY
    AvgPrice DESC
    , host_id DESC
    
LIMIT 10