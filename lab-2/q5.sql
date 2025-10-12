SELECT Course.CourseTitle, Course.CourseNumber FROM Course
WHERE Course.PrerequisiteCourseNumber IS NULL;