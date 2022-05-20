WITH cat_checks AS (
    SELECT
        UserID
        , AVG(Rub) AS avg_revenue
        , SUM(Rub) AS total_revenue
        , CASE
        -- А — средний чек покупателя менее 5 ₽
            WHEN avg_revenue < 5 THEN 'A'
        -- B — средний чек покупателя от 5-10 ₽
            WHEN avg_revenue >= 5 AND avg_revenue < 10 THEN 'B'
        -- C — средний чек покупателя от 10-20 ₽
            WHEN avg_revenue >= 10 AND avg_revenue < 20 THEN 'C'
        -- D — средний чек покупателя от 20 ₽
            ELSE 'D'
        END AS segment
    
    FROM default.checks
    
    GROUP BY UserID
    
    ORDER BY UserID ASC
)

SELECT
    segment
    , COUNT(UserID) AS user_count
    , SUM(total_revenue) AS total_revenue

FROM cat_checks

GROUP BY segment

ORDER BY total_revenue DESC