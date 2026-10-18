create database hospitaldb;

use hospitaldb;

create table Patients(
patient_id int primary key,
first_name varchar(50),
last_name varchar(20),
gender varchar(20),
date_of_birth date,
phone varchar(20),
city varchar(50)
);

insert into Patients(patient_id,first_name,last_name,gender,date_of_birth,phone,city)
value
(1, 'Arun', 'Kumar', 'Male', '1998-05-12', '9876501001', 'Chennai'),
(2, 'Priya', 'Sharma', 'Female', '2001-08-20', '9876501002', 'Madurai'),
(3, 'Karthik', 'Raj', 'Male', '1995-02-15', '9876501003', 'Coimbatore'),
(4, 'Divya', 'Lakshmi', 'Female', '2000-11-25', '9876501004', 'Trichy'),
(5, 'Sanjay', 'Kumar', 'Male', '1992-07-10', '9876501005', 'Salem'),
(6, 'Meena', 'Devi', 'Female', '1999-03-18', '9876501006', 'Tirunelveli'),
(7, 'Rahul', 'Das', 'Male', '1988-09-05', '9876501007', 'Chennai'),
(8, 'Nisha', 'Rani', 'Female', '2002-01-30', '9876501008', 'Erode'),
(9, 'Vignesh', 'Babu', 'Male', '1997-06-22', '9876501009', 'Madurai'),
(10, 'Anitha', 'Mary', 'Female', '1994-12-14', '9876501010', 'Vellore');


create table Doctors(
doctor_id int primary key,
doctor_name varchar(50),
specialization varchar(50),
phone varchar(15),
experience_year INT
);

insert into Doctors(doctor_id,doctor_name,specialization,phone,experience_year)
value
(101, 'Dr. Ravi', 'Cardiology', '9876510101', 10),
(102, 'Dr. Priya', 'Dermatology', '9876510102', 7),
(103, 'Dr. Kumar', 'Neurology', '9876510103', 12),
(104, 'Dr. Meena', 'Pediatrics', '9876510104', 8),
(105, 'Dr. Suresh', 'Orthopedics', '9876510105', 15),
(106, 'Dr. Divya', 'Gynecology', '9876510106', 9),
(107, 'Dr. Arun', 'General Medicine', '9876510107', 6),
(108, 'Dr. Nisha', 'Ophthalmology', '9876510108', 11),
(109, 'Dr. Karthik', 'ENT', '9876510109', 5),
(110, 'Dr. Anitha', 'Dentistry', '9876510110', 7);


create table Appointments(
appointment_id	INT Primary Key,
patient_id	INT ,
doctor_id	INT ,
appointment_date DATE,
appointment_time TIME,
status	VARCHAR(20),
foreign key (patient_id) references Patients(patient_id),
foreign key (doctor_id) references Doctors(doctor_id)
);

insert into Appointments(appointment_id,patient_id,doctor_id,appointment_date,appointment_time,status)
value 
(1001, 1, 101, '2026-10-20', '09:00:00', 'Scheduled'),
(1002, 2, 102, '2026-10-20', '10:00:00', 'Completed'),
(1003, 3, 103, '2026-10-21', '11:00:00', 'Scheduled'),
(1004, 4, 104, '2026-10-21', '12:00:00', 'Cancelled'),
(1005, 5, 105, '2026-10-22', '09:30:00', 'Completed'),
(1006, 6, 106, '2026-10-22', '10:30:00', 'Scheduled'),
(1007, 7, 107, '2026-10-23', '11:30:00', 'Completed'),
(1008, 8, 108, '2026-10-23', '14:00:00', 'Scheduled'),
(1009, 9, 109, '2026-10-24', '15:00:00', 'Cancelled'),
(1010, 10, 110, '2026-10-24', '16:00:00', 'Scheduled');

select * from Patients;
select * from Doctors;
select * from Appointments;

-- Level 1 — WHERE
-- 1. Display all patients who live in Chennai.
select
patient_id,first_name,last_name,date_of_birth,city
from Patients where city = 'Chennai';
-- 2.Display all patients whose gender is Female. 
select
patient_id,first_name,last_name,date_of_birth,city,gender
from Patients where gender = 'Female';
-- 3.Display all doctors whose specialization is Cardiology. 
select 
doctor_id, doctor_name, specialization, phone ,experience_year
from Doctors where specialization = 'Cardiology';
-- 4.Display all appointments whose status is Scheduled. 
select 
appointment_id, patient_id, doctor_id ,appointment_date ,appointment_time, status
from Appointments where status = 'Scheduled';
-- 5.Display all patients born after 1 January 2000.
select
first_name ,last_name, gender ,date_of_birth, phone, city
from Patients where date_of_birth > '2000-01-01';










