SELECT Course.CourseN, Course.CourseName, Teacher.TeacherName FROM Course
JOIN Teacher ON Course.CourseN = Teacher.CourseN
JOIN LocationNTime ON Teacher.CourseN = LocationNTime.CourseN AND Teacher.Quarter = LocationNTime.Quarter
WHERE LocationNTime.DayTime LIKE 'M%PM';