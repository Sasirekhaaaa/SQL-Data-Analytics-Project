CREATE DATABASE ZEPTO_DB;
USE ZEPTO_DB;

#---DATA EXPLORATION

#---COUNT OF ROWS:
SELECT COUNT(*) FROM ZEPTO;

#SAMPLE DATA:
SELECT*FROM ZEPTO_V2 LIMIT 10;
DESCRIBE ZEPTO;

#NULL VALUES:
SELECT * FROM ZEPTO_V2
WHERE name IS NULL
OR
Category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

#---DIFFERENT PRODUCT CATEGORY:
SELECT DISTINCT Category
FROM ZEPTO_V2
ORDER BY Category;

#---PRODUCTS IN STOCK VS OUT OF STOCK:
SELECT outOfStock, COUNT(*)
FROM ZEPTO_V2
GROUP BY outOfStock;

#---PRODUCTS NAMES PRESENT MULTIPLE TIMES:
SELECT name, COUNT(*) AS 'NUMBER OF PRODUCT NAME'
FROM ZEPTO_V2
GROUP BY name
HAVING COUNT(*)>1
ORDER BY COUNT(*) DESC;

#---DATA CLEANING

#---PRODUCTS WITH PRICE = 0:
SELECT * FROM ZEPTO_V2
WHERE mrp =0 OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES =0;

DELETE FROM ZEPTO_V2
WHERE discountedSellingPrice = 0;


SELECT*FROM ZEPTO_V2
WHERE mrp = 0;

#---CONVERT PAISE TO RUPEES:
UPDATE ZEPTO_V2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM ZEPTO_V2;

#--Q1.Find the top 10 best-value products based on the discount percentage. 

SELECT DISTINCT name, mrp, discountPercent
FROM ZEPTO_V2
ORDER BY discountPercent DESC
LIMIT 10;

#--Q2.What are the products with high MRP but out of stock. 

SELECT DISTINCT name, mrp
FROM ZEPTO_V2
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;

#--Q3.Calculate Estimated Revenue for each Category. 

SELECT Category,
SUM(discountedSellingPrice * availableQuantity) AS TOTAL_REVENUE
FROM ZEPTO_V2
GROUP BY Category
ORDER BY TOTAL_REVENUE;

#--Q4.Find all products where MRP is greater than Rs.500 and discount is less than 10%. 

SELECT DISTINCT name, mrp, discountPercent
FROM ZEPTO_V2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

#--Q5.Identify the top 5 categories offering the highest average discount percentage. 

SELECT Category, 
ROUND(AVG(discountPercent),2) AS AVG_DISCOUNT
FROM ZEPTO_V2
GROUP BY Category
ORDER BY AVG_DISCOUNT DESC
LIMIT 5;

#--Q6.Find the price per gram for products above 100g and sort by best value. 

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms, 2) AS PRICE_PER_GRAM
FROM ZEPTO_V2
WHERE weightInGms >=100
ORDER BY PRICE_PER_GRAM;

#--Q7.Group the products into categories like Low, Medium, Bulk. 

SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
     WHEN weightInGms < 5000 THEN 'Medium'
     ELSE 'Bulk'
     END AS WEIGHT_CATEGORY
FROM ZEPTO_V2;

#--Q8.What is the total inventory weight per category. 

SELECT Category,
SUM(weightInGms * availableQuantity) AS TOTAL_WEIGHT
FROM ZEPTO_V2
GROUP BY Category
ORDER BY TOTAL_WEIGHT;