# SQL Data Validation Portfolio

## Overview

This repository demonstrates backend SQL data validation techniques commonly performed by Quality Assurance (QA) Analysts. The project uses the Chinook sample database to simulate real-world data validation scenarios, including referential integrity checks, duplicate detection, NULL validation, business rule validation, and financial data reconciliation.

The goal is to demonstrate how SQL can be used to validate application data during functional, regression, integration, and user acceptance testing.

---

## Technologies

- Microsoft SQL Server
- SQL
- Chinook Sample Database
- Git
- GitHub

---

## Skills Demonstrated

- SQL Query Development
- Backend Data Validation
- Functional Testing
- Regression Testing
- Data Integrity Validation
- Referential Integrity Checks
- Business Rule Validation
- Duplicate Detection
- NULL Validation
- Aggregate Functions
- JOINs
- GROUP BY / HAVING
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions

---

## Project Structure

```
sql-data-validation-portfolio/
│
├── README.md
├── sql/
│   ├── 01_customer_validation.sql
│   ├── 02_invoice_validation.sql
│   └── 03_invoice_line_validation.sql
│
├── test-cases/
│   ├── 01_Customer_Test_Cases.md
│   ├── 02_Invoice_Test_Cases.md
│   └── 03_InvoiceLine_Test_Cases.md
│
├── bug-scenarios/
│
└── screenshots/
```

---

## Validation Modules

### Customer Validation

- Customer retrieval
- Duplicate email detection
- Duplicate customer detection
- Missing email validation
- Support Representative validation

### Invoice Validation

- Invoice retrieval
- Negative invoice totals
- Missing billing information
- Future invoice dates
- Invoice-to-customer validation
- Invoice total reconciliation

### Invoice Line Validation

- Quantity validation
- Unit price validation
- Invoice relationship validation
- Track relationship validation
- Duplicate invoice line detection
- Duplicate track detection
- Invoice integrity validation

---

## Future Enhancements

- Reporting validation scenarios
- Regression validation queries
- Bug reports
- Test summary reports
- Test data scripts for defect simulation

---

## About This Project

This portfolio was created to strengthen backend SQL validation skills and demonstrate practical QA techniques used in enterprise applications. The scenarios are modeled after real-world testing activities performed in Agile software development environments.

---

## Author

**Anita Cruz**

Senior Quality Assurance Analyst
