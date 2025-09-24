SELECT Course.CourseN, Course.CourseName, LocationNTime.Quarter FROM Course
JOIN LocationNTime ON Course.CourseN = LocationNTime.CourseN
GROUP BY Course.CourseN, Course.CourseName, LocationNTime.Quarter
HAVING COUNT(DISTINCT LocationNTime.DayTime) > 1;
