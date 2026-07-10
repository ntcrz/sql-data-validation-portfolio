BUG-005

Title:
Inovoice is missing billing country.

Environment:
QA

Severity:
High

Priority:
High

Steps to Reproduce:

1. Execute TC-INV-006
2. Review query results.

Expected Result:
No records should be returned.

Actual Result:
A record is returned with a null BillingCountry

Root Cause:

Test data intentionally modified for QA validation.

Status:

Open