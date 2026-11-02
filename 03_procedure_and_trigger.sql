-- Student Name: Fadi Alhajira
-- Student ID: G1413943
USE Fadi_Alhajira;

-- 1. Create the Stored Procedure to look up a patient's history
DELIMITER //
CREATE PROCEDURE GetPatientHistory(IN p_Patient_ID VARCHAR(10))
BEGIN
    SELECT p.First_Name, p.Last_Name, a.Appointment_Date, c.First_Name AS Doctor, c.Specialty
    FROM Patient p
    JOIN Appointment a ON p.Patient_ID = a.Patient_ID
    JOIN Clinician c ON a.Clinician_ID = c.Clinician_ID
    WHERE p.Patient_ID = p_Patient_ID;
END //
DELIMITER ;

-- Test the procedure to get your screenshot!
CALL GetPatientHistory('OP001');
-- 2. Create an Audit Table to hold the log records
CREATE TABLE Appointment_Audit_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_ID INT,
    Old_Date DATE,
    New_Date DATE,
    Changed_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the Trigger to log changes
DELIMITER //
CREATE TRIGGER Audit_Appointment_Changes
AFTER UPDATE ON Appointment
FOR EACH ROW
BEGIN
    IF OLD.Appointment_Date != NEW.Appointment_Date THEN
        INSERT INTO Appointment_Audit_Log (Appointment_ID, Old_Date, New_Date)
        VALUES (OLD.Appointment_ID, OLD.Appointment_Date, NEW.Appointment_Date);
    END IF;
END //
DELIMITER ;

-- Test the trigger to get your screenshot!
UPDATE Appointment SET Appointment_Date = '2026-12-01' WHERE Appointment_ID = 1;
SELECT * FROM Appointment_Audit_Log;