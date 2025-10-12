WITH EnrollmentCount AS (
    SELECT Enrollment.CourseNumber, Enrollment.Quarter, COUNT(Enrollment.SSN) AS student_count
    FROM Enrollment
    GROUP BY Enrollment.CourseNumber, Enrollment.Quarter
) 
SELECT DISTINCT Enrollment.CourseNumber, Enrollment.Quarter FROM EnrollmentCount
JOIN Enrollment ON EnrollmentCount.CourseNumber = Enrollment.CourseNumber
WHERE EnrollmentCount.student_count = (SELECT MAX(student_count) FROM EnrollmentCount)