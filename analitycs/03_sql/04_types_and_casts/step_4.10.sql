SELECT
     neighbourhood_cleansed
     , AVG(toFloat32OrNull(square_feet)) AS AvgSquareFeet

FROM default.listings

WHERE room_type = 'Entire home/apt'

GROUP BY neighbourhood_cleansed

ORDER BY
    AvgSquareFeet DESC
    
LIMIT 3