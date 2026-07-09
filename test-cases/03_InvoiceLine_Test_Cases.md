# Invoice Line Test Cases

This document contains the test cases associated with the SQL validations in **03_invoice_liine_validation.sql**.

**Module:** Invoice Line Validation

**Objective:**
Validate customer data integrity, identify duplicate records, verify mandatory fields, and ensure referential integrity between customers and support representatives.
___________________________________________________________

Test Case ID : TC-IL-001

Requirement:
Verify all invoice line records can be retrieved.

Validation:
Ensure all InvoiceLine records are accessible from the InvoiceLine table.

Expected Result:
All invoice line records are returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID : TC-IL-002

Requirement:
Verify every invoice line has a quantity greater than zero.

Validation:
Query InvoiceLine quantity is <=0

Expected Result:
No rows should be returned.
SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-003

Requirement:
Verify every invoice line has a UnitPrice greater than zero.

Validation:
Identify invoice line records with a UnitPrice less than
or equal to zero.

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-004

Requirement:
Verify every InvoiceLine belongs to a valid Invoice.

Validation:
Identify invoice line records whose InvoiceId
does not exist in the Invoice table.

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-005

Requirement:
Verify every TrackId in the InvoiceLine table exists in the Track table.

Validation:
Identify invoice line records whose track id is null

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-006

Requirement:
Verify there are no duplicate InvoiceLineId values.

Validation:
Identify any duplicate InvoiceLineId values.

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-007

Requirement:
Verify the same Track is not added more than once
to the same Invoice.

Validation:
Identify invoices that contain the same TrackId
more than once.

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-008

Requirement:
Verify that every invoice line references a valid track with a positive UnitPrice.

Validation:
Identify invoice line records that reference tracks
with a UnitPrice less than or equal to zero.

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass
___________________________________________________________
Test Case ID : TC-IL-009

Requirement:
Verify every invoice contains at least one invoice line.

Validation:
Identify invoices that have no associated invoice line records.

Expected Result:
No rows should be returned.

SQL File:
03_invoice_line_validation.sql

Status:
Pass

