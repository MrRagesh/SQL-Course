
-- 1. Create and select database
CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

-- 2. Remove old tables in foreign-key order
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- 3. Create students table
CREATE TABLE students (
    studentid INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    birthdate DATE,
    gender VARCHAR(10)
);

-- 4. Create courses table
CREATE TABLE courses (
    courseid INT AUTO_INCREMENT PRIMARY KEY,
    coursename VARCHAR(50),
    credits INT
);

-- 5. Create enrollment table
CREATE TABLE enrollment (
    enrollmentid INT AUTO_INCREMENT PRIMARY KEY,
    studentid INT,
    courseid INT,
    enrollmentdate DATE,
    FOREIGN KEY (studentid)
        REFERENCES students(studentid),
    FOREIGN KEY (courseid)
        REFERENCES courses(courseid)
);

-- 6. Insert 5 students
INSERT INTO students (firstname, lastname, birthdate, gender)
VALUES
('Arun', 'Kumar', '2003-05-15', 'Male'),
('Priya', 'Sharma', '2002-08-20', 'Female'),
('Rahul', 'Raj', '2003-01-10', 'Male'),
('Divya', 'Devi', '2002-11-25', 'Female'),
('Karthik', 'Suresh', '2003-07-05', 'Male');

-- 7. Insert 5 courses
INSERT INTO courses (coursename, credits)
VALUES
('Python', 4),
('SQL', 3),
('Data Analytics', 4),
('Java', 3),
('Excel', 2);

-- 8. Insert 5 enrollments
INSERT INTO enrollment (studentid, courseid, enrollmentdate)
VALUES
(1, 1, '2026-01-10'),
(2, 2, '2026-01-12'),
(3, 3, '2026-01-15'),
(4, 4, '2026-01-18'),
(5, 5, '2026-01-20');

-- 9. Display all tables
SELECT * FROM students; 
SELECT * FROM courses;
SELECT * FROM enrollment;

SELECT firstname,lastname FROM students;
