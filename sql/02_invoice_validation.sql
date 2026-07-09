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
-- Verify all invoices can be retrieved.
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
-- Verify there are no invoices with a negative total.
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
-- Verify every invoice belongs to a valid customer.
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
-- Find customers who have never placed an invoice.
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
-- Verify there are no duplicate Invoice IDs.
----------------------------------------------------------

select i.InvoiceId, count(*) as DuplicateCount
from Invoice i
group by i.InvoiceId
having count(*) > 1
order by DuplicateCount desc

----------------------------------------------------------
-- TC-INV-006
-- Verify every invoice has a BillingCountry.
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
-- Verify every invoice has a Billing City.
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
-- Verify there are no invoices with a future InvoiceDate.
----------------------------------------------------------

SELECT
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate
FROM Invoice i
WHERE CAST(i.InvoiceDate AS DATE) > CAST(GETDATE() AS DATE);

----------------------------------------------------------
-- TC-INV-009
-- Verify that the Invoice.Total equals the sum of its InvoiceLine records.
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

