Use Hospital_Management_System;

CREATE TABLE Patient(
PatientID varchar(10) PRIMARY KEY,
Fname varchar(30) NOT NULL,
Lname varchar(30) NOT NULL,
Contact varchar(12) NOT NULL,
Age VARCHAR(5) NOT NULL
);

CREATE TABLE Doctor(
DoctorID varchar(50) PRIMARY KEY,
Fname varchar(20) NOT NULL,
Lname varchar(30) NOT NULL,
Speciality varchar(50) NOT NULL,
email varchar(50) NOT NULL,
);

CREATE TABLE Appointment (
  AppointmentID varchar(10) PRIMARY KEY,
  PatientID varchar(10) NOT NULL FOREIGN KEY REFERENCES Patient(PatientID),
  DoctorID varchar(50) NOT NULL FOREIGN KEY REFERENCES Doctor(DoctorID),
  StartTime DATETIME NOT NULL,
  EndTime DATETIME NOT NULL,
  Status VARCHAR(30) NOT NULL
);

CREATE TABLE PatientsAttendAppointments (
  PatientID varchar(10) NOT NULL FOREIGN KEY REFERENCES Patient(PatientID),
  AppointmentID varchar(10) NOT NULL FOREIGN KEY REFERENCES Appointment(AppointmentID),
  PRIMARY KEY (PatientID, AppointmentID)
);

CREATE TABLE MedicalHistory(
HistoryID varchar(10) PRIMARY KEY,
PatientID varchar(10) NOT NULL FOREIGN KEY REFERENCES Patient(PatientID),
date DATETIME NOT NULL,
conditions VARCHAR(100) NOT NULL, 
surgeries VARCHAR(100) NOT NULL, 
medication VARCHAR(100) NOT NULL
);

CREATE TABLE PatientHistory (
  PatientID varchar(10) NOT NULL FOREIGN KEY REFERENCES Patient(PatientID),
  HistoryID varchar(10) NOT NULL FOREIGN KEY REFERENCES MedicalHistory(HistoryID),
  DateFilled DATETIME NOT NULL,
  PRIMARY KEY (PatientID, HistoryID, DateFilled)
);

CREATE TABLE MedicationCost (
  Medication VARCHAR(255) NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (Medication)
);

