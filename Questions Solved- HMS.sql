Use Hospital_Management_System;

--Queries to Solve within the HMS Structure

--1.Find the names of patients who have attended appointments scheduled by Dr. John Doe.

SELECT Patient.Fname, Patient.Lname
FROM Patient
INNER JOIN PatientsAttendAppointments ON Patient.PatientID = PatientsAttendAppointments.PatientID
INNER JOIN Appointment ON PatientsAttendAppointments.AppointmentID = Appointment.AppointmentID
WHERE Appointment.DoctorID = (SELECT DoctorID FROM Doctor WHERE Fname = 'Dr. John' AND Lname = 'Doe')
AND Appointment.Status = 'Scheduled';

--2.Calculate the average age of all patients.

SELECT AVG(Patients.Age) AS AverageAge
FROM Patients;

--4.Create a trigger to update the appointment status to 'Completed' when the appointment date has passed.

CREATE TRIGGER UpdateAppointmentStatus
ON Appointment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Appointment
    SET Status = 'Completed'
    FROM Appointment AS a
    INNER JOIN inserted AS i ON a.AppointmentID = i.AppointmentID
    WHERE GETDATE() > a.StartTime AND i.Status <> 'Completed';
END;

-- Updating an appointment with a past date
UPDATE Appointment
SET StartTime = '11/8/23 10:00'
WHERE AppointmentID = 'A0001';


SELECT * FROM Appointment

--5.Find the names of patients along with their appointment details and the corresponding doctor's name.


SELECT
    P.Fname AS PatientFirstName,
    P.Lname AS PatientLastName,
    A.AppointmentID,
    A.StartTime,
    A.EndTime,
    A.Status,
    D.Fname AS DoctorFirstName,
    D.Lname AS DoctorLastName,
    D.Speciality
FROM
    PatientsAttendAppointments PA
JOIN
    Patient P ON PA.PatientID = P.PatientID
JOIN
    Appointment A ON PA.AppointmentID = A.AppointmentID
JOIN
    Doctor D ON A.DoctorID = D.DoctorID;

--6.Find the patients who have a medical history of diabetes and their next appointment is scheduled within the next 7 days.

SELECT
    P.PatientID,
    P.Fname AS PatientFirstName,
    P.Lname AS PatientLastName,
    MH.conditions AS MedicalCondition,
    A.AppointmentID,
    A.StartTime AS NextAppointmentStartTime,
    A.EndTime AS NextAppointmentEndTime,
    A.Status AS NextAppointmentStatus
FROM
    Patient P
JOIN
    MedicalHistory MH ON P.PatientID = MH.PatientID
JOIN
    PatientsAttendAppointments PA ON P.PatientID = PA.PatientID
JOIN
    Appointment A ON PA.AppointmentID = A.AppointmentID
WHERE
    MH.conditions = 'Diabetes'
    AND A.StartTime BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE())
ORDER BY
    A.StartTime;

--7.Find patients who have multiple appointments scheduled.

SELECT
    P.PatientID,
    P.Fname AS PatientFirstName,
    P.Lname AS PatientLastName,
    COUNT(A.AppointmentID) AS NumberOfAppointments
FROM
    Patient P
JOIN
    PatientsAttendAppointments PA ON P.PatientID = PA.PatientID
JOIN
    Appointment A ON PA.AppointmentID = A.AppointmentID
GROUP BY
    P.PatientID, P.Fname, P.Lname
HAVING
    COUNT(A.AppointmentID) > 1;

--8.Calculate the average duration of appointments for each doctor.

SELECT
    D.DoctorID,
    D.Fname AS DoctorFirstName,
    D.Lname AS DoctorLastName,
    AVG(DATEDIFF(MINUTE, A.StartTime, A.EndTime)) AS AverageAppointmentDuration
FROM
    Doctor D
JOIN
    Appointment A ON D.DoctorID = A.DoctorID
GROUP BY
    D.DoctorID, D.Fname, D.Lname;

--9.Find Patients with Most Appointments

SELECT TOP 1
    P.PatientID,
    P.Fname AS PatientFirstName,
    P.Lname AS PatientLastName,
    COUNT(PA.AppointmentID) AS NumberOfAppointments
FROM
    Patient P
JOIN
    PatientsAttendAppointments PA ON P.PatientID = PA.PatientID
GROUP BY
    P.PatientID, P.Fname, P.Lname
ORDER BY
    COUNT(PA.AppointmentID) DESC;

--10. Calculate the total cost of medication for each patient.

SELECT
    P.PatientID,
    P.Fname AS PatientFirstName,
    P.Lname AS PatientLastName,
    SUM(MC.Cost) AS TotalMedicationCost
FROM
    Patient P
JOIN
    PatientHistory PFH ON P.PatientID = PFH.PatientID
JOIN
    MedicalHistory MH ON PFH.HistoryID = MH.HistoryID
JOIN
    MedicationCost MC ON MH.Medication = MC.Medication
GROUP BY
    P.PatientID, P.Fname, P.Lname;