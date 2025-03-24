-- Revenue Trends:
-- How has monthly revenue changed over time?

select * from transactions;
select * from products

SELECT DATE_TRUNC('month', t.invoicedate) as month, round(sum(t.quantity*p.unitprice),0) as revenue
FROM transactions as t
INNER JOIN products as p
ON t.stockcode = p.stockcode
GROUP BY month
ORDER BY month;

-- What are the peak sales month for each year?

WITH monthly_sales AS (
	SELECT EXTRACT (YEAR FROM t.invoicedate) AS year,
	EXTRACT (MONTH FROM t.invoicedate) as month,
	ROUND(SUM(t.quantity * p.unitprice)) AS revenue
	FROM transactions AS t
	INNER JOIN products AS p
	on t.stockcode = p.stockcode
	GROUP BY year, month
)
SELECT * FROM (
	SELECT year, month, revenue,
	RANK() OVER(PARTITION BY year ORDER BY revenue DESC) as rank
	FROM monthly_sales
)  ranked_sales
WHERE rank = 1;

-- How does revenue vary by product category?

SELECT description, round(sum(p.unitprice * t.quantity)) as revenue from transactions as t
inner join products as p
on t.stockcode = p.stockcode
group by description
order by revenue desc;