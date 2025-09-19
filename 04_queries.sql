-- Query 1: Total number of transactions per type
SELECT type, COUNT(*) AS total_transactions
FROM Transactions
GROUP BY type
ORDER BY total_transactions DESC;

-- Query 2: Total number of fraudulent transactions per type
SELECT type, COUNT(*) AS fraud_count
FROM Transactions
WHERE isFraud = 1
GROUP BY type
ORDER BY fraud_count DESC;

-- Query 3: Percentage of fraudulent transactions by type
SELECT type,
       COUNT(*) AS total,
       SUM(isFraud) AS fraud_count,
       ROUND(SUM(isFraud)/COUNT(*)*100,2) AS fraud_percentage
FROM Transactions
GROUP BY type
ORDER BY fraud_percentage DESC;

-- Query 4: Top 10 accounts receiving the most fraudulent transactions
SELECT nameDest, COUNT(*) AS fraud_received
FROM Transactions
WHERE isFraud = 1
GROUP BY nameDest
ORDER BY fraud_received DESC
LIMIT 10;

-- Query 5: Top 10 accounts sending the most fraudulent transactions
SELECT nameOrig, COUNT(*) AS fraud_sent
FROM Transactions
WHERE isFraud = 1
GROUP BY nameOrig
ORDER BY fraud_sent DESC
LIMIT 10;

-- Query 6: Average transaction amount for fraudulent vs non-fraudulent transactions
SELECT isFraud, ROUND(AVG(amount),2) AS avg_amount
FROM Transactions
GROUP BY isFraud;

-- Query 7: Accounts with multiple frauds (fraud hubs)
SELECT nameDest, COUNT(*) AS fraud_count
FROM Transactions
WHERE isFraud = 1
GROUP BY nameDest
HAVING fraud_count > 1
ORDER BY fraud_count DESC;

-- Query 8: Transactions where balance after transaction doesn’t match expected
SELECT *
FROM Transactions
WHERE newbalanceOrg <> oldbalanceOrg - amount
   OR newbalanceDest <> oldbalanceDest + amount;

-- Query 9: Fraud transactions grouped by hour (step)
SELECT step, COUNT(*) AS fraud_count
FROM Transactions
WHERE isFraud = 1
GROUP BY step
ORDER BY step;

-- Query 10: Ratio of fraudulent to total transactions per account
SELECT nameOrig,
       COUNT(*) AS total_transactions,
       SUM(isFraud) AS fraud_transactions,
       ROUND(SUM(isFraud)/COUNT(*)*100,2) AS fraud_ratio
FROM Transactions
GROUP BY nameOrig
HAVING fraud_transactions > 0
ORDER BY fraud_ratio DESC
LIMIT 10;

-- Query 11: Top 10 transactions with largest amounts flagged as fraud
SELECT *
FROM Transactions
WHERE isFraud = 1
ORDER BY amount DESC
LIMIT 10;

-- Query 12: Detect suspicious accounts with both sending and receiving fraud
SELECT nameOrig AS account, COUNT(*) AS fraud_sent,
       (SELECT COUNT(*) FROM Transactions t2 WHERE t2.nameDest = t1.nameOrig AND isFraud=1) AS fraud_received
FROM Transactions t1
WHERE isFraud = 1
GROUP BY nameOrig
HAVING fraud_sent > 0 AND fraud_received > 0
ORDER BY fraud_sent DESC;

-- Query 13: Monthly fraud trend (assuming step ~ hours/days)
SELECT FLOOR(step/30) AS month, COUNT(*) AS fraud_count
FROM Transactions
WHERE isFraud = 1
GROUP BY month
ORDER BY month;

-- Query 14: Top 5 accounts with highest total fraudulent amount received
SELECT nameDest, SUM(amount) AS total_fraud_amount
FROM Transactions
WHERE isFraud = 1
GROUP BY nameDest
ORDER BY total_fraud_amount DESC
LIMIT 5;

-- Query 15: Correlation check: amount vs fraud (high-value transactions)
SELECT CASE WHEN amount > 200000 THEN 'High' ELSE 'Low' END AS transaction_size,
       COUNT(*) AS total, SUM(isFraud) AS fraud_count,
       ROUND(SUM(isFraud)/COUNT(*)*100,2) AS fraud_percentage
FROM Transactions
GROUP BY transaction_size;