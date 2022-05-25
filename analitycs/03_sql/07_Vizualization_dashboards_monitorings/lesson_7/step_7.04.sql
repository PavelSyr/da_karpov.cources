SELECT
    month
    , Country
    , uniqExact(CustomerID) AS user_count

FROM default.retail

WHERE
    UnitPrice > 0
    AND Country IN ('Netherlands', 'Australia', 'United Kingdom')

GROUP BY Country, toStartOfMonth(InvoiceDate) AS month

ORDER BY 
    month ASC,
    Country ASC