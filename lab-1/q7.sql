SELECT Teacher.TeacherName FROM Teacher
GROUP BY Teacher.TeacherName, Teacher.CourseN
HAVING COUNT(*) > 1;