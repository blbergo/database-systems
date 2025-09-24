SELECT * FROM Course
JOIN Teacher ON Course.CourseN = Teacher.CourseN
ORDER BY Course.CourseN ASC, Course.CourseName DESC;