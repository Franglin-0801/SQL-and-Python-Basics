SELECT * FROM sla_students.employees;

select * from employees where deptno =30 or deptno  = 20;

select * from employees where deptno in (20,30);

select * from employees;

use sla_students;

INSERT INTO employees (emp_no, ename, job, mgr, sal, comm, deptno, hiredate) VALUES
(7698, 'blake', 'manager', 7839, 2850, NULL, 30, '1981-05-01'),
(7782, 'clark', 'manager', 7839, 2450, NULL, 10, '1981-06-09'),
(7788, 'scott', 'analyst', 7566, 3000, NULL, 20, '1987-04-19'),
(7844, 'turner', 'salesman', 7698, 1500, 0, 30, '1981-09-08'),
(7876, 'ADAMS', 'CLERK', 7788, 1100, NULL, 20, '1987-05-23'),
(7900, 'JAMES', 'CLERK', 7698, 950, NULL, 30, '1981-12-03'),
(7902, 'FORD', 'ANALYST', 7566, 3000, NULL, 20, '1981-12-03'),
(7934, 'MILLER', 'CLERK', 7782, 1300, NULL, 10, '1982-01-23');

select * from employees where hiredate between '1981-01-01' and '1981-09-30' and deptno = 30
order by hiredate asc;

select * from employees where job = 'salesman' and deptno = 30 order by ename asc;

use sla_students;

select * from employees where ename like 'c%';

select * from employees where job like 's%n';

select * from employees where job like '_l%';

select * from employees where ename like'%m_';

select * from employees  
order by hiredate  desc
limit 1;

select  min(hiredate), max(hiredate) from employees;

select * from employees where hiredate = (
 select max(hiredate) from employees );



# 24/08/26

select * from employees;
select count(deptno),deptno from employees
group by deptno;

select deptno, count(deptno) as count, sum(sal) as sum,max(sal) as sum_of_sal, avg(sal) as avg_sal from employees
group by deptno
order by deptno asc;

select deptno,count(deptno) as count, sum(sal) as sum_of_sal from employees
where deptno = 30
group by deptno
having sum(sal) >=5000
order by deptno;

select hiredate,count(hiredate) as count, sum(sal) as sum_of_sal from employees
group by hiredate
having sum(sal) >=5000;

select year(hiredate) as hier_year,count(hiredate) as Hire_count, sum(sal) as sum_of_sal from employees            # interview
group by year(hiredate)
having sum(sal) >=4000;

select month(hiredate),count(hiredate) as Hire_month, sum(sal) as sum_of_sal from employees
where month(hiredate) between 6 and 12
group by month(hiredate)
having sum(sal) >= 1000
limit 10 ;



