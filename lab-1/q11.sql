SELECT StudentName, CourseN FROM Student
GROUP BY StudentName, CourseN
HAVING COUNT(*) > 1;