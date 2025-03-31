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

**Top Buyers:** Identified frequent customers by counting their purchases.
**Average Order Value by Country:** Determined which regions have the highest spending customers.
**Sales by Customer Demographics:** Analyzed total sales per country to highlight high-revenue regions.
**Customer Lifetime Value (LTV):**
Calculated average order value, total revenue, and total orders per customer.
Used CTEs (Common Table Expressions) to estimate each customer's lifetime value.
2. Product Trends Analysis

**Best-Selling Products:** Ranked products by total sales revenue.
**Demand by Category:** Aggregated revenue by product category to identify high-performing segments.
**Seasonal Trends:** Analyzed peak sales periods to understand when demand is highest.

3. Revenue Trends Analysis

**Monthly Revenue Analysis:**
Aggregated total revenue per month to observe sales trends over time.
Used DATE_TRUNC to group transactions by month.
**Peak Sales Months:**
Used window functions (RANK OVER PARTITION) to determine the highest-grossing month for each year.
**Revenue by Product Category:**
Aggregated total revenue per product category to understand which products drive profitability.

4. RFM Metrics for Customer Segmentation
RFM (Recency, Frequency, Monetary) analysis was conducted to segment customers based on purchasing behavior.

**Recency:** Days since the customer's last purchase.
**Frequency:** Number of unique purchases made.
**Monetary Value:** Total amount spent by the customer.
**Customer Ranking:** Sorted customers based on spending to identify VIP customers.


### Tools Used

SQL (PostgreSQL/SQLite) – Core of the analysis.
Python (Pandas, NumPy) – Data preprocessing and cleaning.
Jupyter Notebook – Interactive exploration.
Excel/CSV – Data storage and import.




