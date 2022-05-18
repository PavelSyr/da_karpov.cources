SELECT
     neighbourhood_cleansed
     , AVG(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS AvgPrice

FROM default.listings

GROUP BY neighbourhood_cleansed

ORDER BY
    AvgPrice ASC
    
LIMIT 10