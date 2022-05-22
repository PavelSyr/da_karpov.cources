INSERT INTO test.reviews_psyrnev_5102
SELECT
    1 AS listing_id
    , 1 AS id
    , '2018-01-01' AS date
    , 1 AS reviewer_id
    , 'rn1' AS reviewer_name
    , 'c1' AS comments
UNION ALL
SELECT
    2 AS listing_id
    , 2 AS id
    , now() AS date
    , 1 AS reviewer_id
    , 'rn1' AS reviewer_name
    , '' AS comments