WITH rates AS(
    SELECT
         DISTINCT host_id
         , host_is_superhost
         , host_response_rate
    
    FROM default.listings
)

SELECT
    host_is_superhost
    , AVG(toInt16OrNull(replaceOne(host_response_rate, '%', ''))) AS AvgRate

FROM rates

GROUP BY host_is_superhost

ORDER BY AvgRate DESC

LIMIT 10