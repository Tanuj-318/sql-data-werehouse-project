# 📊 Data Warehouse Project

This repository contains a **Data Warehouse Implementation Project** using a **Bronze-Silver-Gold Layering Pattern**, showcasing **SQL-based ETL**, **star schema design**, and structured data modeling for downstream analytics.

---

## 🧩 Project Structure

The project follows a layered data warehouse architecture:

### 1️⃣ Bronze Layer (Raw Data)

- **Purpose:** Stores unprocessed CRM/ERP sales, customer, product, and location data.
- **Object Type:** Tables
- **Load Method:** CSV ingestion (`TRUNCATE & INSERT` strategy)
- **Transformations:** None (raw data loaded as-is)

### 2️⃣ Silver Layer (Cleaned Data)

- **Purpose:** Cleansed and standardized data ready for transformation.
- **Object Type:** Tables
- **Transformations:**
  - Data type alignment
  - Null handling
  - Basic enrichment
  - De-duplication

### 3️⃣ Gold Layer (Business-Ready Analytics)

- **Purpose:** Provides analytical views for business reporting.
- **Object Type:** Views
- **Transformations:**
  - Joins across dimensions and fact tables
  - Aggregations (sales totals, customer-level KPIs)
  - Business rule application

---

## 🛠️ Technologies Used

| Tech Stack   | Details                            |
| ------------ | ---------------------------------- |
| **SQL**      | Table creation, ETL, queries      |
| **draw.io**  | Architecture & data flow diagrams |
| **CSV**      | Data ingestion files              |
| **GitHub**   | Version control, documentation    |

---

## 🔁 ETL Flow

✅ **Extract** data from CSV files (`cust_info.csv`, `sales_details.csv`, etc.) into the **Bronze Layer**  
✅ **Transform** data using SQL scripts into the **Silver Layer**  
✅ **Load** cleaned, enriched data into **Gold Layer views** ready for Power BI/Tableau dashboards and SQL analysis

---

## 📎 Key Files

| File                               | Description                                 |
| ---------------------------------- | ------------------------------------------- |
| `DATA WAREHOUSE LAYER DESC.drawio` | Layer-wise architecture overview diagram   |
| `Dataflow and Relationship.drawio` | ETL flow and table relationship diagram     |
| `TABLE OVERVIEW.drawio`            | Table structures and star schema overview  |
| `*.csv` files                      | Raw data sources for ETL pipeline          |
| `*.sql` files                      | Scripts for creating/loading tables & views |

---

## ✨ Highlights

✅ Layered architecture for modular ETL  
✅ Star schema design with fact and dimension tables  
✅ Practical SQL data modeling for beginner-to-intermediate DW projects  
✅ Ready for Power BI/Tableau visualization  
✅ Clean documentation for academic and portfolio demonstration


---

## 📈 Sample Analytics You Can Perform

- Total sales by product and category
- Customer-level purchase trends
- Location-wise sales analysis
- Top-selling products and high-value customers
- Seasonal sales performance

---

## 🤝 Contributions

Feel free to fork, raise issues, or open pull requests to improve this repository or adapt it to your datasets.

---

