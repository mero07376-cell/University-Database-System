-- Create the database
CREATE DATABASE UniversityDB;
GO

USE UniversityDB;
GO

-- Create Departments table
CREATE TABLE Departments (
    DeptCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    OfficeNumber VARCHAR(20),
    OfficePhone VARCHAR(15),
    College VARCHAR(100)
);

INSERT INTO Departments (DeptCode, Name, OfficeNumber, OfficePhone, College) VALUES
('CS', 'Computer Science', 'Room 101', '555-0101', 'Engineering'),
('MATH', 'Mathematics', 'Room 102', '555-0102', 'Science'),
('ENG', 'English', 'Room 103', '555-0103', 'Arts'),
('BIO', 'Biology', 'Room 104', '555-0104', 'Science'),
('HIST', 'History', 'Room 105', '555-0105', 'Humanities');

-- Create Students table
CREATE TABLE Students (
    StudentID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    SSN VARCHAR(11) UNIQUE NOT NULL,
    CurrentCity VARCHAR(50),
    CurrentState VARCHAR(50),
    CurrentZip VARCHAR(10),
    CurrentPhone VARCHAR(15),
    PermanentCity VARCHAR(50),
    PermanentState VARCHAR(50),
    PermanentZip VARCHAR(10),
    PermanentPhone VARCHAR(15),
    Birthdate DATE,
    Sex CHAR(1),
    StudyYear INT,
    Section VARCHAR(10),
    MajorDeptCode VARCHAR(10),
    FOREIGN KEY (MajorDeptCode) REFERENCES Departments(DeptCode)
);

INSERT INTO Students (Name, SSN, CurrentCity, CurrentState, CurrentZip, CurrentPhone, PermanentCity, PermanentState, PermanentZip, PermanentPhone, Birthdate, Sex, StudyYear, Section, MajorDeptCode) VALUES
('John Doe', '123-45-6789', 'New York', 'NY', '10001', '555-1001', 'Boston', 'MA', '02101', '555-2001', '2000-01-01', 'M', 3, 'A', 'CS'),
('Jane Smith', '234-56-7890', 'Los Angeles', 'CA', '90210', '555-1002', 'Chicago', 'IL', '60601', '555-2002', '1999-02-02', 'F', 4, 'B', 'MATH'),
('Mike Johnson', '345-67-8901', 'Houston', 'TX', '77001', '555-1003', 'Phoenix', 'AZ', '85001', '555-2003', '2001-03-03', 'M', 2, 'A', 'ENG'),
('Emily Davis', '456-78-9012', 'Phoenix', 'AZ', '85001', '555-1004', 'Denver', 'CO', '80201', '555-2004', '2000-04-04', 'F', 3, 'B', 'BIO'),
('David Wilson', '567-89-0123', 'Philadelphia', 'PA', '19101', '555-1005', 'Seattle', 'WA', '98101', '555-2005', '1998-05-05', 'M', 4, 'A', 'HIST'),
('Sarah Brown', '678-90-1234', 'San Antonio', 'TX', '78201', '555-1006', 'San Diego', 'CA', '92101', '555-2006', '1999-06-06', 'F', 3, 'B', 'CS'),
('Chris Lee', '789-01-2345', 'San Diego', 'CA', '92101', '555-1007', 'Nashville', 'TN', '37201', '555-2007', '2001-07-07', 'M', 2, 'A', 'MATH'),
('Anna Taylor', '890-12-3456', 'Dallas', 'TX', '75201', '555-1008', 'Portland', 'OR', '97201', '555-2008', '2000-08-08', 'F', 3, 'B', 'ENG'),
('Tom Harris', '901-23-4567', 'San Jose', 'CA', '95101', '555-1009', 'Austin', 'TX', '73301', '555-2009', '1999-09-09', 'M', 4, 'A', 'BIO'),
('Lisa Martinez', '012-34-5678', 'Austin', 'TX', '73301', '555-1010', 'Jacksonville', 'FL', '32099', '555-2010', '2000-10-10', 'F', 3, 'B', 'HIST'),
('Kevin Garcia', '123-45-6780', 'Jacksonville', 'FL', '32099', '555-1011', 'Fort Worth', 'TX', '76101', '555-2011', '2001-11-11', 'M', 2, 'A', 'CS'),
('Rachel Rodriguez', '234-56-7891', 'Fort Worth', 'TX', '76101', '555-1012', 'Columbus', 'OH', '43201', '555-2012', '1998-12-12', 'F', 4, 'B', 'MATH'),
('Brian Lopez', '345-67-8902', 'Columbus', 'OH', '43201', '555-1013', 'Charlotte', 'NC', '28201', '555-2013', '2000-01-13', 'M', 3, 'A', 'ENG'),
('Megan Gonzalez', '456-78-9013', 'Charlotte', 'NC', '28201', '555-1014', 'Indianapolis', 'IN', '46201', '555-2014', '1999-02-14', 'F', 3, 'B', 'BIO'),
('Tyler Perez', '567-89-0124', 'Indianapolis', 'IN', '46201', '555-1015', 'New York', 'NY', '10001', '555-2015', '2001-03-15', 'M', 2, 'A', 'HIST');

-- Create Courses table
CREATE TABLE Courses (
    CourseNumber VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Semester VARCHAR(20),
    DeptCode VARCHAR(10),
    FOREIGN KEY (DeptCode) REFERENCES Departments(DeptCode)
);

INSERT INTO Courses (CourseNumber, Name, Description, Semester, DeptCode) VALUES
('CS101', 'Intro to Programming', 'Basics of coding', 'Fall 2023', 'CS'),
('CS201', 'Data Structures', 'Advanced algorithms', 'Spring 2024', 'CS'),
('MATH101', 'Calculus I', 'Limits and derivatives', 'Fall 2023', 'MATH'),
('MATH201', 'Linear Algebra', 'Matrices and vectors', 'Spring 2024', 'MATH'),
('ENG101', 'Composition', 'Writing skills', 'Fall 2023', 'ENG'),
('ENG201', 'Literature', 'Classic novels', 'Spring 2024', 'ENG'),
('BIO101', 'Cell Biology', 'Cell structure', 'Fall 2023', 'BIO'),
('BIO201', 'Genetics', 'DNA and inheritance', 'Spring 2024', 'BIO'),
('HIST101', 'World History', 'Ancient civilizations', 'Fall 2023', 'HIST'),
('HIST201', 'Modern History', '20th century events', 'Spring 2024', 'HIST');

-- Create Instructors table
CREATE TABLE Instructors (
    InstructorID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DeptCode VARCHAR(10),
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptCode) REFERENCES Departments(DeptCode)
);

INSERT INTO Instructors (Name, DeptCode, Salary) VALUES
('Alice Johnson', 'CS', 75000.00),
('Bob Smith', 'CS', 80000.00),
('Charlie Brown', 'MATH', 70000.00),
('Diana Prince', 'MATH', 72000.00),
('Eve Adams', 'ENG', 68000.00),
('Frank Miller', 'ENG', 69000.00),
('Grace Lee', 'BIO', 71000.00),
('Henry Ford', 'BIO', 73000.00),
('Ivy Chen', 'HIST', 65000.00),
('Jack Wilson', 'HIST', 67000.00);

-- Create Sections table
CREATE TABLE Sections (
    SectionID INT IDENTITY PRIMARY KEY,
    InstructorID INT,
    Year INT,
    CourseNumber VARCHAR(20),
    SectionNumber INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    FOREIGN KEY (CourseNumber) REFERENCES Courses(CourseNumber)
);

INSERT INTO Sections (InstructorID, Year, CourseNumber, SectionNumber) VALUES
(1, 2023, 'CS101', 1),  -- Alice teaches CS101
(2, 2024, 'CS201', 1),  -- Bob teaches CS201
(3, 2023, 'MATH101', 1),  -- Charlie teaches MATH101
(4, 2024, 'ENG101', 1),  -- Diana teaches ENG101
(5, 2023, 'BIO101', 1);  -- Eve teaches BIO101

-- Create Registrations table
CREATE TABLE Registrations (
    StudentID INT,
    SectionID INT,
    PRIMARY KEY (StudentID, SectionID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)
);

INSERT INTO Registrations (StudentID, SectionID) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),  -- John Doe in all 5 (>3)
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5),  -- Jane Smith in all 5
(3, 1), (3, 2), (3, 3), (3, 4),  -- Mike Johnson in 4
(4, 2), (4, 3), (4, 4), (4, 5),  -- Emily Davis in 4
(5, 1), (5, 3), (5, 5),  -- David Wilson in 3
(6, 1), (6, 2), (6, 4), (6, 5),  -- Sarah Brown in 4
(7, 2), (7, 3), (7, 4),  -- Chris Lee in 3
(8, 1), (8, 3), (8, 5),  -- Anna Taylor in 3
(9, 2), (9, 4), (9, 5),  -- Tom Harris in 3
(10, 1), (10, 2), (10, 3), (10, 4), (10, 5),  -- Lisa Martinez in all 5
(11, 1), (11, 3), (11, 5),  -- Kevin Garcia in 3
(12, 2), (12, 4),  -- Rachel Rodriguez in 2
(13, 1), (13, 2), (13, 3), (13, 4),  -- Brian Lopez in 4
(14, 3), (14, 4), (14, 5),  -- Megan Gonzalez in 3
(15, 1), (15, 2), (15, 5);  -- Tyler Perez in 3

select * from Registrations;

USE UniversityDB;
GO

CREATE PROCEDURE GenerateUniversityReports
AS
BEGIN
    -- 1. Number of instructors in each department
    SELECT D.Name AS DepartmentName, COUNT(I.InstructorID) AS InstructorCount
    FROM Departments D
    LEFT JOIN Instructors I ON D.DeptCode = I.DeptCode
    GROUP BY D.Name;

    -- 2. Department name that offers the maximum number of courses
    SELECT TOP 1 D.Name AS DepartmentName, COUNT(C.CourseNumber) AS CourseCount
    FROM Departments D
    LEFT JOIN Courses C ON D.DeptCode = C.DeptCode
    GROUP BY D.Name
    ORDER BY CourseCount DESC;

    -- 3. Name of each instructor with the names of courses they teach
    SELECT I.Name AS InstructorName, C.Name AS CourseName
    FROM Instructors I
    JOIN Sections S ON I.InstructorID = S.InstructorID
    JOIN Courses C ON S.CourseNumber = C.CourseNumber;

    -- 4. Number of students in each department (based on major)
    SELECT D.Name AS DepartmentName, COUNT(S.StudentID) AS StudentCount
    FROM Departments D
    LEFT JOIN Students S ON D.DeptCode = S.MajorDeptCode
    GROUP BY D.Name;

    -- 5. Department name that pays the total maximum salary to its instructors
    SELECT TOP 1 D.Name AS DepartmentName, SUM(I.Salary) AS TotalSalary
    FROM Departments D
    LEFT JOIN Instructors I ON D.DeptCode = I.DeptCode
    GROUP BY D.Name
    ORDER BY TotalSalary DESC;

    -- 6. Department name that has the maximum number of students (based on major)
    SELECT TOP 1 D.Name AS DepartmentName, COUNT(S.StudentID) AS StudentCount
    FROM Departments D
    LEFT JOIN Students S ON D.DeptCode = S.MajorDeptCode
    GROUP BY D.Name
    ORDER BY StudentCount DESC;

    -- 7. Name of instructors who earn a salary greater than the average salary of their department
    SELECT I.Name AS InstructorName
    FROM Instructors I
    JOIN (
        SELECT DeptCode, AVG(Salary) AS AvgSalary
        FROM Instructors
        GROUP BY DeptCode
    ) AvgSal ON I.DeptCode = AvgSal.DeptCode
    WHERE I.Salary > AvgSal.AvgSalary;

    -- 8. Department office telephone where its instructors earn the maximum salary (across all)
    SELECT TOP 1 D.OfficePhone AS OfficePhone
    FROM Departments D
    JOIN Instructors I ON D.DeptCode = I.DeptCode
    ORDER BY I.Salary DESC;

    -- 9. Name of students who are registered in more than 3 courses (via sections)
    SELECT S.Name AS StudentName
    FROM Students S
    JOIN Registrations R ON S.StudentID = R.StudentID
    GROUP BY S.StudentID, S.Name
    HAVING COUNT(R.SectionID) > 3;

    -- 10. Number of instructors in each course (based on sections taught)
    SELECT C.Name AS CourseName, COUNT(DISTINCT S.InstructorID) AS InstructorCount
    FROM Courses C
    LEFT JOIN Sections S ON C.CourseNumber = S.CourseNumber
    GROUP BY C.Name;
END;
GO
