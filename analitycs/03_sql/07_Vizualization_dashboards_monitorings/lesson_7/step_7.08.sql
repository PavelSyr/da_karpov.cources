WITH country_invoices AS
(
    SELECT
        Country
        , InvoiceNo
        , SUM(Quantity) AS total_quantity
    
    FROM default.retail
    
    GROUP BY
        Country
        , InvoiceNo
)

SELECT
    Country
    , AVG(total_quantity) AS avg_quantity

FROM country_invoices

GROUP BY Country

ORDER BY avg_quantity DESC