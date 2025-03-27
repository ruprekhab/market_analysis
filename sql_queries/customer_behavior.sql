-- CUSTOMER BEHAVIOR:
-- Who are the most frequent buyers?

SELECT t.customerid, count(t.customerid) AS customer_frequency FROM customers c
INNER JOIN transactions t 
ON t.customerid = c.customerid
GROUP BY t.customerid
ORDER BY customer_frequency DESC
LIMIT 10;

-- What are the average order values by customer locations?

SELECT c.country, ROUND(AVG(t.quantity * p.unitprice)) AS order_value FROM customers c
INNER JOIN transactions t
ON t.customerid = c.customerid
INNER JOIN products p
ON t.stockcode = p.stockcode
GROUP BY country
ORDER BY order_value DESC;

-- What are the total sales by customer demographic (e.g., country)?
SELECT sum(t.quantity) AS sales, c.country
FROM transactions t
INNER JOIN customers c
ON c.customerid = t.customerid
GROUP BY c.country
HAVING sum(t.quantity) > 0
ORDER BY sales DESC;


-- what is the lifetime value of customers
-- Create a CTE to calculate average order value, purchase frequency, and revenue per customer
WITH customer_metrics AS(
SELECT t.customerid,
ROUND(AVG(t.quantity * p.unitprice)) AS avg_order_value,
ROUND(SUM(t.quantity * p.unitprice)) AS total_revenue,
COUNT(DISTINCT t.invoicedate) AS total_orders
FROM transactions AS t
INNER JOIN products AS p
ON t.stockcode = p.stockcode
GROUP BY t.customerid),

ltv AS (
SELECT avg_order_value,
total_revenue,
total_orders,
round(avg_order_value * total_orders) AS ltv_value
	FROM customer_metrics)
SELECT * FROM ltv
order by ltv_value DESC;
	
