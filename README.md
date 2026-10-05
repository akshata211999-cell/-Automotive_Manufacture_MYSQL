# Automotive Manufacturing Data Analysis Using SQL
## 📌 Project Overview
This project focuses on analyzing automotive manufacturing and supplier data using **MySQL**. The goal is to extract meaningful business insights related to orders, suppliers, part categories, delivery performance, lead time, defects, quality, and procurement cost.
The project uses SQL queries to perform data analysis using filtering, aggregation, grouping, joins, subqueries, CASE statements, and other SQL concepts.
---
## 🎯 Business Objectives
The main objectives of this project are:
* Analyze total manufacturing orders and ordered quantities.
* Compare ordered quantity with delivered quantity.
* Identify delayed orders and suppliers.
* Calculate shortage quantities.
* Analyze supplier delivery performance.
* Analyze defects and quality status.
* Calculate defect percentage.
* Analyze supplier lead time.
* Identify suppliers with high defects and high lead time.
* Analyze procurement cost by supplier.
* Compare suppliers and part categories.
* Analyze supplier information using JOIN operations.
---
## 🛠️ Tools Used
* **MySQL**
* **MySQL Workbench**
* **GitHub**
---
## 📂 Dataset Structure
The project contains two main tables:
### 1. `automotive_manufacture`
This table contains automotive manufacturing order and supplier performance information.
Example columns include:
* Order_ID
* Supplier_ID
* Supplier_Name
* Part_Category
* Ordered_Qty
* Delivered_Qty
* On_Time
* Lead_Time_Days
* Defect_Qty
* Quality_Status
* Total_Cost
### 2. `supplier_details`
This table contains additional supplier information.
Example columns include:
* Supplier_ID
* Supplier_Name
* Supplier_Location
The two tables are connected using the **Supplier_ID** column.
---
## 🔍 Key SQL Analysis
The project includes analysis such as:
### Order Analysis
* Find the total number of manufacturing orders.
* Find total ordered quantity.
* Find total delivered quantity.
* Find orders where delivered quantity is less than ordered quantity.
* Calculate shortage quantity.
* Analyze orders by part category.
### Delivery Analysis
* Find the supplier with the most delayed orders.
* Find delayed orders based on `On_Time` status.
* Calculate supplier on-time performance.
* Identify suppliers with poor delivery performance.
* Analyze average lead time by supplier.
* Identify suppliers with high lead time.
### Quality Analysis
* Calculate total defect quantity.
* Calculate defect percentage.
* Find suppliers with the highest defects.
* Find suppliers with poor quality performance.
* Analyze `Quality_Status`.
* Find suppliers with both high defects and high lead time.
### Supplier Analysis
* Find the total number of orders for each supplier.
* Find suppliers with the highest number of orders.
* Find suppliers with the most delayed orders.
* Analyze supplier delivery performance.
* Analyze supplier lead time.
* Analyze supplier defect performance.
* Calculate total procurement cost for each supplier.
### Part Category Analysis
* Find the part category with the highest demand.
* Calculate total ordered quantity by part category.
* Calculate total delivered quantity by part category.
* Compare ordered and delivered quantities across categories.
### Supplier Details Analysis
* Display suppliers located in Bengaluru.
* Display all supplier names and their `On_Time` status.
* Identify suppliers without manufacturing records.
* Combine manufacturing and supplier information using JOIN operations.
---
## 🔗 SQL Concepts Used
This project demonstrates the following SQL concepts:
* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* Aggregate Functions
  * `SUM()`
  * `COUNT()`
  * `AVG()`
  * `MIN()`
  * `MAX()`
* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* `UNION`
* Subqueries
* `LIMIT`
---
## 📁 Project Structure
```text
Automotive-Manufacturing-MySQL-Analysis/
│
├── README.md
│
├── Dataset/
│   ├── automotive_manufacture.csv
│   └── supplier_details.csv
│
├── SQL/
│   └── Automotive.sql
│
├── Reports/
│   ├── Automotive_Manufacture_Report.pdf
│   └── Automotive_Manufacture_Practical_Report.pdf
│
└── Screenshots/
    └── SQL_Results.png

CREATE DATABASE automotive_db;
USE automotive_db;
automotive_manufacture
supplier_details
SELECT Supplier_Name,
       COUNT(*) AS Total_Orders,
       SUM(CASE WHEN On_Time = 'No' THEN 1 ELSE 0 END) AS Delayed_Orders
FROM automotive_manufacture
GROUP BY Supplier_Name
ORDER BY Delayed_Orders DESC;
👩‍💻 Author
Akshata Pattar
Aspiring Data Analyst | SQL | Excel | Power BI | Python
### Recommended GitHub repository name
```text
Automotive-Manufacturing-MySQL-Analysis
