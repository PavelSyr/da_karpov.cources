SELECT i.Source
    , SUM(c.Rub) AS TotalRevenue
    , MIN(c.Rub) AS MinRevenue
    , AVG(c.Rub) AS AvgRevenue
    , MAX(c.Rub) AS MaxRevenue
FROM default.installs AS i
    INNER JOIN default.devices AS d ON i.DeviceID = d.DeviceID
    INNER JOIN default.checks AS c ON c.UserID = d.UserID
GROUP BY i.Source
ORDER BY i.Source DESC
LIMIT 100