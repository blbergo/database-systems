SELECT Student.Name, Student.SSN FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
GROUP BY Student.Name, Student.SSN
HAVING COUNT(CASE WHEN Enrollment.Grade NOT IN ('A') OR Enrollment.Grade IS NULL THEN 1 END) = 0;