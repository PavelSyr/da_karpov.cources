SELECT
	  i.Platform
-- 	, SUM(CASE ev.DeviceID WHEN 0 THEN 0 ELSE 1) / COUNT(i.DeviceID) AS CTR
    , SUM(ev.DeviceID != 0) / COUNT(i.DeviceID) AS CTR

FROM default.installs AS i
	ANY LEFT JOIN default.events AS ev ON i.DeviceID = ev.DeviceID

GROUP BY
	i.Platform