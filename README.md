# Zepto E-Commerce Data Analysis using SQL
## Project Overview
This project focuses on analyzing Zepto e-commerce product data using SQL and MySQL. 
The project includes data exploration, data cleaning, and business-oriented SQL queries 
to extract meaningful insights from the dataset.
## Project Objective
To apply SQL concepts to real-world e-commerce data and generate useful insights 
related to products, pricing, discounts, inventory, and estimated revenue.
## Tools & Technologies
- MySQL
- SQL
- MySQL Workbench
## Data Exploration
The project includes SQL queries to:
- Check the total number of records
- View sample data
- Understand table structure using DESCRIBE
- Identify NULL values
- Find different product categories
- Analyze products that are in-stock and out-of-stock
- Identify product names appearing multiple times
## Data Cleaning
The following data cleaning operations were performed:
- Identified products with zero MRP or discounted selling price
- Removed records where discounted selling price was zero
- Converted MRP and discounted selling price from paise to rupees using UPDATE
## Business Analysis
The project answers business-related questions such as:
- Find the top 10 best-value products based on discount percentage
- Identify products with high MRP that are out of stock
- Calculate estimated revenue for each category
- Find products with MRP greater than ₹500 and discount less than 10%
- Identify the top 5 categories with the highest average discount
- Calculate price per gram for products above 100g
- Categorize products into Low, Medium, and Bulk based on weight
- Calculate total inventory weight for each category
## SQL Concepts Used
- SELECT
- WHERE
- DISTINCT
- ORDER BY
- GROUP BY
- HAVING
- COUNT()
- SUM()
- AVG()
- ROUND()
- CASE WHEN
- UPDATE
- DELETE
- LIMIT
- Data Cleaning
- Aggregate Functions
## Project Files
- `Zepto E-Commerce Data Analysis.sql` – SQL queries used for data exploration, cleaning, and analysis
- `zepto_v2.csv` – Dataset used for the analysis
## Conclusion
This project provided hands-on experience in SQL-based data exploration, data cleaning, 
and business analysis using MySQL. The analysis demonstrates how SQL can be used to 
transform raw e-commerce data into meaningful business insights.
