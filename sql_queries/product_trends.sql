-- Product Trends

-- What are the top 10 best-selling products based on total sales?

SELECT p.description, SUM(t.quantity) AS sales
FROM products AS p
INNER JOIN transactions AS t 
ON p.stockcode = t.stockcode
WHERE t.quantity > 0
GROUP BY p.description
ORDER BY sales DESC
LIMIT 10;

-- Which products have seen the highest growth in sales over time?
 

with monthly_sales as (select extract (month from invoicedate) as month, p.description, round(sum(t.quantity * p.unitprice)) as revenue
from transactions as t
inner join products as p
on p.stockcode = t.stockcode
where t.quantity >0
group by p.description, month)
select month, description, revenue - LAG(revenue) over(partition by description) as revenue_growth
from monthly_sales
order by revenue_growth desc;

-- What are the top revenue-generating products per month?
WITH monthly_sales AS (
    SELECT EXTRACT(MONTH FROM t.invoicedate) AS month, 
           p.description, 
           ROUND(SUM(t.quantity * p.unitprice)) AS revenue
    FROM transactions AS t
    INNER JOIN products AS p
    ON p.stockcode = t.stockcode
    WHERE t.quantity > 0
    GROUP BY EXTRACT(MONTH FROM t.invoicedate), p.description
),
ranked_products AS (
    SELECT month, 
           description, 
           revenue, 
           RANK() OVER(PARTITION BY month ORDER BY revenue DESC) AS rank
    FROM monthly_sales
)
SELECT month, description, revenue
FROM ranked_products
WHERE rank = 1  -- Only top revenue-generating products per month
ORDER BY month;


