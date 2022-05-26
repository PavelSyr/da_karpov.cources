SELECT
    CustomerID
    , SUM(Quantity) AS total_quantity

FROM default.retail

WHERE Country == 'Netherlands'

GROUP BY CustomerID

ORDER BY total_quantity DESC