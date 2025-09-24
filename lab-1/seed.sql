-- Seed data for Database Systems Lab #1
-- This data is designed to test all the queries specified in the lab

-- Insert Course data
INSERT INTO Course (CourseName, Nunit) VALUES 
('Introduction to Programming', 3),
('Database Systems', 4),
('Data Structures', 4),
('Computer Networks', 5),
('Software Engineering', 6),
('Machine Learning', 4),
('Web Development', 3),
('Operating Systems', 5),
('Algorithms', 4),
('Computer Graphics', 3);

-- Insert Teacher data
INSERT INTO Teacher (CourseN, Quarter, TeacherName) VALUES 
-- Karen Reed teaches multiple courses and quarters
(1, 'Spring2005', 'Karen Reed'),
(2, 'Spring2005', 'Karen Reed'),
(3, 'Winter2011', 'Karen Reed'),
(4, 'Fall2010', 'Karen Reed'),
-- Same course taught by Karen Reed multiple times
(1, 'Fall2004', 'Karen Reed'),
(1, 'Spring2006', 'Karen Reed'),

-- Other teachers
(2, 'Winter2011', 'John Smith'),
(3, 'Spring2005', 'Mary Johnson'),
(4, 'Winter2011', 'Robert Brown'),
(5, 'Fall2010', 'Lisa Davis'),
(6, 'Spring2005', 'Michael Wilson'),
(7, 'Winter2011', 'Sarah Miller'),
(8, 'Fall2010', 'David Taylor'),
(9, 'Spring2005', 'Jennifer Anderson'),
(10, 'Winter2011', 'James Thomas'),

-- Teachers who teach multiple courses
(5, 'Spring2005', 'John Smith'),
(6, 'Winter2011', 'Mary Johnson'),
(7, 'Fall2010', 'Robert Brown'),

-- Same quarter, different instructors for same course
(8, 'Fall2010', 'Lisa Davis'),
(8, 'Fall2010', 'Michael Wilson');

-- Insert LocationNTime data
INSERT INTO LocationNTime (CourseN, Quarter, DayTime, RoomN) VALUES 
-- Karen Reed's courses with room 33
(1, 'Spring2005', 'M10:00AM', '713'),
(2, 'Spring2005', 'W2:00PM', '713'),

-- Courses in room 34 for Winter2011
(2, 'Winter2011', 'T3:00PM', '34'),
(3, 'Winter2011', 'F11:00AM', '34'),

-- Courses in room 723
(4, 'Fall2010', 'M9:00AM', '723'),
(5, 'Fall2010', 'W1:00PM', '723'),
(6, 'Spring2005', 'T4:00PM', '723'),

-- Monday PM courses
(1, 'Fall2004', 'M6:00PM', '101'),
(4, 'Winter2011', 'M8:00PM', '102'),
(7, 'Winter2011', 'M7:30PM', '103'),

-- Courses that meet multiple times per week
(8, 'Fall2010', 'M10:00AM', '201'),
(8, 'Fall2010', 'W10:00AM', '201'),
(8, 'Fall2010', 'F10:00AM', '201'),

(9, 'Spring2005', 'T2:00PM', '202'),
(9, 'Spring2005', 'R2:00PM', '202'),

(10, 'Winter2011', 'M1:00PM', '203'),
(10, 'Winter2011', 'W1:00PM', '203'),

-- Additional times for Karen Reed's repeated courses
(1, 'Spring2006', 'T9:00AM', '301'),
(3, 'Winter2011', 'R11:00AM', '302');

-- Insert Student data
INSERT INTO Student (StudentName, CourseN, Quarter) VALUES 
-- Ron Smith's enrollments
('Ron Smith', 1, 'Spring2005'),
('Ron Smith', 2, 'Winter2011'),
('Ron Smith', 4, 'Fall2010'),

-- David Weidman's enrollments
('David Weidman', 3, 'Winter2011'),
('David Weidman', 5, 'Fall2010'),
('David Weidman', 6, 'Spring2005'),

-- Students who took the same course multiple times
('Alice Brown', 1, 'Spring2005'),
('Alice Brown', 1, 'Fall2004'),
('Bob Wilson', 2, 'Spring2005'),
('Bob Wilson', 2, 'Winter2011'),
('Carol Davis', 3, 'Winter2011'),
('Carol Davis', 3, 'Spring2005'),

-- Additional students for various courses
('Emma Johnson', 4, 'Fall2010'),
('Frank Miller', 5, 'Fall2010'),
('Grace Taylor', 6, 'Spring2005'),
('Henry Anderson', 7, 'Winter2011'),
('Ivy Thomas', 8, 'Fall2010'),
('Jack White', 9, 'Spring2005'),
('Kelly Green', 10, 'Winter2011'),

-- More students for comprehensive testing
('Laura Black', 1, 'Spring2006'),
('Mark Gray', 2, 'Spring2005'),
('Nancy Blue', 3, 'Winter2011'),
('Oscar Red', 4, 'Winter2011'),
('Paula Yellow', 5, 'Spring2005'),
('Quinn Purple', 6, 'Winter2011'),
('Rachel Orange', 7, 'Fall2010'),
('Steve Pink', 8, 'Fall2010'),
('Tina Silver', 9, 'Spring2005'),
('Uma Gold', 10, 'Winter2011');