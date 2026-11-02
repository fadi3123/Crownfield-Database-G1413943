# Crownfield-Database-G1413943
# Crownfield Eye Hospital Database Project
**Student Name:** Fadi Alhajira  
**Student ID:** G1413943  
**Module:** CPU4:103 Introduction to Database  

## Assumptions
* Every patient receives a unique registration ID.
* Each doctor has one primary specialty and is assigned to specific clinics.
* Each appointment strictly links one patient to one doctor at one clinic on a specific date.

## File Execution Order
To properly set up and test this database, please execute the SQL files in the following exact order:
1. `01_schema.sql` - Creates the database schema, all 9 tables, constraints, and populates the synthetic data.
2. `02_individual_queries.sql` - Contains aggregate, JOIN, and subquery demonstrations.
3. `03_procedure_and_trigger.sql` - Creates the patient history stored procedure and the appointment audit trigger.
4. `04_security.sql` - Establishes role-based access control and user permissions.
