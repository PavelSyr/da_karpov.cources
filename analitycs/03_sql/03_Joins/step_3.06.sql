SELECT i.Source, COUNT(DISTINCT c.UserID) AS CountUniqueUsers
FROM default.installs AS i
    INNER JOIN default.devices AS d ON i.DeviceID = d.DeviceID
    INNER JOIN default.checks AS c ON c.UserID = d.UserID
GROUP BY i.Source
ORDER BY i.Source DESC
LIMIT 10