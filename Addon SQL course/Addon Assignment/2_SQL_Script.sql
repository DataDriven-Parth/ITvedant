create database company;

show databases;

use company;
create table employee(
id int,
first_name varchar(50),
last_name varchar(50),
date_of_joining date);

show tables;

alter table employee add salary float;

alter table employee drop column date_of_joining;

alter table employee add primary key(id);