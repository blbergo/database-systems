SELECT Teacher.CourseN, Teacher.Quarter FROM Teacher
JOIN LocationNTime on Teacher.CourseN = LocationNTime.CourseN AND Teacher.Quarter = LocationNTime.Quarter
WHERE LocationNTime.RoomN = '713' AND Teacher.TeacherName = 'Karen Reed';