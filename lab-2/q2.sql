SELECT Student.Name, Student.SSN, COUNT(DISTINCT Enrollment.CourseNumber) FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.SSN, Student.Name