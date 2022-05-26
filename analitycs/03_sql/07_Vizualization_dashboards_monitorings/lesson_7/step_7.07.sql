WITH country_month_invoices AS
(
    SELECT
        Country
        , month
        , InvoiceNo
        , SUM(Quantity * UnitPrice) AS total_invoice
    
    FROM default.retail
    
    WHERE Quantity > 0
        AND Country IN ('United Kingdom',
                        'Germany',
                        'France',
                        'Spain', 
                        'Netherlands',
                        'Belgium', 
                        'Switzerland',
                        'Portugal',
                        'Australia',
                        'USA')
    
    GROUP BY
        Country
        , toStartOfMonth(InvoiceDate) AS month
        , InvoiceNo
)

SELECT 
    Country
    , month
    , AVG(total_invoice) AS avg_invoice

FROM country_month_invoices

GROUP BY
    Country
    , month

ORDER BY avg_invoice DESC