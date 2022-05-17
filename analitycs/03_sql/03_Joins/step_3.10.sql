SELECT 
      i.Platform
     , COUNT(DISTINCT i.DeviceID) AS RecordsCount

FROM default.installs AS i
    LEFT SEMI JOIN default.events AS ev ON i.DeviceID = ev.DeviceID

GROUP BY
    i.Platform