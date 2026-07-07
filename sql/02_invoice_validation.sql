/*
==========================================================
Project: SQL Data Validation Portfolio
Database: Chinook

Validation Area:
Invoice Validation

Purpose:
Validate invoice data stored in the Invoice table.
These queries simulate backend validation activities
performed during QA testing.
==========================================================
*/

----------------------------------------------------------
-- TC001
-- Requirement:
-- Verify all invoices can be retrieved.
--
-- Validation:
-- Ensure invoice records exist and are accessible.
--
-- Expected Result:
-- All invoice records are returned.
----------------------------------------------------------

SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM Invoice
ORDER BY InvoiceId;


----------------------------------------------------------
-- TC002
-- Requirement:
-- Verify invoices with totals greater than $10.
--
-- Validation:
-- Confirm invoices above the specified threshold
-- are returned.
--
-- Expected Result:
-- Every returned invoice has a Total greater than 10.
----------------------------------------------------------

SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM Invoice
WHERE Total > 10
ORDER BY Total DESC;

----------------------------------------------------------
-- TC003
-- Requirement:
-- Verify every invoice belongs to a valid customer.
--
-- Validation:
-- Ensure there are no orphan invoices by checking that
-- every CustomerId in the Invoice table exists in the
-- Customer table.
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------

SELECT
    i.InvoiceId,
    i.CustomerId
FROM Invoice i
LEFT JOIN Customer c
    ON i.CustomerId = c.CustomerId
WHERE c.CustomerId IS NULL;

----------------------------------------------------------
-- TC004
-- Requirement:
-- Verify invoice totals are never negative.
--
-- Validation:
-- Identify invoices with a negative total.
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------

SELECT
    InvoiceId,
    CustomerId,
    Total
FROM Invoice
WHERE Total < 0;

