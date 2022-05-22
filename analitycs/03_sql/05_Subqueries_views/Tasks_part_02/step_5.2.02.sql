CREATE TABLE test.reviews_psyrnev_5102
( 
    listing_id UInt32
    , id UInt32
    , date DateTime('Europe/Moscow')
    , reviewer_id UInt32
    , reviewer_name String
    , comments String
) ENGINE = MergeTree
ORDER BY (listing_id, id)