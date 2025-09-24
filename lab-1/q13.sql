SELECT DISTINCT Teacher.CourseN, Teacher.Quarter FROM Teacher
JOIN Teacher AS T2 ON Teacher.CourseN = T2.CourseN AND Teacher.Quarter = T2.Quarter AND Teacher.TeacherName <> T2.TeacherName
ORDER BY Teacher.CourseN DESC;