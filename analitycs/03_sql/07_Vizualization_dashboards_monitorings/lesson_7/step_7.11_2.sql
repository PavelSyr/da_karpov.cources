WITH invoice_by_day AS
(
    WITH
    (
        SELECT toStartOfYear(MAX(InvoiceDate)) + INTERVAL toDayOfYear(NOW()) - 1 DAY
        FROM default.retail
    ) AS fake_now_day
    

    SELECT
        day
        , InvoiceNo
        , Country
        , SUM(Quantity * UnitPrice) AS total_invoice
        , uniqExact(CustomerID) AS count_customers
    
    FROM default.retail
    
    WHERE 
        toStartOfDay(InvoiceDate) <= fake_now_day
        AND toStartOfDay(InvoiceDate) >= fake_now_day - INTERVAL {{ back_days }} DAY 
        AND Quantity > 0
        
        
    GROUP BY 
        toStartOfDay(InvoiceDate) AS day
        , InvoiceNo
        , Country
)

SELECT 
    day
    , Country
    , SUM(total_invoice) AS revenue
    , AVG(total_invoice) AS avg_revenue
    , SUM(count_customers) AS count_customers

FROM invoice_by_day

GROUP BY 
    day
    , Country

ORDER BY 
    day ASC
    , revenue DESC