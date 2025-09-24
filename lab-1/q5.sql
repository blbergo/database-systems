SELECT Teacher.CourseN, Teacher.TeacherName FROM Teacher
JOIN Student on Teacher.CourseN = Student.CourseN AND Teacher.Quarter = Student.Quarter
WHERE Student.StudentName = 'Ron Smith' or Student.StudentName = 'David Weidman';