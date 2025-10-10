-- Sample data for testing CS4350 Lab 2 queries

-- Insert Students
INSERT INTO Student (SSN, Name, Major) VALUES
('123456789', 'John Smith', 'Computer Science'),
('234567890', 'Jane Doe', 'Mathematics'),
('345678901', 'Bob Johnson', 'Computer Science'),
('456789012', 'Alice Brown', 'Physics'),
('567890123', 'Charlie Wilson', 'Computer Science'),
('678901234', 'Diana Miller', 'Mathematics');

-- Insert Courses
INSERT INTO Course (CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) VALUES
('CS101', NULL, 'Introduction to Programming', 3),
('CS201', 'CS101', 'Data Structures', 3),
('CS301', 'CS201', 'Algorithms', 3),
('MATH101', NULL, 'Calculus I', 4),
('MATH201', 'MATH101', 'Calculus II', 4),
('PHYS101', NULL, 'Physics I', 4),
('CS350', 'CS201', 'Database Systems', 3),
('CS401', 'CS301', 'Software Engineering', 3);

-- Insert Sections
INSERT INTO Section (CourseNumber, Quarter, RoomNumber, DayTime) VALUES
('CS101', 'Fall2023', 'Room101', 'MW 10:00-11:30AM'),
('CS101', 'Winter2024', 'Room102', 'TTh 2:00-3:30PM'),
('CS201', 'Winter2024', 'Room201', 'MW 1:00-2:30PM'),
('CS201', 'Spring2024', 'Room202', 'MW 3:00-4:30PM'),
('CS301', 'Spring2024', 'Room301', 'TTh 10:00-11:30AM'),
('MATH101', 'Fall2023', 'Room401', 'MW 9:00-10:30AM'),
('MATH101', 'Winter2024', 'Room402', 'MW 12:00-1:30PM'),
('MATH201', 'Spring2024', 'Room403', 'TTh 1:00-2:30PM'),
('PHYS101', 'Fall2023', 'Room501', 'MW 2:00-3:30PM'),
('CS350', 'Spring2024', 'Room203', 'MW 1:00-2:30PM'),
('CS401', 'Spring2024', 'Room302', 'TTh 3:00-4:30PM');

-- Insert Enrollments
INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
-- John Smith enrollments
('123456789', 'CS101', 'Fall2023', 'A'),
('123456789', 'MATH101', 'Fall2023', 'B'),
('123456789', 'CS201', 'Winter2024', 'A'),
('123456789', 'CS301', 'Spring2024', 'A'),
('123456789', 'CS350', 'Spring2024', NULL), -- Currently taking

-- Jane Doe enrollments  
('234567890', 'MATH101', 'Fall2023', 'A'),
('234567890', 'CS101', 'Winter2024', 'B'),
('234567890', 'MATH201', 'Spring2024', 'A'),
('234567890', 'CS201', 'Spring2024', 'B'),

-- Bob Johnson enrollments (retaking CS101)
('345678901', 'CS101', 'Fall2023', 'C'),
('345678901', 'CS101', 'Winter2024', 'B'), -- Retook
('345678901', 'CS201', 'Winter2024', 'A'),
('345678901', 'CS301', 'Spring2024', 'A'),

-- Alice Brown enrollments
('456789012', 'PHYS101', 'Fall2023', 'A'),
('456789012', 'MATH101', 'Winter2024', 'A'),
('456789012', 'CS101', 'Winter2024', 'A'),

-- Charlie Wilson enrollments (struggling student)
('567890123', 'CS101', 'Fall2023', 'D'),
('567890123', 'CS101', 'Winter2024', 'C'),
-- ('567890123', 'CS101', 'Spring2024', 'B'), -- Commented out until section is added
('567890123', 'MATH101', 'Fall2023', 'B'),

-- Diana Miller enrollments (perfect student)
('678901234', 'MATH101', 'Fall2023', 'A'),
('678901234', 'CS101', 'Winter2024', 'A'),
('678901234', 'MATH201', 'Spring2024', 'A');

-- Add more sections for comprehensive testing
INSERT INTO Section (CourseNumber, Quarter, RoomNumber, DayTime) VALUES
('CS101', 'Spring2024', 'Room103', 'MW 12:00-1:30PM'),
('CS401', 'Fall2023', 'Room302', 'MW 3:00-4:30PM'),
('CS350', 'Winter2024', 'Room203', 'TTh 1:00-2:30PM'),
('PHYS101', 'Winter2024', 'Room502', 'MW 2:00-3:30PM'),
('PHYS101', 'Spring2024', 'Room503', 'MW 1:00-2:30PM');

-- Update Charlie's enrollment - now add the section first, then the enrollment
-- (Section already added above, now add enrollment)
INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
('567890123', 'CS101', 'Spring2024', 'B');

-- Add more enrollments for comprehensive testing
INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
-- More enrollments for John Smith (perfect A student in completed courses)
('123456789', 'CS401', 'Spring2024', NULL), -- Currently taking

-- More enrollments for Bob Johnson
('345678901', 'CS350', 'Spring2024', 'A'),
('345678901', 'CS401', 'Fall2023', 'B'),

-- Alice Brown taking more courses
('456789012', 'PHYS101', 'Winter2024', 'A'), -- Retaking physics
('456789012', 'PHYS101', 'Spring2024', 'A'), -- Third time
('456789012', 'CS201', 'Spring2024', 'A'),

('678901234', 'CS201', 'Spring2024', 'A'),
('678901234', 'CS350', 'Spring2024', 'A');

-- Add a student who never got an A
INSERT INTO Student (SSN, Name, Major) VALUES
('789012345', 'Frank Davis', 'Engineering');

INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
('789012345', 'CS101', 'Fall2023', 'B'),
('789012345', 'MATH101', 'Fall2023', 'C'),
('789012345', 'CS201', 'Winter2024', 'B'),
('789012345', 'PHYS101', 'Winter2024', 'C');

-- Add a student who only takes MW afternoon classes
INSERT INTO Student (SSN, Name, Major) VALUES
('890123456', 'Grace Lee', 'Computer Science');

INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
('890123456', 'PHYS101', 'Fall2023', 'A'),    -- MW 2:00-3:30PM
('890123456', 'MATH101', 'Winter2024', 'B'),   -- MW 12:00-1:30PM
('890123456', 'CS201', 'Winter2024', 'A'),     -- MW 1:00-2:30PM
('890123456', 'CS201', 'Spring2024', 'A'),     -- MW 3:00-4:30PM
('890123456', 'CS350', 'Spring2024', 'B'),     -- MW 1:00-2:30PM
('890123456', 'PHYS101', 'Spring2024', 'A');   -- MW 1:00-2:30PM

-- Add student who has taken all MW afternoon courses
INSERT INTO Student (SSN, Name, Major) VALUES
('901234567', 'Henry Kim', 'Physics');

INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
('901234567', 'CS101', 'Fall2023', 'B'),       -- MW 10:00-11:30AM (morning)
('901234567', 'PHYS101', 'Fall2023', 'A'),     -- MW 2:00-3:30PM (afternoon)
('901234567', 'MATH101', 'Winter2024', 'A'),   -- MW 12:00-1:30PM (afternoon)
('901234567', 'CS201', 'Winter2024', 'B'),     -- MW 1:00-2:30PM (afternoon)
('901234567', 'CS201', 'Spring2024', 'A'),     -- MW 3:00-4:30PM (afternoon)
('901234567', 'CS350', 'Spring2024', 'B'),     -- MW 1:00-2:30PM (afternoon)
('901234567', 'PHYS101', 'Spring2024', 'A');   -- MW 1:00-2:30PM (afternoon)

-- Add student who never took MW afternoon classes
INSERT INTO Student (SSN, Name, Major) VALUES
('012345678', 'Ivy Johnson', 'Mathematics');

INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
('012345678', 'CS101', 'Fall2023', 'A'),       -- MW 10:00-11:30AM (morning)
('012345678', 'CS101', 'Winter2024', 'B'),     -- TTh 2:00-3:30PM (not MW)
('012345678', 'CS301', 'Spring2024', 'A'),     -- TTh 10:00-11:30AM (not MW)
('012345678', 'MATH201', 'Spring2024', 'A');   -- TTh 1:00-2:30PM (not MW)

-- Add more courses to test prerequisites
INSERT INTO Course (CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits) VALUES
('CS102', NULL, 'Programming Fundamentals', 3),
('CS202', 'CS102', 'Advanced Data Structures', 3),
('CS302', 'CS202', 'Advanced Algorithms', 3),
('MATH102', NULL, 'Statistics', 3),
('PHYS102', 'PHYS101', 'Physics II', 4);

-- Add sections for new courses
INSERT INTO Section (CourseNumber, Quarter, RoomNumber, DayTime) VALUES
('CS102', 'Fall2023', 'Room104', 'TTh 9:00-10:30AM'),
('CS202', 'Winter2024', 'Room204', 'MW 10:00-11:30AM'),
('MATH102', 'Fall2023', 'Room404', 'TTh 11:00-12:30PM'),
('PHYS102', 'Winter2024', 'Room504', 'MW 3:00-4:30PM');

-- Add enrollments for the new courses to increase enrollment numbers
INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
-- Multiple students in CS102 to test highest enrollment
('123456789', 'CS102', 'Fall2023', 'A'),
('234567890', 'CS102', 'Fall2023', 'B'),
('345678901', 'CS102', 'Fall2023', 'A'),
('456789012', 'CS102', 'Fall2023', 'B'),
('567890123', 'CS102', 'Fall2023', 'C'),
('678901234', 'CS102', 'Fall2023', 'A'),
('789012345', 'CS102', 'Fall2023', 'B'),
('890123456', 'CS102', 'Fall2023', 'A'),

-- MATH102 with high enrollment
('234567890', 'MATH102', 'Fall2023', 'A'),
('456789012', 'MATH102', 'Fall2023', 'A'),
('678901234', 'MATH102', 'Fall2023', 'A'),
('890123456', 'MATH102', 'Fall2023', 'B'),
('901234567', 'MATH102', 'Fall2023', 'A'),
('012345678', 'MATH102', 'Fall2023', 'A'),

-- Some students in CS202
('123456789', 'CS202', 'Winter2024', 'A'),
('345678901', 'CS202', 'Winter2024', 'B'),
('678901234', 'CS202', 'Winter2024', 'A'),

-- PHYS102 enrollments
('456789012', 'PHYS102', 'Winter2024', 'A'),
('901234567', 'PHYS102', 'Winter2024', 'B');