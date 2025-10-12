SELECT Student.Name, Student.Major FROM Student
JOIN Enrollment ON Student.SSN = Enrollment.SSN
JOIN Section ON Enrollment.CourseNumber = Section.CourseNumber AND Enrollment.Quarter = Section.Quarter
WHERE Section.DayTime LIKE '%MW%' AND Section.DayTime LIKE '%PM%'
GROUP BY Student.Name, Student.Major;