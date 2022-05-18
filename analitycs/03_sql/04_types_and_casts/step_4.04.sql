SELECT
     toStartOfMonth(toDateOrZero(host_since)) AS host_since_month
    , COUNT(DISTINCT host_id) AS CountHosts

FROM default.listings AS l

GROUP BY
    toStartOfMonth(toDateOrZero(host_since))
    
ORDER BY CountHosts DESC

LIMIT 10