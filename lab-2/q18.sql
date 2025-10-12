WITH EnrollmentCount AS (
    SELECT Enrollment.CourseNumber, COUNT(Enrollment.SSN) AS student_count
    FROM Enrollment
    GROUP BY Enrollment.CourseNumber
) 
SELECT DISTINCT Enrollment.CourseNumber, Course.CourseTitle FROM EnrollmentCount
JOIN Enrollment ON EnrollmentCount.CourseNumber = Enrollment.CourseNumber
JOIN Course ON EnrollmentCount.CourseNumber = Course.CourseNumber
WHERE EnrollmentCount.student_count = (SELECT MAX(student_count) FROM EnrollmentCount)