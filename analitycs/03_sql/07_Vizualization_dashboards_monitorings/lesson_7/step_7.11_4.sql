WITH invoice_by_customers AS
(
    SELECT
        CustomerID
        , InvoiceNo
        , SUM(Quantity * UnitPrice) AS total_invoice
    
    FROM default.retail
        
    GROUP BY 
        CustomerID
        , InvoiceNo
)

SELECT 
    CustomerID
    , SUM(total_invoice) AS revenue
    , AVG(total_invoice) AS avg_revenue
    , CASE
        WHEN revenue < 0 THEN 'minus'
        WHEN revenue = 0 THEN 'zero'
        WHEN revenue <= 500 THEN 'S'
        WHEN revenue <= 10000 THEN 'M'
        WHEN revenue <= 30000 THEN 'ML'
        WHEN revenue <= 60000 THEN 'L'
        WHEN revenue <= 100000 THEN 'XL'
        WHEN revenue <= 200000 THEN 'XXL'
        ELSE 'XXXL'
    END AS Customer_group

FROM invoice_by_customers

GROUP BY CustomerID

ORDER BY revenue