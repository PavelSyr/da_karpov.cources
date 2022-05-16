SELECT d.DeviceID AS DeviceID 
    , COUNT(c.Rub) AS CountBuies
FROM checks as c
    INNER JOIN devices AS d ON d.UserID = c.UserID
WHERE toStartOfMonth(toDateTime(c.BuyDate)) = '2019-10-01'
GROUP BY DeviceID
HAVING COUNT(c.Rub) >= 1
ORDER BY DeviceID
LIMIT 100