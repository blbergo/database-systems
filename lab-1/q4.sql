SELECT LocationNTime.CourseN, LocationNTime.Quarter, LocationNTime.RoomN, LocationNTime.DayTime FROM LocationNTime
JOIN Teacher ON LocationNTime.CourseN = Teacher.CourseN AND LocationNTime.Quarter = Teacher.Quarter
WHERE Teacher.TeacherName = 'Karen Reed' AND LocationNTime.Quarter = 'Spring2005';