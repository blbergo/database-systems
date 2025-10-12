WITH PreqCount as (
    SELECT PrerequisiteCourseNumber, COUNT(*) as count FROM Course
    WHERE PrerequisiteCourseNumber IS NOT NULL
    GROUP BY PrerequisiteCourseNumber
)
SELECT Course.CourseTitle, count FROM PreqCount
JOIN Course ON PreqCount.PrerequisiteCourseNumber = Course.CourseNumber
WHERE count = (SELECT MAX(count) FROM PreqCount);