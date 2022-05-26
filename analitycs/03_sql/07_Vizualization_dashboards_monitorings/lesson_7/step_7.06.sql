WITH country_invoices AS
(
    SELECT
        Country
        , InvoiceNo
        , SUM(Quantity * UnitPrice) AS total_invoice
    
    FROM default.retail
    
    WHERE Quantity > 0
    
    GROUP BY
        Country
        , InvoiceNo
)

SELECT 
    Country
    , AVG(total_invoice) AS avg_invoice

FROM country_invoices

GROUP BY Country

ORDER BY avg_invoice DESC