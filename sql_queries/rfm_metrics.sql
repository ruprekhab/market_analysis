-- Calculate RFM Metrics
-- Create a reference date
-- CTE to get the latest invoice date for calculating recency

WITH latest_date AS (
    SELECT MAX(invoicedate) AS last_date FROM transactions
),
rfm_metrics AS (
    SELECT 
        t.customerid,
        
        -- Calculate recency: difference in days between the latest date and each customer's last purchase date.AGE() calculates the difference between two timestamps, EXTRACT('day' FROM AGE(date1, date2)) pulls out the difference in days
        EXTRACT('day' FROM AGE((SELECT last_date FROM latest_date), MAX(t.invoicedate))) AS recency,
        
        -- Frequency: count of unique invoice dates per customer
        COUNT(DISTINCT t.invoicedate) AS frequency,
        
        -- Monetary value: total revenue (quantity * unit price)
        SUM(t.quantity * p.unitprice) AS monetary_value
        
    FROM transactions t
    INNER JOIN products p ON p.stockcode = t.stockcode
    GROUP BY t.customerid
)
SELECT * 
FROM rfm_metrics
ORDER BY monetary_value DESC;  -- Order customers by total spending



