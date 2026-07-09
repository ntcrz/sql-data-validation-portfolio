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
-- Verify all invoice line records can be retrieved.
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
-- Verify every invoice line has a quantity greater than zero.
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
-- Verify every invoice line has a UnitPrice greater than zero.
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
-- Verify every InvoiceLine belongs to a valid Invoice.
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
-- Verify every TrackId in the InvoiceLine table exists in the Track table.
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

----------------------------------------------------------
-- TC-IL-006
-- Verify there are no duplicate InvoiceLineId values.
----------------------------------------------------------

select l.InvoiceLineId, count(*) DuplicateCount
from InvoiceLine l
group by l.InvoiceLineId
having count(*) > 1

----------------------------------------------------------
-- TC-IL-007
-- Verify the same Track is not added more than once
-- to the same Invoice.
----------------------------------------------------------

SELECT
    l.InvoiceId,
    l.TrackId,
    COUNT(*) AS TrackCount
FROM InvoiceLine l
GROUP BY
    l.InvoiceId,
    l.TrackId
HAVING COUNT(*) > 1
ORDER BY
    l.InvoiceId,
    l.TrackId;

----------------------------------------------------------
-- TC-IL-008
-- Verify that every invoice line references a valid track with a positive UnitPrice.
----------------------------------------------------------

SELECT
    l.InvoiceLineId,
    l.InvoiceId,
    t.TrackId,
    t.Name,
    t.UnitPrice
FROM InvoiceLine l
    INNER JOIN Track t
    ON l.TrackId = t.TrackId
WHERE t.UnitPrice <= 0;

----------------------------------------------------------
-- TC-IL-009
-- Verify every invoice contains at least one invoice line.
----------------------------------------------------------

select i.InvoiceId
from Invoice i
    left join InvoiceLine l
    on i.InvoiceId = l.InvoiceId
where l.InvoiceLineId is null
order by i.InvoiceId, l.InvoiceLineId
