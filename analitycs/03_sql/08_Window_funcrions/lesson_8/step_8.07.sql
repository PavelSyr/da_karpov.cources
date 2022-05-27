-- Давайте посмотрим на продажи авокадо в двух городах (NewYork, LosAngeles) и
-- узнаем, сколько авокадо типа organic было продано в целом к концу каждой недели
-- (накопительная сумма продаж)

SELECT
    region
    , date
    , SUM(total_volume) OVER w AS avacado_count
    
FROM 
    avocado

WHERE 
    type = 'organic'
    AND region IN ('NewYork', 'LosAngeles')

WINDOW w AS 
(
    PARTITION BY region
    ORDER BY date
)
    
ORDER BY 
    region DESC
    , date