SELECT Student.Name, Student.SSN, COUNT(*) as course_count FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.SSN, Student.Name