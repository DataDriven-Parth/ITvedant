/*SQL Views Assignment*/

create database a_employee;
use a_employee;

create table Employee(
id int,
first_name varchar(10),
last_name varchar(10),
salary bigint,
dept_id int,
e_role varchar(20));

insert into Employee values
(1, 'Rahul', 'Sharma', 45000, 1, 'IT_PROG'),
(2, 'Pratik', 'Gajne', 67000, 2, 'ML_ENGG'),
(3, 'Naresh', 'Bhatt', 48000, 1, 'IT_PROG'),
(4, 'Nisha', 'Shetty', 65000, 1, 'IT_PROG'),
(5, 'Vishal', 'Kumar', 56000, 2, 'TESTER'),
(6, 'Niranjan', 'Pandey', 43000, 1, 'IT_PROG'),
(7, 'Simran', 'Mehta', 56000, 1, 'SUPPORT'),
(8, 'Vipul', 'Shekhawat', 67000, 2, 'SUPPORT'),
(9, 'Binay', 'Gosh', 32000, 1, 'IT_PROG'),
(10, 'Nitin', 'Rao', 54000, 2, 'TESTER');

/*Task 1*/
create view EmployeeView as
select id,first_name,last_name,e_role from Employee
where e_role = 'IT_PROG';

select * from EmployeeView;

/*Task 2*/
insert into Employee values
(11,'Piyush','Bansal',52000,2,'Data Analyst');

insert into EmployeeView values
(12,'AAA','BBB','IT_PROG');

/*Task 3*/
SET sql_safe_updates = 0;

update EmployeeView
set e_role = "IT_PROGRAMMER"; 

select * from  EmployeeView;

/*Task 4*/
delete from EmployeeView
where id = 4;

select * from EmployeeView;

/*End*/