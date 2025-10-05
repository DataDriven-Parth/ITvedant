-- create a database
create database tri_employee;
use tri_employee;


-- Create employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary FLOAT
);

-- Create AuditLog table
CREATE TABLE AuditLog (
    employee_id INT,
    Action VARCHAR(50)
);

-- AuditLog Trigger 
delimiter //
create trigger Logger
after insert
on employee
for each row
begin
	insert into AuditLog values (new.emp_id,'Employee Created');
end //
delimiter ;

-- Testing the trigger
insert into employee values
(1, 'John Doe', 'HR', 45000),
(2, 'Jane Smith', 'Finance', 55000),
(3, 'Mike Brown', 'IT', 60000);

-- result by trigger
select * from AuditLog;



-- Create AuditLog1 table
CREATE TABLE AuditLog1 (
    employee_id INT,
    Action VARCHAR(50)
);

-- creating deletion trigger
delimiter //
create trigger deletion
after delete on employee
for each row
begin
	insert into AuditLog1 values (old.emp_id,'Employee Deleted');
end //
delimiter ;

-- testing the deletion trigger
delete from employee
where emp_id = 3;

-- result in Audit Log1
select * from AuditLog1;


-- Create EmpCountLog table
CREATE TABLE EmpCountLog (
    emp_count int
);

set sql_safe_updates = 0;

-- Employee count trigger
delimiter //
create trigger insert_counter
after insert on employee
for each row
begin
	update EmpCountLog
    set emp_count = (select count(*) from employee);
end //
delimiter ;

delimiter //
create trigger delete_counter
after delete on employee
for each row
begin
	update EmpCountLog
    set emp_count = (select count(*) from employee);
end //
delimiter ;

-- testing trigger
insert into employee values
(3, 'Mike Brown', 'IT', 60000),
(4,'AAA','IT',90000);

select * from EmpCountLog;


