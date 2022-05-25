CREATE TABLE IF NOT EXISTS test.retail_psyrnev_701
( 
    InvoiceNo String
    , StockCode String
    , Description String
    , Quantity Int32
    , InvoiceDate DateTime('Europe/London')
    , UnitPrice Decimal64(3)
    , CustomerID UInt32
    , Country String
) ENGINE = MergeTree
ORDER BY (InvoiceDate, CustomerID)