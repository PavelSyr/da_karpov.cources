CREATE VIEW test.reviews_psyrnev_5205_view AS (
    SELECT
        reviewer_id
        , COUNT(id) AS reviews_count

    FROM test.reviews_psyrnev_5102

    GROUP BY reviewer_id
)