SELECT Student.Name, Student.SSN FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.Name, Student.SSN
HAVING COUNT(Enrollment.CourseNumber) = COUNT(DISTINCT Enrollment.CourseNumber);