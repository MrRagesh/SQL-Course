create database studentdb;

use studentdb;

create table students (
    studentid int auto_increment primary key,
    firstname varchar(50),
    lastname varchar(50),
    birthdate date,
    gender varchar(10)
);

create table courses (
    courseid int auto_increment primary key,
    coursename varchar(50),
    credits int
);

create table enrollment (
    enrollmentid int auto_increment primary key,
    studentid int,
    courseid int,
    enrollmentdata date,
    foreign key (studentid)
        references students (studentid),
    foreign key (courseid)
        references courses (courseid)
);


INSERT INTO students (firstname, lastname, birthdata, genter)
VALUES
('Arun', 'Kumar', '2003-05-15', 'Male'),
('Priya', 'Sharma', '2002-08-20', 'Female'),
('Rahul', 'Raj', '2003-01-10', 'Male'),
('Divya', 'Devi', '2002-11-25', 'Female'),
('Karthik', 'Suresh', '2003-07-05', 'Male');

SELECT * FROM students;
