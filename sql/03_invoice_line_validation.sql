/*
==========================================================
Project: SQL Data Validation Portfolio
Database: Chinook

Validation Area:
Invoice Line Validation

Purpose:
Validate Invoice Line data stored in the InvoiceLine table.
These queries simulate backend validation activities
performed during QA testing.
==========================================================
*/

----------------------------------------------------------
-- TC-IL-001
-- Requirement:
-- Verify all invoice line records can be retrieved.
--
-- Validation:
-- Ensure all InvoiceLine records are accessible from the InvoiceLine table.
--
-- Expected Result:
-- All invoice line records are returned.
----------------------------------------------------------

SELECT
    InvoiceLineId,
    InvoiceId,
    TrackId,
    UnitPrice,
    Quantity
FROM InvoiceLine
ORDER BY InvoiceLineId;

----------------------------------------------------------
-- TC-IL-002
-- Requirement:
-- Verify every invoice line has a quantity greater than zero.
--
-- Validation:
-- Query InvoiceLine quantity is <=0
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    InvoiceLineId,
    InvoiceId,
    TrackId,
    UnitPrice,
    Quantity
FROM InvoiceLine
where Quantity <= 0
ORDER BY InvoiceLineId;

----------------------------------------------------------
-- TC-IL-003
-- Requirement:
-- Verify every invoice line has a UnitPrice greater than zero.
--
-- Validation:
-- Identify invoice line records with a UnitPrice less than
-- or equal to zero.
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    InvoiceLineId,
    InvoiceId,
    TrackId,
    UnitPrice,
    Quantity
FROM InvoiceLine
where UnitPrice <= 0
ORDER BY InvoiceLineId;

----------------------------------------------------------
-- TC-IL-004
-- Requirement:
-- Verify every InvoiceLine belongs to a valid Invoice.
--
-- Validation:
-- Identify invoice line records whose InvoiceId
-- does not exist in the Invoice table.
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    l.InvoiceLineId,
    l.InvoiceId,
    l.TrackId,
    l.UnitPrice,
    l.Quantity
FROM InvoiceLine l
WHERE NOT EXISTS
(
    SELECT 1
FROM Invoice i
WHERE i.InvoiceId = l.InvoiceId
);

----------------------------------------------------------
-- TC-IL-005
-- Requirement:
-- Verify every TrackId in the InvoiceLine table exists in the Track table.
--
-- Validation:
-- Identify invoice line records whose track id is null
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    l.InvoiceLineId,
    l.InvoiceId,
    l.TrackId,
    l.UnitPrice,
    l.Quantity
FROM InvoiceLine l
    LEFT JOIN Track t
    on l.TrackId = t.TrackId
where t.TrackId is null

