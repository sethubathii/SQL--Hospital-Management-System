--3.
CREATE PROCEDURE GetTotalAppointmentsForPatients
    @patientIDParam VARCHAR(10),
    @totalAppointments INT OUTPUT
AS
BEGIN
    SELECT @totalAppointments = COUNT(*)
    FROM PatientsAttendAppointments
    WHERE PatientID = @patientIDParam;
END;

DECLARE @result INT;
EXEC GetTotalAppointmentsForPatients 'P0002', @result OUTPUT;
SELECT @result AS TotalAppointments;