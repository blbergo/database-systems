SELECT Student.Name, Student.SSN, COUNT(Enrollment.CourseNumber) FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
WHERE Enrollment.Grade IS NOT NULL
GROUP BY Student.SSN, Student.Name