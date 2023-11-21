Use Hospital_Management_System;

INSERT INTO Patient (PatientID, Fname, Lname, Contact, Age)
VALUES ('P0001', 'John', 'Doe', '123-456-7890', '35'),
       ('P0002', 'Jane', 'Smith', '987-654-3210', '25'),
       ('P0003', 'Michael','Johnson', '678-901-2345', '30'),
       ('P0004', 'David', 'Williams', '456-789-0123', '40'),
       ('P0005', 'Sarah', 'Brown', '234-567-8901', '27'),
	   ('P0006', 'John', 'Doe', '777-888-9999', '28'),
       ('P0007', 'Jane', 'Smith', '333-222-1111', '30'),
       ('P0008', 'Michael', 'Johnson', '666-777-8888', '41'),
       ('P0009', 'David', 'Lee', '999-888-7777', '41'),
       ('P0010', 'Sarah', 'Brown', '222-333-4444', '60');

INSERT INTO Doctor (DoctorID, Fname, Lname, Speciality, Email)
VALUES ('D0001', 'Dr. John', 'Doe', 'General Physician', 'john.doe@example.com'),
       ('D0002', 'Dr. Jane', 'Smith', 'Pediatrician', 'jane.smith@example.com'),
       ('D0003', 'Dr. Michael', 'Johnson', 'Cardiologist', 'michael.j@example.com');

INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, StartTime, EndTime, Status)
VALUES ('A0001', 'P0001', 'D0001', '2023-11-07 10:00', '2023-11-07 11:15', 'Scheduled'),
       ('A0002', 'P0002', 'D0002', '2023-11-08 11:00', '2023-11-08 12:06', 'Completed'),
       ('A0003', 'P0003', 'D0003', '2023-11-09 12:00', '2023-11-09 13:21', 'Cancelled'),
       ('A0004', 'P0004', 'D0001', '2023-11-10 13:00', '2023-11-10 14:17', 'Scheduled'),
       ('A0005', 'P0005', 'D0002', '2023-11-11 14:00', '2023-11-11 15:45', 'Completed'),
       ('A0006', 'P0006', 'D0003', '2023-11-12 15:00', '2023-11-12 16:15', 'Cancelled'),
       ('A0007', 'P0007', 'D0001', '2023-11-13 16:00', '2023-11-13 17:09', 'Scheduled'),
       ('A0008', 'P0008', 'D0002', '2023-11-14 17:00', '2023-11-14 18:29', 'Completed'),
       ('A0009', 'P0009', 'D0003', '2023-11-15 18:00', '2023-11-15 19:11', 'Cancelled'),
       ('A0010', 'P0010', 'D0001', '2023-11-16 19:00', '2023-11-16 20:05', 'Scheduled');

INSERT INTO PatientsAttendAppointments (PatientID, AppointmentID)
VALUES ('P0001', 'A0001'),
       ('P0002', 'A0002'),
       ('P0003', 'A0003'),
       ('P0004', 'A0004'),
       ('P0005', 'A0005'),
       ('P0006', 'A0006'),
       ('P0007', 'A0007'),
       ('P0008', 'A0008'),
       ('P0009', 'A0009'),
       ('P0010', 'A0010'),
       ('P0001', 'A0004'),
       ('P0002', 'A0005'),
       ('P0003', 'A0006');

INSERT INTO MedicalHistory (HistoryID, PatientID, Date, conditions, Surgeries, Medication)
VALUES ('H0001', 'P0001', '2023-11-01 08:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
       ('H0002', 'P0002', '2023-11-02 09:00', 'Diabetes', 'None', 'Metformin'),
       ('H0003', 'P0003', '2023-11-03 10:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
       ('H0004', 'P0004', '2023-11-04 11:00', 'Migraine', 'Appendectomy', 'Ibuprofen'),
       ('H0005', 'P0005', '2023-11-05 12:00', 'Diabetes', 'None', 'Insulin'),
       ('H0006', 'P0006', '2023-11-06 13:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
       ('H0007', 'P0007', '2023-11-07 14:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
       ('H0008', 'P0008', '2023-11-08 15:00', 'Diabetes', 'None', 'Metformin'),
       ('H0009', 'P0009', '2023-11-09 16:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
       ('H0010', 'P0010', '2023-11-10 17:00', 'Migraine', 'Appendectomy', 'Ibuprofen');

INSERT INTO PatientHistory(PatientID, HistoryID, DateFilled)
VALUES ('P0001', 'H0001', '2023-11-04 08:30'),
       ('P0002', 'H0002', '2023-11-05 09:45'),
       ('P0003', 'H0003', '2023-11-06 10:30'),
       ('P0004', 'H0004', '2023-11-07 11:15'),
       ('P0005', 'H0005', '2023-11-08 12:45'),
       ('P0006', 'H0006', '2023-11-09 13:30'),
       ('P0007', 'H0007', '2023-11-10 14:15'),
       ('P0008', 'H0008', '2023-11-11 15:45'),
       ('P0009', 'H0009', '2023-11-12 16:30'),
       ('P0010', 'H0010', '2023-11-13 17:15');

INSERT INTO MedicationCost (Medication, Cost)
VALUES ('Lisinopril', 10),
       ('Metformin', 15),
       ('Albuterol', 12),
       ('Ibuprofen', 8),
       ('Insulin', 20);

select * from Patient;
select * from Doctor;
select * from Appointment;
select * from PatientsAttendAppointments;
select * from MedicalHistory;
select * from PatientHistory;
select * from MedicationCost;
