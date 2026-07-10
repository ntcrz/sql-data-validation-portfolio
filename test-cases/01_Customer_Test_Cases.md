# Customer Test Cases

This document contains the test cases associated with the SQL validations in **01_customer_validation.sql**.

**Module:** Customer Validation

**Objective:**
Validate customer data integrity, identify duplicate records, verify mandatory fields, and ensure referential integrity between customers and support representatives.
___________________________________________________________

Test Case ID : TC-CUST-001

Requirement:
Verify customer records can be retrieved from the Customer table.

Validation:
Ensure all customer records are accessible from the Customer table.

Expected Result:
All customer records are returned.

SQL File:
01_customer_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID: TC-CUST-002

Requirement:
Verify only customers from Brazil are returned.

Validation:
Confirm the Country filter returns only Brazilian customers.

Expected Result:
The query returns only customers whose Country is 'Brazil'.

SQL File:
01_customer_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID: TC-CUST-003

Requirement:
Verify every customer has an email address.

Validation:
Identify any customer records with a NULL email.

Actual Result:
A customer is retured without an email address.

SQL File:
01_customer_validation.sql

Status:
Fail

Related Defect:
BUG-002
___________________________________________________________

Test Case ID: TC-CUST-004

Requirement:
Verify duplicate emails.

Validation:
Identify an email that has a count > 1

Expected Result:
No records should be returned.

Actual Result:
Two customers have the same email.

SQL File:
01_customer_validation.sql

Status:
Fail

Related Defect:
BUG-001
___________________________________________________________

Test Case ID: TC-CUST-005

Requirement:
Verify duplicate customers. Check by first name, last name,
email

Validation:
Identify count > 1

Expected Result:
No records should be returned.

Status:
Pass
___________________________________________________________

Test Case ID: TC-CUST-006

Requirement:
Verify CustomerId values are unique

Validation:
Identify count > 1

Expected Result:
No records should be returned.

SQL File:
01_customer_validation.sql

Status:
Pass
___________________________________________________________

Test Case ID: TC-CUST-007

Requirement:
Verify every customer has a valid Support Representative.

Validation:
Query returns customers whose SupportRepId does not exist in the Employee table.

Expected Result:
No rows should be returned.

SQL File:
01_customer_validation.sql

Status:
Pass
___________________________________________________________