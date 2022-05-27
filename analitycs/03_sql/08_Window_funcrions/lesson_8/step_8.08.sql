-- Теперь добавьте разбиение по каждому году (year).
-- Таким образом, в конце февраля 2016 года объем составит уже не продажи за 2015 и январь-февраль 2016,
-- а только январь-февраль 2016.

-- Когда объемы продаж органических авокадо в Нью-Йорке превысили объемы продаж в Лос-Анджелесе?

-- Для решения задачи постройте график объема продаж в двух городах, где по оси X будет лежать дата.

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
    PARTITION BY 
        region
        , year
    ORDER BY date
)
    
ORDER BY 
    region DESC
    , date