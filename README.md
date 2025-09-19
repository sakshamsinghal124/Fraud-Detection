# Fraud-Detection
## Overview
This project analyzes simulated banking transactions to detect fraudulent activities. Using the **PaySim dataset**, I designed a **MySQL-based analytical workflow** to explore transaction patterns, identify high-risk accounts, and generate actionable insights for fraud detection.

## Dataset
- **Source:** [PaySim Dataset on Kaggle](https://www.kaggle.com/datasets/ealaxi/paysim1)  
- **Description:** Contains simulated mobile money transactions with fields such as:
  - `step` – time step of transaction  
  - `type` – transaction type (PAYMENT, TRANSFER, CASH_OUT, etc.)  
  - `amount` – transaction amount  
  - `nameOrig` – sender account  
  - `nameDest` – recipient account  
  - `isFraud` – indicates fraudulent transaction  
  - `isFlaggedFraud` – flagged transactions  

> **Note:** Due to dataset size (~6M rows), a **sample CSV** is included for testing.

## Project Structure
Fraud-Detection/
├── SQL/
│ ├── 01_create_database.sql # Create MySQL database
│ ├── 02_create_table.sql # Define transactions table schema
│ ├── 03_load_data.sql # Load CSV data into MySQL
│ ├── 04_queries.sql # 15 advanced analytical queries
├── Dataset/
│ └── sample_transactions.csv # Small sample for testing
└── README.md


## Key Queries & Analysis
1. Count of transactions by type and fraud ratio  
2. Top 10 accounts with highest fraudulent activity  
3. Total transaction amounts per account (sender & receiver)  
4. Average, min, max transaction amount for fraud vs non-fraud  
5. Identify suspicious accounts sending and receiving fraudulent transactions  
6. Transactions flagged by system vs actual fraud  
7. Fraudulent transaction trends over time (step-based analysis)  
8. Ratio of fraud per transaction type  
9. High-risk accounts with multiple frauds in a row  
10. Aggregate insights for fraud prevention and monitoring  

> Queries are optimized for MySQL and ready to run on the full PaySim dataset.

## Setup Instructions
1. **Install MySQL** and MySQL Workbench  
2. Open `01_create_database.sql` → Run to create `FraudDB`  
3. Open `02_create_table.sql` → Run to create `Transactions` table  
4. Load data using `03_load_data.sql` (enable `local_infile=1` for large dataset)  
5. Run analytical queries from `04_queries.sql`  

## Skills Demonstrated
- SQL database design & management  
- Data analysis and fraud detection  
- Advanced MySQL queries (joins, aggregates, subqueries, window functions)  
- Handling & optimizing large datasets  
- Git & GitHub workflow for project versioning  

## Future Work
- Visualize fraud trends with Python / Power BI  
- Apply machine learning models for predictive fraud detection  
- Automate alerts for high-risk transactions  

## License
MIT License
