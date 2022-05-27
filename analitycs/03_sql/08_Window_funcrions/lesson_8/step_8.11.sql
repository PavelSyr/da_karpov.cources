-- Теперь посчитайте скользящее среднее цены авокадо (average_price) в Нью-Йорке с разбивкой по типу авокадо.
-- В качестве окна используйте текущую неделю и предыдущие две
-- (обратите внимание, что в данной таблице в строках содержатся данные за неделю, а не за один день).
-- Например 04/01/15, 11/01/15 и 18/01/15 для подсчета значения для 18/01/15.

-- В качестве ответа укажите полученное значение для обычных (conventional) авокадо за 17/04/16.

SELECT
    date
    , type
    , average_price
    , AVG(average_price) OVER w AS rolling_avg
    
FROM 
    avocado

WHERE region = 'NewYork'
    
WINDOW w AS
(
    PARTITION BY type
    ORDER BY date
    RANGE BETWEEN '14 day' PRECEDING AND '0 day' FOLLOWING
)