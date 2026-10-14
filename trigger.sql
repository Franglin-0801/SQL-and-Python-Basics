create database trigger_sql;

# two types of table 1st primary table
# trigger table

create table emp(
id int auto_increment primary key,
name varchar(100) not null,
salary decimal(10,2) not null,
deptname varchar(100),
created_at timestamp default current_timestamp);

select * from emp;
insert into emp (name, salary, deptname) values ('Godwin', 10000 ,'DA') , ('saran',11000,'SAP');
insert into emp (name, salary, deptname) values ('Abi', 9000 ,'Python');
delete from emp where id=2;
drop table emp;

create table trigger_table (
log_id int auto_increment primary key,
emp_id int not null,
action varchar(30) not null,
old_data varchar(100),
new_data varchar(100),
action_time timestamp default current_timestamp
);
drop table triiger_table;

delimiter &&
create trigger after_emp_insert
after insert
on emp
for each row
begin
insert into trigger_table (emp_id,action,old_data,new_data,action_time) 
values (new.id,"insert",null,concat("name :",new.name," ","salary :",new.salary," ", "dept name :",new.deptname),now());
end &&

insert into emp (name, salary, deptname) values ('Raja', 11000 ,'react');
insert into emp (name, salary, deptname) values ('Irish', 10000 ,'Java');
select * from emp;
select * from trigger_table;

# droping a trigger 
drop trigger if exist after_emp_insert;


# Assignment

create table sla_students(
id int auto_increment primary key,
name varchar(100) not null,
subject varchar(100) not null,
joining_date Date,
created_at timestamp default current_timestamp);

insert into sla_students (name, subject, joining_date) values ('Godwin', 'science' ,'2026-08-30') , ('saran','tamil','2026-08-30');
insert into sla_students (name, subject, joining_date) values ('Abi', 'maths' ,'2026-08-31');
select * from sla_students;

create table trig_table (
log_id int auto_increment primary key,
student_id int not null,
action varchar(100),
old_data varchar(100),
new_data varchar(100),
action_time timestamp default current_timestamp);

delimiter &&
create trigger after_sla_student_insert
after insert on sla_students for each row
begin
insert into trig_table ( student_id, action, old_data, new_data, action_time)
values (new.id,"insert",null,concat("name: ",new.name," ", "subject ;",new.subject," ","joining_date :",new.joining_date ),now());
end &&
insert into sla_students (name, subject, joining_date) values ('Vishwa', 'History' ,'2026-08-29');
insert into sla_students (name, subject, joining_date) values ('Subash', 'computer' ,'2026-08-25');
insert into sla_students (name, subject, joining_date) values ('Lokesh', 'English' ,'2026-08-20');
insert into sla_students (name, subject, joining_date) values ('Franglin', 'Maths' ,'2026-08-22');
insert into sla_students (name, subject, joining_date) values ('Dominic', 'Computer application','2026-08-24');
insert into sla_students (name, subject, joining_date) values ('Akash', 'Computer' ,'2026-08-30');

select * from sla_students;
select * from trig_table;

#waqt If the salary entered is less than 10000, automatically set it to 10000.

create table employees (
id int auto_increment primary key,
name varchar(30),
slaary int);

alter table employees add created_at timestamp default current_timestamp;
alter table employees rename column slaary to salary;

create table updated_table (
log_id int auto_increment primary key,
emp_id int not null,
action  varchar(100),
old_data varchar(100),
new_data varchar(100),
action_time timestamp default current_timestamp);

delimiter &&
create trigger before_employee_salary 
before insert on employees for each row
begin
insert into updated_table (id,action,old_data,new_data,action_time)
values (new.id,"insert",concat("name: ",new.name, " ", "salary ;",new.salary),null,now());
end &&

insert into employees (name,salary) values ('saran', 9000);  
insert into employees (name,salary) values ('abi',10000) ;
insert into employees (name,salary) values ('raja',9000);

delimiter &&
create trigger before_employee_salary 
before insert on employees for each row
begin
if new.salary <10000 then set new.salary = 10000;
end if;
end &&

delimiter &&
create trigger before_employee_salary 
before insert on employees for each row
begin
if new.salary <10000 then set new.salary = 10000;
end if;
end &&

delimiter &&
create trigger before_employee_salary 
after insert on employees for each row
begin
insert into updated_table (id,action,old_data,new_data,action_time)
values (new.id,"insert",concat("name: ",new.name, " ", "salary ;",new.salary),null,now());
end &&

# update

delimiter &&
create trigger emp_after_update
after update
on emp
for each row
begin
insert into trigger_table (emp_id, action, old_data, new_data, action_time) values 
(old.id,"update",concat("Name :",old.name, " - ", "Salary :",old.salary, " - ","Depatname :",old.deptname), 
concat("Name :",new.name, " - ", "Salary :",new.salary, " - ","Depatname :",new.deptname), 
now());
end &&

drop trigger if exists emp_after_update;
use trigger_sql;

update emp
set salary = 15000
where id =2;

update emp
set salary = 15000
where name ='saran';
select * from trigger_table;
select * from emp;

delimiter &&
create trigger subject_update
after update
on sla_students
for each row
begin
insert into trig_table (student_id,action,old_data,new_data,action_time) values
(old.id,"UPDATE",concat("Name :", old.name, " - ", "Subject :", old.subject, " - ", "joining_date:", old.joining_date), 
concat("Name :", new.name, " - ", "Subject :", new.subject, " - ", "joining_date:", new.joining_date), now());
end &&

update sla_students
set subject = 'Biology'
where id = 8;

select * from sla_students;
select * from trig_table;

# Delete

delimiter &&
create trigger after_delete_emp
after delete
on emp
for each row
begin
insert into trigger_table (emp_id,action,old_data,new_data,action_time) values
(old.id,"Delete", concat( "Name :",old.name, " - ", "Salary :",old.salary, " - ", "Deptname ;",old.deptname),null, now());
end &&

drop trigger if exists after_delete_emp;
select * from emp;
select * from trigger_table;

delete from emp 
where id =5;