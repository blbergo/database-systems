CREATE TABLE Course (
    CourseN SERIAL PRIMARY KEY,
    CourseName VARCHAR(100),
    Nunit INT
);

CREATE TABLE Teacher (
    CourseN INT REFERENCES Course(CourseN),
    Quarter VARCHAR(10), -- Fall2025, Spring2026, Summer2026
    TeacherName VARCHAR(100)
);

CREATE TABLE LocationNTime (
    CourseN INT REFERENCES Course(CourseN),
    Quarter VARCHAR(10),
    DayTime VARCHAR(20), -- M2:00AM, W12:30PM, etc.
    RoomN VARCHAR(10)
);

CREATE TABLE Student (
    StudentName VARCHAR(100),
    CourseN INT REFERENCES Course(CourseN),
    Quarter VARCHAR(10),
    PRIMARY KEY (StudentName, CourseN, Quarter)
);