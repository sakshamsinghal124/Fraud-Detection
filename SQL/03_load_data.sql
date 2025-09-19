-- Make sure local_infile is enabled
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/91735/Downloads/archive (1)/PS_20174392719_1491204439457_log.csv'
INTO TABLE Transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(step, type, amount, nameOrig, oldbalanceOrg, newbalanceOrg,
 nameDest, oldbalanceDest, newbalanceDest, isFraud, isFlaggedFraud);