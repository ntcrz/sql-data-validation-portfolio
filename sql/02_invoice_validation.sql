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
-- TC-INV-001
-- Requirement:
-- Verify all invoices can be retrieved.
--
-- Validation:
-- Ensure invoice records exist and are accessible.
--
-- Expected Result:
-- All invoices stored in the Invoice table are returned without errors.
----------------------------------------------------------

SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM Invoice
ORDER BY InvoiceId;


----------------------------------------------------------
-- TC-INV-002
-- Requirement:
-- Verify there are no invoices with a negative total.
--
-- Validation:
-- Check for invoices with a negative Total value.
--
-- Expected Result:
-- No records should be returned.
----------------------------------------------------------

SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM Invoice
WHERE Total <  0
ORDER BY Total ASC;

----------------------------------------------------------
-- TC-INV-003
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
    i.CustomerId,
    i.InvoiceDate,
    i.Total
FROM Invoice i
    LEFT JOIN Customer c
    ON i.CustomerId = c.CustomerId
WHERE c.CustomerId IS NULL;

----------------------------------------------------------
-- TC-INV-004
-- Requirement:
-- Find customers who have never placed an invoice.
--
-- Validation:
-- Identify customers who have never generated an invoice.
--
-- Expected Result:
-- Return every customer who has zero invoices.
----------------------------------------------------------

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId
FROM Customer c
    LEFT JOIN Invoice i
    ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

----------------------------------------------------------
-- TC-INV-005
-- Requirement:
-- Verify there are no duplicate Invoice IDs.
--
-- Validation:
-- Identify duplicate invoice IDs.
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

select i.InvoiceId, count(*) as DuplicateCount
from Invoice i
group by i.InvoiceId
having count(*) > 1
order by DuplicateCount desc

----------------------------------------------------------
-- TC-INV-006
-- Requirement:
-- Verify every invoice has a BillingCountry.
--
-- Validation:
-- Verify BillingCountry is populated for every invoice.
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    i.InvoiceId,
    i.CustomerId,
    i.BillingCountry
FROM Invoice i
WHERE i.BillingCountry IS NULL
    OR TRIM(i.BillingCountry) = '';

----------------------------------------------------------
-- TC-INV-007
-- Requirement:
-- Verify every invoice has a Billing City.
--
-- Validation:
-- Check for invoices where BillingCity is NULL or blank.
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    i.InvoiceId,
    i.CustomerId,
    i.BillingCity
FROM Invoice i
WHERE i.BillingCity IS NULL
    OR TRIM(i.BillingCity) = '';

----------------------------------------------------------
-- TC-INV-008
-- Requirement:
-- Verify there are no invoices with a future InvoiceDate.
--
-- Validation:
-- Check for invoices where InvoiceDate have a future date
--
-- Expected Result:
-- No rows should be returned.
----------------------------------------------------------

SELECT
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate
FROM Invoice i
WHERE CAST(i.InvoiceDate AS DATE) > CAST(GETDATE() AS DATE);

----------------------------------------------------------
-- TC-INV-009
-- Requirement:
-- Verify that the Invoice.Total equals the sum of its InvoiceLine records.
--
-- Validation:
-- Check Invoice.Total equals the sum of its InvoiceLine records.
--
-- Expected Result:
-- No rows should be returned. Invoice.Total must equal the calculated sum of (Quantity × UnitPrice) for all associated InvoiceLine records.
----------------------------------------------------------

SELECT
    i.InvoiceId,
    i.Total,
    SUM(l.Quantity * l.UnitPrice) AS InvoiceLineTotal,
    i.Total - SUM(l.Quantity * l.UnitPrice) AS Difference
FROM Invoice i
    JOIN InvoiceLine l
    ON i.InvoiceId = l.InvoiceId
GROUP BY
    i.InvoiceId,
    i.Total
HAVING i.Total <> SUM(l.Quantity * l.UnitPrice);

