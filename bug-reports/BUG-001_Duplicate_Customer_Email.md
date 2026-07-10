BUG-001

Title:
Duplicate Customer Email Address

Environment:
QA

Severity:
Medium

Priority:
High

Steps to Reproduce:

1. Execute TC-CUST-004.
2. Review query results.

Expected Result:

No duplicate email addresses are returned.

Actual Result:

Email 'luisg@embraer.com.br' is assigned to two customer records.

Root Cause:

Test data intentionally modified for QA validation.

Status:

Open