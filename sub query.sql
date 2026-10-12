 #sub query

select * from employees
where deptno =
(select deptno from employees
where ename = 'smith');

# querry questions

# WAQTD name and hiredate of the employees if thr employee was hired after JONES.

select hiredate, ename from employees
where hiredate >=
(select hiredate from employees
where ename ='jones');

#  WAQTD all the details of the employee working in the same designiation as martin

select * from employees
where job = 
(select job from employees
where ename = 'martin');

# WAQTD names of the employees earning more than adams

select* from employees
where sal >=
(select sal from employees
where ename = 'adams')
order by sal desc;

# WAQTD all the details of the employees working as salesman in the dept 30 and earing commision more than allen and hired after ward
# clues deptno = 30, job = sales comm>= allen, hiredate >= ward

select * from employees
where deptno = 30 and job = 'salesman'
and hiredate >=
(select hiredate from employees
where ename = 'ward')
and comm >= 
(select comm from employees 
where ename = 'allen');

#  WAQTD name and hiredate of the employees was hired after jones and dept is 20

select * from employees
where hiredate >=
(select hiredate from employees
where ename = 'jones')
and deptno = 20
order by hiredate asc;

# case 2  (joins)
#  WAQTD dname of the employee whose name is miller, using sub query

select d.dname from employees e
inner join dept d on e.deptno = d.deptno
where e.ename ='miller';

# ename ='miller' sub query

select * from dept
where deptno =
(select deptno from employees
where ename = 'miller');

# WAQTD location of adams

select * from dept
where deptno=
(select deptno from employees
where ename ='adams');

#joins 
select * from employees e
inner join dept d on e.deptno = d.deptno
where ename = 'adams';

#  WAQTD names of the employees working in location coimbatore

select * from employees
where deptno =
(select deptno from dept
where loc ='coimbatore');

# joins
select * from employees e
inner join dept d on e.deptno= d.deptno
where loc = 'coimbatore';

# WAQTD number of employees working in dept DA

select count(*) from employees
where deptno =
(select deptno from dept
where dname = 'DA');


# WAQTD dnames of allen or smith

select dname  from dept
where deptno in
(select deptno from employees
where ename = 'allen' or ename ='smith');

#WAQTD ename, sal of all the employees earning more than smith and working in dept 20


select * from employees
 where sal >=
(select sal from employees
where ename = 'smith') and 
 deptno =20;
 
 # CASE 3
 #imppppp
 # WAQTD second maximum salary given to an employee
 
 select r1.* from
 (select *, dense_rank() over (order by sal desc) as dr from employees) as r1
 where r1.dr =2;

 #sub query
 
 select * from employees
 where sal =
 (select max(sal) from employees
 where sal<
(select max(sal) from employees));

select * from employees
where sal =
(select min(sal) from employees
where sal>(
select min(sal) from employees));

# WAQTD 4 max salary person
select r1.* from
(select *, dense_rank () over( order by sal desc) as dr from employees)as r1
where r1.dr =4;
 

 select * from employees where sal=
(select max(sal) from employees
 where sal<
(select max(sal) from employees
 where sal<
(select max(sal) from employees
 where sal<
(select max(sal) from employees))));

 #WAQTD 4th min salary person
 select r1.* from
 (select *, dense_rank() over (order by sal ASC) as dr from employees) as r1
 where r1.dr=4;
 
  select * from employees where sal=
(select min(sal) from employees
 where sal>
(select min(sal) from employees
 where sal>
(select min(sal) from employees
 where sal>
(select min(sal) from employees))));

# WAQTD name of the employee hired before the last employee

select r1.* from
(select *, dense_rank() over (order by hiredate asc) as dr from employees) as r1
where r1.dr = 1;

 select * from employees where hiredate =
 (select max(hiredate) from employees
where hiredate <(
select max(hiredate) from employees));

# WAQTD names of employees reporting to king

select * from employees
where mgr =
(select emp_no from employees where ename = 'king');

#WAQTD names of smiths managers manger.

select * from employees
where emp_no =
(select mgr from employees
where emp_no =
(select mgr from employees where ename = 'smith'));

# WAQTD name of the employees reporting under blake

 select * from employees
 where mgr = 
(select emp_no from employees where ename ='blake');


