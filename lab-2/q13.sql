SELECT Student.Name, Student.SSN FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.Name, Student.SSN
HAVING COUNT(CASE WHEN Enrollment.Grade IN ('A') THEN 1 END) = 0;