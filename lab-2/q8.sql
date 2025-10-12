SELECT Student.Name, Student.SSN, Enrollment.Quarter, COUNT(Enrollment.CourseNumber) FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.Name, Student.SSN, Enrollment.Quarter
