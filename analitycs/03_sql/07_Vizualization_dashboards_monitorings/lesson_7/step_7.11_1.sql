WITH invoice_by_day AS
(
    SELECT
        day
        , InvoiceNo
        , SUM(Quantity * UnitPrice) AS total_invoice
    
    FROM default.retail
    
    WHERE
        InvoiceDate >= '{{ date_range.start }}'
        AND InvoiceDate <= toDate('{{ date_range.end }}') + INTERVAL 1 DAY 
        AND Quantity > 0
        
    GROUP BY 
        toStartOfDay(InvoiceDate) AS day
        , InvoiceNo
)

SELECT 
    day
    , SUM(total_invoice) AS revenue
    , AVG(total_invoice) AS avg_revenue

FROM invoice_by_day

GROUP BY day