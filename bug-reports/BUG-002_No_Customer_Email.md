BUG-002

Title:
Customer does not have an email

Environment:
QA

Severity:
Medium

Priority:
High

Steps to Reproduce:

1. Execute TC-CUST-003.
2. Review query results.

Expected Result:

No customer records with a NULL email address are returned.

Actual Result:

A customer is retured without an email address.

Root Cause:

Test data intentionally modified for QA validation.

Status:

Open