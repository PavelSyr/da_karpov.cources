SELECT
     room_type
     , AVG(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS AvgPrice
     , AVG(toFloat32OrNull(replaceRegexpAll(security_deposit, '[$,]', ''))) AS AvgSecurityDeposit
     , AVG(toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]', ''))) AS AvgCleaningFee
    
FROM default.listings

GROUP BY room_type

ORDER BY
    AvgSecurityDeposit DESC
    
LIMIT 10