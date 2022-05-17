SELECT
    DISTINCT ev.DeviceID AS EvDeviceID

FROM default.installs AS i
	RIGHT ANTI JOIN default.events AS ev ON i.DeviceID = ev.DeviceID
	
ORDER BY
    EvDeviceID DESC

LIMIT 10