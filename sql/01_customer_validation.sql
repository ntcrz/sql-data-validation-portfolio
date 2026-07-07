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
-- TC-CUST-001
-- Requirement:
-- Verify all customer records can be retrieved.
--
-- Validation:
-- Ensure all customer records are accessible from the Customer table.
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
-- TC-CUST-002
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
-- TC-CUST-003
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

----------------------------------------------------------
-- TC-CUST-004
-- Requirement:
-- Verify duplicate emails.
--
-- Validation:
-- Identify an email that has a count > 1
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------
SELECT CustomerId,
    FirstName,
    LastName,
    Email
FROM Customer
WHERE Email IN (
    SELECT Email
FROM Customer
GROUP BY Email
HAVING COUNT(*) > 1
)
ORDER BY Email;

----------------------------------------------------------
-- TC-CUST-005
-- Requirement:
-- Verify duplicate customers. Check by first name, last name,
-- email
--
-- Validation:
-- Identify count > 1
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------
SELECT
    c.FirstName,
    c.LastName,
    c.Email,
    COUNT(*)
FROM Customer c
GROUP BY
    c.FirstName,
    c.LastName,
    c.Email
HAVING COUNT(*) > 1
ORDER BY c.Email;

----------------------------------------------------------
-- TC-CUST-006
-- Requirement:
-- Verify CustomerId values are unique
--
-- Validation:
-- Identify count > 1
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------
SELECT
    c.CustomerId,
    COUNT(*) AS DuplicateCount
FROM Customer c
GROUP BY c.CustomerId
HAVING COUNT(*) > 1;

----------------------------------------------------------
-- TC-CUST-007
-- Requirement:
-- Verify every customer has a valid Support Representative.
--
-- Validation:
-- Query returns customers whose SupportRepId does not exist in the Employee table.
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.SupportRepId
FROM Customer c
WHERE NOT EXISTS
(
    SELECT 1
FROM Employee e
WHERE e.EmployeeId = c.SupportRepId
);

--another query to validate TC-CUST-007

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.SupportRepId
FROM Customer c
    LEFT JOIN Employee e
    ON c.SupportRepId = e.EmployeeId
WHERE e.EmployeeId IS NULL;