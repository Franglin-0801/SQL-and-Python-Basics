create view dept_30 as
select * from employees
where sal > 1000

select now();
select curdate();
select month(now());
select month(now()) as hiremonth, time (now()) as Present_time;
select datediff('2026-09-01','2026-01-01');
select date_add('2026-01-01',interval 20 day);
select date_add('2026-01-01',interval -20 day);

#date format 
select *, date_format(hiredate,'%m-%m-%y') as date_format from employees;
