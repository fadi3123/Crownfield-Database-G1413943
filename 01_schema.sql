-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

CREATE DATABASE Fadi_Alhajira;
USE Fadi_Alhajira;

DROP TABLE IF EXISTS Follow_Up_Plan;
DROP TABLE IF EXISTS Prescription_Item;
DROP TABLE IF EXISTS Prescription;
DROP TABLE IF EXISTS Diagnosis;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Medicine;
DROP TABLE IF EXISTS Clinic;
DROP TABLE IF EXISTS Clinician;
DROP TABLE IF EXISTS Patient;
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

CREATE TABLE Patient (
    Patient_ID VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Postcode VARCHAR(10) NOT NULL
);
 
CREATE TABLE Clinician (
    Clinician_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Specialty VARCHAR(50) NOT NULL
);
 
CREATE TABLE Clinic (
    Clinic_ID INT AUTO_INCREMENT PRIMARY KEY,
    Clinic_Name VARCHAR(100) NOT NULL UNIQUE
    -- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

CREATE TABLE Medicine (
    Medicine_ID INT AUTO_INCREMENT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL UNIQUE
);
 
CREATE TABLE Appointment (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Clinician_ID INT NOT NULL,
    Patient_ID VARCHAR(10) NOT NULL,
    Clinic_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Appointment_Time TIME NOT NULL,
    Note TEXT,
    FOREIGN KEY (Clinician_ID) REFERENCES Clinician(Clinician_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Clinic_ID) REFERENCES Clinic(Clinic_ID) ON DELETE RESTRICT
);
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

CREATE TABLE Diagnosis (
    Diagnosis_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_ID INT NOT NULL,
    Diagnosis_Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID) ON DELETE CASCADE
);
 
CREATE TABLE Prescription (
    Prescription_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_ID INT NOT NULL,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID) ON DELETE CASCADE
);
 
CREATE TABLE Prescription_Item (
    Prescription_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Prescription_ID INT NOT NULL,
    Medicine_ID INT NOT NULL,
    Dose VARCHAR(50) NOT NULL,
    Route VARCHAR(50),
    Frequency VARCHAR(50) NOT NULL,
    Duration VARCHAR(50) NOT NULL,
    FOREIGN KEY (Prescription_ID) REFERENCES Prescription(Prescription_ID) ON DELETE CASCADE,
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID) ON DELETE RESTRICT
);
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;
DROP TABLE IF EXISTS Follow_Up_Plan;

CREATE TABLE Follow_Up_Plan (
    FollowUp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_ID INT NOT NULL,
    Due_Date DATE,
    Priority VARCHAR(20) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID) ON DELETE CASCADE,
    CONSTRAINT chk_priority CHECK (Priority IN ('Routine', 'High', 'Urgent'))
);
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

USE Fadi_Alhajira;

INSERT INTO Clinic (Clinic_Name) VALUES 
('City Road'), ('Bedford'), ('Croydon'), 
('Manchester Royal'), ('Leeds General'), ('Bristol Eye Hospital'), 
('Birmingham Central'), ('Liverpool Ophthalmic'), ('Newcastle Vision'), 
('Oxford Eye Centre'), ('Cambridge Clinic'), ('Sheffield Vision'), ('Nottingham Eye');
 
INSERT INTO Clinician (First_Name, Last_Name, Specialty) VALUES 
('Maya', 'Shah', 'Glaucoma'), ('Leo', 'Grant', 'Retina'), 
('Priya', 'Nair', 'Cornea'), ('Sarah', 'Jones', 'Cataract'), 
('James', 'Smith', 'Pediatric'), ('Emma', 'Williams', 'Neuro-ophthalmology'), 
('David', 'Brown', 'Oculoplastics'), ('Lisa', 'Taylor', 'Retina'), 
('Mark', 'Davies', 'Glaucoma'), ('Anna', 'Evans', 'Cornea'), 
('Paul', 'Thomas', 'Cataract'), ('Laura', 'Roberts', 'Pediatric'), 
('John', 'White', 'Retina');
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]
USE Fadi_Alhajira;
INSERT INTO Patient (Patient_ID, First_Name, Last_Name, Postcode) VALUES 
('OP001', 'Amina', 'Yusuf', 'NE1 4AB'), ('OP002', 'Daniel', 'Reed', 'N16 7QP'), 
('OP003', 'Sofia', 'Bennett', 'E8 2LD'), ('OP004', 'Michael', 'Okoro', 'SE6 3RT'),
('OP005', 'John', 'Doe', 'M1 1AA'), ('OP006', 'Jane', 'Smith', 'LS1 2BB'),
('OP007', 'Alice', 'Johnson', 'B1 3CC'), ('OP008', 'Bob', 'Williams', 'L1 4DD'),
('OP009', 'Charlie', 'Brown', 'NE2 5EE'), ('OP010', 'Diana', 'Evans', 'OX1 6FF'),
('OP011', 'Evan', 'Davies', 'CB1 7GG'), ('OP012', 'Fiona', 'Taylor', 'S1 8HH'),
('OP013', 'George', 'Thomas', 'NG1 9II'), ('OP014', 'Hannah', 'Roberts', 'M2 0JJ');
 
INSERT INTO Medicine (Medicine_Name) VALUES 
('Latanoprost'), ('Timolol'), ('Aflibercept'), ('Sodium chloride drops'),
('Bimatoprost'), ('Dexamethasone'), ('Prednisolone'), ('Cyclopentolate'),
('Tropicamide'), ('Chloramphenicol'), ('Dorzolamide'), ('Brimonidine'),
('Ranibizumab'), ('Fluorometholone');
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]
USE Fadi_Alhajira;
INSERT INTO Appointment (Clinician_ID, Patient_ID, Clinic_ID, Appointment_Date, Appointment_Time, Note) VALUES 
(1, 'OP001', 1, '2026-10-05', '09:00:00', 'Review IOP'),
(2, 'OP002', 1, '2026-10-05', '09:30:00', 'OCT before review'),
(1, 'OP001', 2, '2026-11-16', '10:15:00', 'Visual field test'),
(1, 'OP003', 1, '2026-10-06', '11:00:00', 'Monitor'),
(3, 'OP004', 3, '2026-10-07', '14:00:00', 'Corneal topography'),
(4, 'OP005', 4, '2026-10-08', '10:00:00', 'Cataract assessment'),
(5, 'OP006', 5, '2026-10-09', '11:30:00', 'Routine check'),
(6, 'OP007', 6, '2026-10-10', '13:00:00', 'Visual field test'),
(7, 'OP008', 7, '2026-10-11', '14:15:00', 'Post-op review'),
(8, 'OP009', 8, '2026-10-12', '15:30:00', 'Macular scan'),
(9, 'OP010', 9, '2026-10-13', '09:45:00', 'IOP check'),
(10, 'OP011', 10, '2026-10-14', '10:20:00', 'Dry eye clinic'),
(11, 'OP012', 11, '2026-10-15', '11:45:00', 'Pre-op assessment'),
(12, 'OP013', 12, '2026-10-16', '12:30:00', 'Strabismus review'),
(13, 'OP014', 13, '2026-10-17', '16:00:00', 'Retinal mapping');
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]
USE Fadi_Alhajira;
INSERT INTO Diagnosis (Appointment_ID, Diagnosis_Name) VALUES 
(1, 'Ocular hypertension'), (2, 'Diabetic macular oedema'),
(3, 'Ocular hypertension'), (4, 'Glaucoma suspect'), (5, 'Keratoconus');
 
INSERT INTO Prescription (Appointment_ID) VALUES 
(1), (2), (3), (5);
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]
USE Fadi_Alhajira;
INSERT INTO Prescription_Item (Prescription_ID, Medicine_ID, Dose, Route, Frequency, Duration) VALUES 
(1, 1, '1 drop', 'Topical', 'Once daily', 'Ongoing'), 
(1, 2, '1 drop', 'Topical', 'Twice daily', 'Ongoing'),
(2, 3, '2mg', 'Intravitreal', 'Monthly', '3 doses'),
(3, 1, '1 drop', 'Topical', 'Once daily', 'Ongoing'),
(4, 4, '1 drop', 'Topical', 'Four times daily', '4 weeks');
 
INSERT INTO Follow_Up_Plan (Appointment_ID, Due_Date, Priority, Status) VALUES 
(1, '2026-11-16', 'High', 'Pending'), (2, '2026-11-02', 'Urgent', 'Pending'),
(3, '2027-02-08', 'Routine', 'Pending'), (4, '2027-04-06', 'Routine', 'Pending'),
(5, '2026-12-02', 'Routine', 'Pending');
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]
USE Fadi_Alhajira;
UPDATE Patient 
SET Postcode = 'NE2 9ZZ' 
WHERE Patient_ID = 'OP001';
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]
USE Fadi_Alhajira;
DELETE FROM Follow_Up_Plan 
WHERE FollowUp_ID = 5;
-- Student Name: Fadi Alhajira
-- Student ID: [G1413943]

SELECT * FROM Appointment;
