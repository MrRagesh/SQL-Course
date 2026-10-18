create database sales_management;

use sales_management;

create table ProductLines(
productLine varchar(50) primary key,
textDescription varchar(4000) default null,
htmlDescription mediumtext ,
image blob );

create table Products(
productCode varchar(15) primary key,
productName varchar(70) not null,
productScale varchar(70),
productVendor varchar(70),
productDescription text,
quantityInStock int ,
buyPrice decimal(10,2),
MSRP decimal(10.2),
foreign key(productLine) references ProductLines(ProductLine));



