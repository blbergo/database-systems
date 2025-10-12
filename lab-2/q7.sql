SELECT Student.Name, Student.SSN, Enrollment.CourseNumber FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.SSN, Student.Name, Enrollment.CourseNumber
HAVING COUNT(Enrollment.CourseNumber) >= 3;