SELECT DISTINCT Teacher.TeacherName FROM Teacher
GROUP BY Teacher.TeacherName
HAVING COUNT(DISTINCT Teacher.CourseN) >= 2;