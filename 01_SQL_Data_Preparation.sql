-- Project: Credit Risk Analysis using Machine Learning
-- Author : Souri Sarkar
-- Description:
-- This SQL script performs data exploration, validation, aggregation,
-- and feature preparation for the Credit Risk Analysis project.



-- 1. Database Selection

SHOW DATABASES;

USE project_banking;

SHOW TABLES;


-- 2. Explore Table Structure

DESCRIBE Cust_Demographics;

DESCRIBE Cust_Account;

DESCRIBE Cust_Enquiry;



-- 3. Preview Data

SELECT *
FROM Cust_Demographics
LIMIT 10;

SELECT *
FROM Cust_Account
LIMIT 10;

SELECT *
FROM Cust_Enquiry
LIMIT 10;


-- 4. Data Quality Checks

-- Total Records

SELECT COUNT(*) AS total_rows
FROM Cust_Demographics;

SELECT COUNT(*) AS total_rows
FROM Cust_Account;

SELECT COUNT(*) AS total_rows
FROM Cust_Enquiry;


-- Missing Values

SELECT
    SUM(customer_no IS NULL) AS missing_customer_no,
    SUM(creditlimit IS NULL) AS missing_credit_limit
FROM Cust_Account;


-- Duplicate Customer IDs

SELECT
    customer_no,
    COUNT(*) AS duplicate_count
FROM Cust_Account
GROUP BY customer_no
HAVING COUNT(*) > 1;


-- Unique Customers

SELECT COUNT(DISTINCT customer_no) AS unique_customers
FROM Cust_Demographics;

SELECT COUNT(DISTINCT customer_no) AS unique_customers
FROM Cust_Account;

SELECT COUNT(DISTINCT customer_no) AS unique_customers
FROM Cust_Enquiry;


-- 5. Relationship Validation
-- Verify that Customer Demographics, Account and Enquiry tables join correctly.

SELECT *
FROM Cust_Demographics d

LEFT JOIN Cust_Account a
ON d.customer_no = a.customer_no

LEFT JOIN Cust_Enquiry e
ON d.customer_no = e.customer_no;



-- 6. Account-Level Feature Engineering
-- Aggregate account information for each customer.

SELECT
    customer_no,
    COUNT(*) AS total_accounts,
    SUM(cur_balance_amt) AS total_current_balance,
    SUM(amt_past_due) AS total_past_due,
    SUM(creditlimit) AS total_credit_limit
FROM Cust_Account
GROUP BY customer_no
LIMIT 10;


-- 7. Enquiry-Level Feature Engineering
-- Aggregate enquiry information for each customer.

SELECT
    customer_no,
    COUNT(*) AS total_enquiries,
    SUM(enq_amt) AS total_enquiry_amount,
    AVG(enq_amt) AS avg_enquiry_amount
FROM Cust_Enquiry
GROUP BY customer_no
LIMIT 10;



-- 8. Inspect Customer Features
-- Understand customer demographic variables.

SELECT
    customer_no,
    feature_1,
    feature_2,
    feature_3,
    feature_4,
    feature_5,
    Bad_label
FROM Cust_Demographics
LIMIT 10;


SELECT
    feature_6,
    feature_7,
    feature_8,
    feature_9,
    feature_10,
    feature_11,
    feature_12,
    feature_13,
    feature_14,
    feature_15
FROM Cust_Demographics
LIMIT 10;


SELECT
    feature_16,
    feature_17,
    feature_18,
    feature_19,
    feature_20,
    feature_21,
    feature_22,
    feature_23,
    feature_24,
    feature_25
FROM Cust_Demographics
LIMIT 10;


-- 9. Build Final Machine Learning Dataset
-- Merge customer demographics with aggregated account and enquiry features.

SELECT

    d.*,

    -- Account Features
    a.total_accounts,
    a.total_current_balance,
    a.total_past_due,
    a.total_credit_limit,

    -- Enquiry Features
    e.total_enquiries,
    e.total_enquiry_amount,
    e.avg_enquiry_amount

FROM Cust_Demographics d

LEFT JOIN
(
    SELECT
        customer_no,
        COUNT(*) AS total_accounts,
        SUM(cur_balance_amt) AS total_current_balance,
        SUM(amt_past_due) AS total_past_due,
        SUM(creditlimit) AS total_credit_limit
    FROM Cust_Account
    GROUP BY customer_no
) a
ON d.customer_no = a.customer_no

LEFT JOIN
(
    SELECT
        customer_no,
        COUNT(*) AS total_enquiries,
        SUM(enq_amt) AS total_enquiry_amount,
        AVG(enq_amt) AS avg_enquiry_amount
    FROM Cust_Enquiry
    GROUP BY customer_no
) e
ON d.customer_no = e.customer_no;



-- 10. Validate Final Dataset

SELECT COUNT(*) AS total_customers
FROM
(
    SELECT

        d.*,

        a.total_accounts,
        a.total_current_balance,
        a.total_past_due,
        a.total_credit_limit,

        e.total_enquiries,
        e.total_enquiry_amount,
        e.avg_enquiry_amount

    FROM Cust_Demographics d

    LEFT JOIN
    (
        SELECT
            customer_no,
            COUNT(*) AS total_accounts,
            SUM(cur_balance_amt) AS total_current_balance,
            SUM(amt_past_due) AS total_past_due,
            SUM(creditlimit) AS total_credit_limit
        FROM Cust_Account
        GROUP BY customer_no
    ) a
    ON d.customer_no = a.customer_no

    LEFT JOIN
    (
        SELECT
            customer_no,
            COUNT(*) AS total_enquiries,
            SUM(enq_amt) AS total_enquiry_amount,
            AVG(enq_amt) AS avg_enquiry_amount
        FROM Cust_Enquiry
        GROUP BY customer_no
    ) e
    ON d.customer_no = e.customer_no

) AS final_dataset;