SELECT DISTINCT TeacherName FROM Teacher
JOIN LocationNTime ON Teacher.CourseN = LocationNTime.CourseN AND Teacher.Quarter = LocationNTime.Quarter
WHERE LocationNTime.RoomN = '34' AND LocationNTime.Quarter = 'Winter2011';
