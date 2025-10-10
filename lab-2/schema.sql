CREATE TABLE Student (
    SSN CHAR(9) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Major VARCHAR(100)
);

CREATE TABLE Course (
    CourseNumber CHAR(10) PRIMARY KEY,
    PrerequisiteCourseNumber CHAR(10) REFERENCES Course(CourseNumber),
    CourseTitle VARCHAR(200) NOT NULL,
    NumberUnits INT NOT NULL
);

CREATE TABLE Section (
    CourseNumber CHAR(10) REFERENCES Course(CourseNumber),
    Quarter CHAR(15) NOT NULL,
    RoomNumber VARCHAR(15) NOT NULL,
    DayTime VARCHAR(20) NOT NULL,
    PRIMARY KEY (CourseNumber, Quarter)
);

CREATE TABLE Enrollment (
    SSN CHAR(9) REFERENCES Student(SSN),
    CourseNumber CHAR(10) REFERENCES Course(CourseNumber),
    Quarter CHAR(15) NOT NULL,
    Grade CHAR(2),
    PRIMARY KEY (SSN, CourseNumber, Quarter),
    FOREIGN KEY (CourseNumber, Quarter) REFERENCES Section(CourseNumber, Quarter)
);