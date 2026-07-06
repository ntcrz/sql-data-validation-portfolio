/*
==========================================================
Project: SQL Data Validation Portfolio
Database: Chinook

Validation Area:
Customer Validation

Purpose:
Validate customer data stored in the Customer table.
These queries simulate backend validation activities
performed during QA testing.
==========================================================
*/

----------------------------------------------------------
-- TC001
-- Requirement:
-- Verify all customer records can be retrieved.
--
-- Validation:
-- Ensure the Customer table contains data and records
-- are accessible.
--
-- Expected Result:
-- All customer records are returned.
----------------------------------------------------------

SELECT
    CustomerId,
    FirstName,
    LastName,
    Email,
    Country
FROM Customer
ORDER BY CustomerId;


----------------------------------------------------------
-- TC002
-- Requirement:
-- Verify only customers from Brazil are returned.
--
-- Validation:
-- Confirm the Country filter returns only Brazilian
-- customers.
--
-- Expected Result:
-- Every returned row has Country = 'Brazil'.
----------------------------------------------------------

SELECT
    CustomerId,
    FirstName,
    LastName,
    Country
FROM Customer
WHERE Country = 'Brazil'
ORDER BY LastName, FirstName;

----------------------------------------------------------
-- TC003
-- Requirement:
-- Verify every customer has an email address.
--
-- Validation:
-- Identify any customer records with a NULL email.
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------

SELECT
    CustomerId,
    FirstName,
    LastName,
    Email
FROM Customer
WHERE Email IS NULL;