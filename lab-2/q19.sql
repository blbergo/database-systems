WITH UnitCount as (
    SELECT Student.Name, Student.Major, SUM(Course.NumberUnits) as completed_units FROM Student
    JOIN Enrollment ON Student.SSN = Enrollment.SSN
    JOIN Course ON Enrollment.CourseNumber = Course.CourseNumber
    GROUP BY Student.SSN, Student.Name, Student.Major
)
SELECT Name, Major FROM UnitCount
WHERE completed_units = (SELECT MAX(completed_units) FROM UnitCount);