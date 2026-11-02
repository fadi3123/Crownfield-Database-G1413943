-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

SELECT 
    c.First_Name, 
    c.Last_Name, 
    COUNT(a.Appointment_ID) AS Total_Appointments
FROM 
    Clinician c
LEFT JOIN 
    Appointment a ON c.Clinician_ID = a.Clinician_ID
GROUP BY 
    c.Clinician_ID, c.First_Name, c.Last_Name;
    -- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

SELECT 
    c.First_Name, 
    c.Last_Name, 
    COUNT(a.Appointment_ID) AS Total_Appointments
FROM 
    Clinician c
JOIN 
    Appointment a ON c.Clinician_ID = a.Clinician_ID
GROUP BY 
    c.Clinician_ID, c.First_Name, c.Last_Name
HAVING 
    COUNT(a.Appointment_ID) > 1;
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

SELECT 
    p.First_Name AS Patient_Name,
    p.Last_Name AS Patient_Surname,
    c.First_Name AS Clinician_Name,
    c.Specialty,
    a.Appointment_Date,
    a.Appointment_Time
FROM 
    Patient p
JOIN 
    Appointment a ON p.Patient_ID = a.Patient_ID
JOIN 
    Clinician c ON a.Clinician_ID = c.Clinician_ID
ORDER BY 
    a.Appointment_Date, 
    a.Appointment_Time;
    -- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

SELECT 
    Patient_ID,
    First_Name,
    Last_Name,
    Postcode
FROM 
    Patient
WHERE 
    Postcode LIKE 'NE%';
    -- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

SELECT 
    a.Appointment_ID, 
    p.First_Name, 
    p.Last_Name, 
    a.Appointment_Date
FROM 
    Appointment a
JOIN 
    Patient p ON a.Patient_ID = p.Patient_ID
WHERE 
    MONTH(a.Appointment_Date) = 10 AND YEAR(a.Appointment_Date) = 2026;
    -- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

SELECT 
    First_Name, 
    Last_Name, 
    Postcode
FROM 
    Patient 
WHERE 
    Patient_ID IN (
        SELECT Patient_ID 
        FROM Appointment 
        WHERE Clinic_ID = (
            SELECT Clinic_ID 
            FROM Clinic 
            WHERE Clinic_Name = 'City Road'
        )
    );