WITH
-- scalar value of avg uniq reviewer_id count
    (
        SELECT 
            AVG(count_reviews)

        FROM
            (
                SELECT 
                    COUNT(DISTINCT reviewer_id) AS count_reviews
                
                FROM default.reviews
                
                GROUP BY 
                    listing_id
            )
    ) AS avg_count_reviews
-- subquery from reviews table
    , reviews_unique AS (
        SELECT
            listing_id
            , COUNT(DISTINCT reviewer_id) AS count_reviews
        
        FROM default.reviews
        
        GROUP BY listing_id
    )
-- subquery from calendar_summary table
    , available_in_calendar AS (
        SELECT DISTINCT listing_id
        
        FROM default.calendar_summary
        
        WHERE available = 't'    
    )

-- main query
SELECT 
    ac.listing_id AS listing_id
    , ru.count_reviews AS count_reviews

FROM available_in_calendar AS ac
    INNER JOIN reviews_unique AS ru ON ac.listing_id = ru.listing_id
    
WHERE ru.count_reviews > avg_count_reviews

ORDER BY listing_id ASC

LIMIT 100