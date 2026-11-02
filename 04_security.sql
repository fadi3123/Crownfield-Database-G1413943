-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

-- 1. Create a new user account for a receptionist
CREATE USER 'receptionist'@'localhost' IDENTIFIED BY 'SecurePass123!';

-- 2. Grant them SELECT (read) permission on all tables
GRANT SELECT ON Fadi_Alhajira.* TO 'receptionist'@'localhost';

-- 3. Grant them INSERT and UPDATE permissions for the Patient table only
GRANT INSERT, UPDATE ON Fadi_Alhajira.Patient TO 'receptionist'@'localhost';

-- 4. Apply the privileges
FLUSH PRIVILEGES;

-- 5. Prove the permissions were granted by showing them
SHOW GRANTS FOR 'receptionist'@'localhost';