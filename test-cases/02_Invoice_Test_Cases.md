# Invoice Test Cases

This document contains the test cases associated with the SQL validations in **02_invoice_validation.sql**.

**Module:** Invoice Validation

**Objective:**
Validate customer data integrity, identify duplicate records, verify mandatory fields, and ensure referential integrity between customers and support representatives.

___________________________________________________________

Test Case ID : TC-INV-001

Requirement:
Verify all invoices can be retrieved.

Validation:
Ensure invoice records exist and are accessible.

Expected Result:
All invoices stored in the Invoice table are returned without errors.

SQL File:
02_invoice_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID : TC-INV-002

Requirement:
Verify there are no invoices with a negative total.

Validation:
Check for invoices with a negative Total value.

Expected Result:
No records should be returned.

Actual Result:
A record is retured with negative total

SQL File:
02_invoice_validation.sql

Status:
Fail

Related Defect:
BUG-003
___________________________________________________________

Test Case ID : TC-INV-003

Requirement:
Verify every invoice belongs to a valid customer.

Validation:
Ensure there are no orphan invoices by checking that
every CustomerId in the Invoice table exists in the
Customer table.

Expected Result:
No records should be returned.

SQL File:
02_invoice_validation.sql

Status:
Pass
___________________________________________________________

___________________________________________________________

Test Case ID : TC-INV-004

Requirement:
Find customers who have never placed an invoice.

Validation:
Identify customers who have never generated an invoice.

Expected Result:
Return every customer who has zero invoices.

SQL File:
02_invoice_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID : TC-INV-005

Requirement:
Verify there are no duplicate Invoice IDs.

Validation:
Identify duplicate invoice IDs.

Expected Result:
No rows should be returned.

SQL File:
02_invoice_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID : TC-INV-006

Requirement:
Verify every invoice has a BillingCountry.

Validation:
Verify BillingCountry is populated for every invoice.

Expected Result:
No rows should be returned.

Actual Result:
A record is returned with a null BillingCountry


SQL File:
02_invoice_validation.sql

Status:
Fail

Related Defect:
BUG-005

___________________________________________________________

Test Case ID : TC-INV-007

Requirement:
Verify every invoice has a Billing City.

Validation:
Check for invoices where BillingCity is NULL or blank.

Expected Result:
No rows should be returned.

SQL File:
02_invoice_validation.sql

Status:
Pass

___________________________________________________________

Test Case ID : TC-INV-008

Requirement:
Verify there are no invoices with a future InvoiceDate.

Validation:
Check for invoices where InvoiceDate have a future date

Expected Result:
No rows should be returned.

Actual Result:
A record is returned with a future date.

SQL File:
02_invoice_validation.sql

Status:
Fail

Related Defect:
BUG-004

___________________________________________________________

Test Case ID : TC-INV-009

Requirement:
Verify that the Invoice.Total equals the sum of its InvoiceLine records.

Validation:
Check Invoice.Total equals the sum of its InvoiceLine records.

Expected Result:
No rows should be returned. Invoice.Total must equal the calculated sum of (Quantity × UnitPrice) for all associated InvoiceLine records.

SQL File:
02_invoice_validation.sql

Status:
Pass