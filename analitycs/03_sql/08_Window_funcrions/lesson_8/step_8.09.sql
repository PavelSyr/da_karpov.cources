-- Посмотрим, когда объемы продаж обычных (conventional) авокадо резко падали по сравнению с предыдущей неделей.
-- Возьмите данные по США в целом, посчитайте разницу между объемом продаж в неделю x (total_volume) и
-- количеством проданных авокадо в течение предыдущей недели. Значения запишите в новый столбец week_diff.

SELECT
    date
    , total_volume
    , region
    , type
    , total_volume - LAG(total_volume, 1) OVER w AS week_diff
    
FROM 
    avocado

WHERE 
    type = 'conventional'
    AND region IN ('TotalUS')
    
WINDOW w AS (ORDER BY date)
    
ORDER BY 
    region DESC
    , date