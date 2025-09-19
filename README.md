# Fraud-Detection
## Overview
This project analyzes simulated banking transactions to detect fraudulent activities. Using the **PaySim dataset**, we designed a **MySQL-based analytical workflow** to explore transaction patterns, identify high-risk accounts, and generate actionable insights for fraud detection.

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
