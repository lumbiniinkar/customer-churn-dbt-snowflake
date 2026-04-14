# customer-churn-dbt-snowflake
# Customer Churn Analytics Pipeline (dbt + Snowflake)

## What this project is about

This project is an end-to-end data pipeline where I worked on transforming raw e-commerce data into meaningful insights about customer behavior.

The main goal was to understand:

* who are the valuable customers
* which customers are likely to stop buying

---

## Problem I was solving

Raw data (orders, items, customers) is messy and not directly useful.

For example:

* one order can have multiple rows
* customer-level insights are not available directly

So I built a pipeline to:

* clean the data
* aggregate it properly
* create customer-level metrics
* identify churn risk

---

## How the pipeline is structured

I followed a layered approach using dbt:

RAW → STAGING → FACT → INTERMEDIATE → MART

* **Raw** → original data from Snowflake
* **Staging** → cleaned and renamed columns
* **Fact** → order-level aggregation
* **Intermediate** → customer metrics + RFM
* **Mart** → final business tables

---

## Key things I built

### 1. Staging models

Cleaned raw tables and standardized column names.

---

### 2. Fact table (`fct_orders`)

Created a proper order-level table.

Reason:
Order items had multiple rows per order, so I aggregated them to avoid duplication issues.

---

### 3. Customer metrics (`int_customer_metrics`)

Built customer-level features:

* total orders
* total spend
* last order date

---

### 4. RFM model (`int_customer_rfm`)

Used:

* Recency → days since last order
* Frequency → number of orders
* Monetary → total spend

Important fix:
Since the dataset is old, I used the **latest date in dataset** instead of current date to calculate recency.

---

### 5. Customer segmentation (`mart_customer_segments`)

Classified customers into:

* high_value
* at_risk_high_value
* low_value_churned
* regular

---

### 6. Churn risk table (`mart_churn_risk_highvalue`)

Filtered high-value customers who haven’t ordered in a long time.

This is useful for:

* retention campaigns
* targeted marketing

---

## Tech used

* dbt
* Snowflake
* SQL
* GitHub

---

## What I learned

* importance of defining correct data grain
* handling duplicates in transactional data
* structuring models in dbt
* writing business logic in SQL
* dealing with time-based issues in old datasets

---

## Dataset

Used Olist e-commerce dataset from Kaggle:

* orders
* order_items
* customers
* reviews
* products

---

## Future improvements

* better RFM scoring (percentiles instead of fixed values)
* dashboard integration
* more data tests

---

## Author

Lumbini Inkar
