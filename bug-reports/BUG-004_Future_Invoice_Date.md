BUG-004

Title:
Inovoice has a future date.

Environment:
QA

Severity:
High

Priority:
High

Steps to Reproduce:

1. Execute TC-INV-008
2. Review query results.

Expected Result:
No records should be returned.

Actual Result:
A record is returned with a future date.

Root Cause:

Test data intentionally modified for QA validation.

Status:

Open