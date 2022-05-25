SELECT
    Country
    , uniqExact(CustomerID) AS user_count

FROM default.retail

GROUP BY Country