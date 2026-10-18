create database if not exists hospital_managementdb;

use hospital_managementdb;

create table Patients(
patientId int primary key, 
firstName varchar(50), 
lastName varchar(50), 
gender varchar(10), 
dateOfBirth date, 
phone varchar(20), 
city varchar(50)
);

create table Doctors(
doctorId int primary key, 
firstName varchar(50), 
lastName varchar(50), 
specialization varchar(50), 
phone varchar(20), 
salary int
);

create table Departments(
departmentId int primary key, 
departmentName varchar(50), 
location varchar(50)
);

create table Appointments(
appointmentId int primary key, 
patientId int, 
doctorId int, 
appointmentDate date, 
status varchar(25),
foreign key (patientId) references Patients(patientId),
foreign key (doctorId) references Doctors(doctorId)
);

create table Medicines(
medicineId int primary key, 
medicineName varchar(50), 
manufacturer varchar(50), 
price decimal(10,2), 
stockQuantity int
);

create table Bills(
billId int primary key, 
patientId int, 
billDate date, 
totalAmount decimal(10,2), 
paymentStatus varchar(20),
foreign key (patientId) references Patients(patientId)
);

insert into Patients
(patientId, firstName, lastName, gender, dateOfBirth, phone, city)
values
(1, 'Arun', 'Kumar', 'Male', '2002-05-10', '9876501001', 'Chennai'),
(2, 'Priya', 'Devi', 'Female', '2001-08-15', '9876501002', 'Madurai'),
(3, 'Karthik', 'Raj', 'Male', '2000-12-20', '9876501003', 'Coimbatore'),
(4, 'Divya', 'Sri', 'Female', '2003-03-25', '9876501004', 'Salem'),
(5, 'Sanjay', 'Kumar', 'Male', '2002-11-05', '9876501005', 'Tirunelveli');

insert into Doctors
(doctorId, firstName, lastName, specialization, phone, salary)
values
(101, 'Ravi', 'Shankar', 'Cardiology', '9876510001', 80000),
(102, 'Meena', 'Lakshmi', 'Neurology', '9876510002', 90000),
(103, 'Suresh', 'Kumar', 'Orthopedics', '9876510003', 75000),
(104, 'Anitha', 'Devi', 'Pediatrics', '9876510004', 70000),
(105, 'Bala', 'Murugan', 'Dermatology', '9876510005', 65000);

insert into Departments
(departmentId, departmentName, location)
values
(1, 'Cardiology', 'First Floor'),
(2, 'Neurology', 'Second Floor'),
(3, 'Orthopedics', 'First Floor'),
(4, 'Pediatrics', 'Ground Floor'),
(5, 'Dermatology', 'Third Floor');

insert into Appointments
(appointmentId, patientId, doctorId, appointmentDate, status)
values
(1001, 1, 101, '2026-10-15', 'Completed'),
(1002, 2, 104, '2026-10-16', 'Scheduled'),
(1003, 3, 103, '2026-10-17', 'Completed'),
(1004, 4, 102, '2026-10-18', 'Scheduled'),
(1005, 5, 105, '2026-10-19', 'Cancelled');

insert into Medicines
(medicineId, medicineName, manufacturer, price, stockQuantity)
values
(201, 'Paracetamol', 'MediCare', 25.00, 100),
(202, 'Vitamin C', 'HealthPlus', 60.00, 80),
(203, 'Cough Syrup', 'MediCare', 90.00, 50),
(204, 'Antacid', 'PharmaLife', 40.00, 70),
(205, 'Allergy Tablets', 'HealthPlus', 55.00, 60);

insert into Bills
(billId, patientId, billDate, totalAmount, paymentStatus)
values
(301, 1, '2026-10-15', 2500.00, 'Paid'),
(302, 2, '2026-10-16', 1800.00, 'Pending'),
(303, 3, '2026-10-17', 3200.00, 'Paid'),
(304, 4, '2026-10-18', 1500.00, 'Pending'),
(305, 5, '2026-10-19', 900.00, 'Paid');

select * from Patients;
select * from Doctors;
select * from Departments;
select * from Appointments;
select * from Medicines;
select * from Bills;