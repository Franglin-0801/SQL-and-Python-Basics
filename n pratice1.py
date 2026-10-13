# A company stores employee salaries in a list. Write a program to increase every employee's salary by 10 percent and display the updated salaries.

employees_salaries = [10000,12000,15000,17000,20000]
updated_salary = []
for salary in employees_salaries:
 ten_percentage = 10 * (salary/100)
 new_salary = salary + ten_percentage
 print(salary, ten_percentage, new_salary)
 updated_salary.append(new_salary)

for newsalary in updated_salary:
 print("Updated salary","-",newsalary )
 

 

