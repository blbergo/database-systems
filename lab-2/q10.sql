SELECT Student.SSN, COUNT(Enrollment.CourseNumber) AS total_courses, COUNT(CASE WHEN Enrollment.Grade IS NOT NULL THEN 1 END) AS graded_courses FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.SSN