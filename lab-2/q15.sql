SELECT Student.Name, Student.Major FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
JOIN Section ON Enrollment.CourseNumber = Section.CourseNumber AND Enrollment.Quarter = Section.Quarter
GROUP BY Student.Name, Student.Major
HAVING COUNT(CASE WHEN Section.DayTime LIKE '%MW%' AND Section.DayTime LIKE '%PM%' THEN 1 END) = (SELECT COUNT(DISTINCT CourseNumber) FROM Section WHERE DayTime LIKE '%MW%' AND DayTime LIKE '%PM%');