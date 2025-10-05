/*SQL Procedure Assignment*/
create database new1;
use new1;

create table department (
    dept_id int primary key,
    dept_name varchar(50),
    manager_id int,
    location_id int
);

create table employee (
    emp_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    mobile varchar(50),
    hire_date date,
    job_id int,
    salary float,
    manager_id int,
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);

insert into  department (dept_id, dept_name, manager_id, location_id) values
(1, 'IT', 101, 10),
(2, 'Testing', 102, 20),
(3, 'Machine Learning', 103, 30),
(4, 'Support', 104, 40);

insert into  employee (emp_id, first_name, last_name, email, mobile, hire_date, job_id, salary, manager_id, dept_id) values
(1, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', '2021-04-15', 201, 45000, 301, 1),
(2, 'Pratik', 'Gajne', 'pratik.gajne@gmail.com', '9876500011', '2020-02-10', 202, 67000, 302, 3),
(3, 'Naresh', 'Bhatt', 'naresh.bhatt@gmail.com', '9876500022', '2019-06-22', 203, 48000, 301, 1),
(4, 'Nisha', 'Shetty', 'nisha.shetty@gmail.com', '9876500033', '2022-03-18', 204, 65000, 301, 1),
(5, 'Vishal', 'Kumar', 'vishal.kumar@gmail.com', '9876500044', '2021-09-05', 205, 56000, 302, 2),
(6, 'Niranjan', 'Pandey', 'niranjan.pandey@gmail.com', '9876500055', '2020-11-28', 206, 43000, 301, 1),
(7, 'Simran', 'Mehta', 'simran.mehta@gmail.com', '9876500066', '2019-07-10', 207, 56000, 304, 4),
(8, 'Vipul', 'Shekhawat', 'vipul.shekhawat@gmail.com', '9876500077', '2023-01-20', 208, 67000, 304, 4),
(9, 'Binay', 'Gosh', 'binay.gosh@gmail.com', '9876500088', '2020-09-13', 209, 32000, 301, 1),
(10, 'Nitin', 'Rao', 'nitin.rao@gmail.com', '9876500099', '2021-12-01', 210, 54000, 302, 2);

/*Procedure*/

delimiter //
create procedure get_employee()
begin
	select e.first_name,e.last_name,e.email,d.dept_name from employee e
    inner join department d on e.dept_id = d.dept_id;
end//
delimiter ;

call get_employee();

/*Function*/

delimiter //
create function grade_assigner(salary bigint)
returns varchar(1)
deterministic
begin 
	declare grade char(1);
    set grade = (case
		when salary between 0 and 10000 then 'D'
        when salary between 10000 and 30000 then 'C'
        when salary between 30000 and 60000 then 'B'
        else 'A'
        end);
	return grade;
end //
delimiter ;

select first_name, salary as Salary, grade_assigner(salary) as Grade from employee;

