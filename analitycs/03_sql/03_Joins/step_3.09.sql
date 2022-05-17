SELECT 
      i.Source AS Source
    , i.Platform AS Platform
    , AVG(ev.events) AS AvgEvents

FROM default.events AS ev
    INNER JOIN default.installs AS i ON ev.DeviceID = i.DeviceID

GROUP BY 
    i.Source,
    i.Platform
    
ORDER BY AvgEvents DESC

LIMIT 100