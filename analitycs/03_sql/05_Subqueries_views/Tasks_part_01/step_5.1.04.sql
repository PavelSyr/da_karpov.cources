SELECT 
    id
    , toFloat32OrNull(review_scores_rating) AS review_scores_rating_f
    , reviews_per_month

FROM default.listings

WHERE 
    toFloat32OrNull(review_scores_rating) > (SELECT AVG(toFloat32OrNull(review_scores_rating)) FROM default.listings)
    AND reviews_per_month < 3

ORDER BY
    review_scores_rating_f DESC,
    reviews_per_month DESC

LIMIT 100