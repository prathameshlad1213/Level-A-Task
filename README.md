# Level-A-Task
# Northwind SQL Assignment – Level A Tasks

This repository contains solutions to **Level A SQL Tasks** using the Adventureworks sample database. The queries cover beginner to intermediate SQL concepts such as filtering, sorting, aggregation, grouping, joins, and subqueries.

## 🧠 Prerequisites

To run these queries, make sure:

- You have **MySQL Workbench**, **Azure Data Studio**, or any compatible SQL client installed.
- The **Adventureworks** database is properly imported and available.
  - You can use the `.bak` file with SQL Server (via Docker or native).
  - Or import a `.sql` dump for MySQL/MariaDB.

---

## 📁 File Structure

- `Adventureworks.sql`: Contains all 42 SQL queries as per the task.
- `README.md`: You are here!

---

## ✅ List of Queries

1. List of all customers  
2. Customers where company name ends with ‘N’  
3. Customers living in **Berlin** or **London**  
4. Customers from **UK** or **USA**  
5. All products sorted by product name  
6. Products starting with ‘A’  
7. Customers who placed at least one order  
8. London customers who ordered **Chai**  
9. Customers who never placed an order  
10. Customers who ordered **Tofu**  
11. Details of the first order  
12. Most expensive order date  
13. OrderID and average quantity per order  
14. OrderID with min and max quantity  
15. Managers and total employees reporting to them  
16. Orders with total quantity > 300  
17. Orders placed on or after `1996-12-31`  
18. Orders shipped to **Canada**  
19. Orders with total > 200  
20. Sales by country  
21. Number of orders per contact name  
22. Contact names with > 3 orders  
23. Discontinued products ordered between `1997-01-01` and `1998-01-01`  
24. Employees and their supervisors  
25. Employee-wise total sales  
26. Employees with `a` in FirstName  
27. Managers with more than 4 reports  
28. Orders and product names  
29. Orders by best customer  
30. Orders by customers without Fax  
31. Postal codes where **Tofu** was shipped  
32. Products shipped to **France**  
33. Product names and categories from supplier **Specialty Biscuits, Ltd.**  
34. Products never ordered  
35. Products with stock < 10 and on order = 0  
36. Top 10 countries by sales  
37. Employee orders for customer IDs between `A` and `AO`  
38. Date of most expensive order  
39. Product name and total revenue  
40. Supplier ID and number of products offered  
41. Top 10 customers by revenue  
42. Total revenue of the company  

---

## ⚙️ How to Run

1. Open your SQL client (MySQL Workbench, Azure Data Studio, etc.)
2. Connect to your Northwind database
3. Copy and paste queries from `Adventureworks.sql` or run them one-by-one
4. View the results in the result grid

---

## 📝 Notes

- The database structure must follow the **classic Northwind schema** with standard tables:
  - `Customers`, `Orders`, `Order Details`, `Employees`, `Products`, `Suppliers`, `Categories`, etc.
- Some queries use `TOP` or `LIMIT` depending on SQL flavor. Modify accordingly if using a different SQL engine.

---

## 👤 Author

**Prathamesh Lad**  
_SQL Practice Repository - Level A_

---

## 📜 License

This project is for educational use. No license restrictions.
