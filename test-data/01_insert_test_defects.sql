/*
Purpose:
Introduce intentional data quality issues into the QA database
to validate SQL test cases.

Run against:
Chinook_QA ONLY
Do NOT run against the original Chinook database.
*/

--BUG-001
UPDATE Customer
SET Email = 'luisg@embraer.com.br'
WHERE CustomerId = 2;

--BUG-002
SELECT
    Email,
    COUNT(*)
FROM Customer
GROUP BY Email
HAVING COUNT(*) > 1;

--BUG-003
UPDATE Customer
SET Email = NULL
WHERE CustomerId = 15;

--BUG-004
UPDATE Invoice
SET InvoiceDate = '2030-01-01'
WHERE InvoiceId = 20;

--BUG-005
UPDATE Invoice
SET BillingCountry = NULL
WHERE InvoiceId = 18;

--BUG-006
INSERT INTO InvoiceLine
    (
    InvoiceLineId,
    InvoiceId,
    TrackId,
    UnitPrice,
    Quantity
    )
VALUES
    (
        2241,
        1,
        2,
        0.99,
        1
);