SELECT
    host_id
    , multiSearchAnyCaseInsensitive(amenities, ['kitchen']) AS has_kitchen
    , cancellation_policy = 'flexible' AS has_cancellation_policy
    , CASE
    -- kitchen and cancellation_policy
        WHEN has_kitchen + has_cancellation_policy = 2 THEN 'good'
    -- only kitchen
        WHEN has_kitchen = 1 THEN 'ok'
    -- other cases
        ELSE 'not ok'
    END AS cat

FROM default.listings

ORDER BY cat ASC

LIMIT 5