# Retail Sales & Customer Segmentation Analysis
## Overview
This project analyzes retail sales data and segments customers based on their purchasing behavior. The dataset is sourced from an online retail store and is cleaned, normalized, and processed using Pandas before being analyzed using SQL for deeper insights.

### Data Processing
#### Data Cleaning and Normalization (Pandas)
Before running SQL queries, the dataset is processed using Pandas to clean and normalize the data:

**Handling Missing Values:**
* Dropped rows with missing descriptions.
* Filled missing CustomerID values with 1001 (Guest Checkout).
* Checked for duplicate entries. 
**Data Normalization: Split raw data into structured tables:**
* Customers (CustomerID, Country)
* Products (StockCode, Description, UnitPrice)
* Transactions (InvoiceNo, CustomerID, StockCode, Quantity, InvoiceDate)
**Exported Cleaned Data:** Saved the structured tables as CSV files for SQL analysis.

### SQL Analysis
Once the data is cleaned and stored in a SQL database, advanced SQL queries are used for in-depth analysis.
1. Customer Behavior Analysis

**Top Buyers:** Identified frequent customers by counting their purchases. <br>
**Average Order Value by Country:** Determined which regions have the highest spending customers.<br>
**Sales by Customer Demographics:** Analyzed total sales per country to highlight high-revenue regions.<br>
**Customer Lifetime Value (LTV):** <br>
Calculated average order value, total revenue, and total orders per customer.<br>
Used CTEs (Common Table Expressions) to estimate each customer's lifetime value.<br>

2. Product Trends Analysis<br>

**Best-Selling Products:** Ranked products by total sales revenue.<br>
**Demand by Category:** Aggregated revenue by product category to identify high-performing segments.<br>
**Seasonal Trends:** Analyzed peak sales periods to understand when demand is highest.<br>

3. Revenue Trends Analysis<br>

**Monthly Revenue Analysis:**
Aggregated total revenue per month to observe sales trends over time.
Used DATE_TRUNC to group transactions by month.<br>
**Peak Sales Months:**<br>
Used window functions (RANK OVER PARTITION) to determine the highest-grossing month for each year.<br>
**Revenue by Product Category:**<br>
Aggregated total revenue per product category to understand which products drive profitability.<br>

4. RFM Metrics for Customer Segmentation<br>
RFM (Recency, Frequency, Monetary) analysis was conducted to segment customers based on purchasing behavior.<br>

**Recency:** Days since the customer's last purchase.<br>
**Frequency:** Number of unique purchases made.<br>
**Monetary Value:** Total amount spent by the customer.<br>
**Customer Ranking:** Sorted customers based on spending to identify VIP customers.


### Tools Used

SQL (PostgreSQL/SQLite) – Core of the analysis.
Python (Pandas, NumPy) – Data preprocessing and cleaning.
Jupyter Notebook – Interactive exploration.
Excel/CSV – Data storage and import.




