# Test Summary Report

## Project

SQL Data Validation Portfolio

## Test Cycle

Regression Cycle 1

## Objective

Validate customer, invoice, and invoice line data to ensure data integrity, referential integrity, and compliance with business rules.

---

## Scope

Modules Tested:

- Customer Validation
- Invoice Validation
- Invoice Line Validation

---

## Test Execution Summary

| Module | Executed | Passed | Failed |
|---------|---------:|-------:|-------:|
| Customer Validation | 7 | 5 | 2 |
| Invoice Validation | 9 | 8 | 1 |
| InvoiceLine Validation | 9 | 8 | 1 |
| **Total** | **25** | **21** | **4** |

---

## Defects Identified

| Bug ID | Summary | Severity | Status |
|---------|----------|----------|--------|
| BUG-001 | Duplicate customer email | Medium | Open |
| BUG-002 | Missing customer email | High | Open |
| BUG-003 | Negative invoice total | High | Open |
| BUG-004 | Missing billing country | Medium | Open |

---

## Overall Assessment

The SQL validation scripts successfully identified all intentionally introduced data quality issues.

All referential integrity, duplicate detection, NULL validation, and financial reconciliation queries executed successfully.

Four defects were detected and documented.

---

## Recommendation

The validation suite is functioning as expected.

The identified defects should be corrected before promoting the database to production.

---
## Environment

Database: Chinook (SQL Server)

Tools:
- SQL Server Management Studio (SSMS)
- Git
- GitHub

Testing Type:
- Backend Data Validation
- Functional Validation
- Data Integrity Testing
- Referential Integrity Testing