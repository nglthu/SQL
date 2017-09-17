/*Use SQL character functions to generate a report for staff names and full email address
(email_ID@megacorp.com).*/
SELECT
    
    CONCAT(first_name||', ',' '||last_name) as Fullname,
    email||'@megacorp.com' as Email
    
FROM
    employees;
/*Use formatting functions to generate a report that display employees last names, basic salary
with local currency as a prefix (e.g. NZD), commission percentage, and commission value
(Salary * Commission %). If there is no commission value, the report should display “No
Commission” message. The output should be alphabetically sorted with respect to the last
names as shown below:*/
SELECT
    last_name,
    CONCAT('NZD', salary) as Salary,
    NVL(to_char(commission_pct,'FM99.9'),0) as "Comission %",
    NVL(to_char(salary*commission_pct,'FM9999'),'no comission') as "Comission"
    
    
    
FROM
    employees;
    
/*Generate a report to display full name, length (number of characters) of full name, hire day
and hire date for all staff members who earn a commission and do not hold the job title
“SA_MAN”. Rename the columns accordingly and format the report as following:*/
select Concat(e.last_name|| ' ',' '||e.first_name) as Fullname, 
Concat(length(concat(e.last_name,e.first_name)),' char') as "Length of fullname",
TO_CHAR(e.HIRE_DATE,'DY') as "Hire day",

e.HIRE_DATE as "Hire date"

from employees e, jobs j
where j.job_id=e.job_id
;
/*Generate a dynamic report to search for specific first name value and display the employee
full name, job title, and full email address (email_ID@megacorp.com). The report should
accept the end user input for first name value in any format (Uppercase, Lowercase, Mix-
case). Rename the columns accordingly and format the report as following:*/
select concat(e.first_name||' ',' '||e.last_name) as Fullname,
j.job_title as "JOB TITLE",
concat(e.email,'@megacorp.com') as Email

from employees e, jobs j
where e.job_id = j.job_id;
/*Generate a report to display the minimum, maximum, mean, and standard deviation for the
salary attribute. Rename the column names accordingly. Also round both average and
standard deviation columns to two decimal places.*/
select round(STDDEV(e.salary),2) as "Deviation", round(avg(e.salary),2) as "Mean"

from employees e;
/*Generate a report to display a unique list of job titles from the employees table with number
of employees for each job title. Sort the output by the number of employees in each job from
highest to lowest.*/
select e.job_id "Job Title", COUNT(e.EMPLOYEE_ID)  "number of employees"

from employees e
group by e.job_id
order by count(e.job_id) desc;
/*Modify the report in question 5 to display the minimum, maximum, average, and standard
deviation of salary for all employees in department 80. Round both average and standard
deviation columns to two decimal places.*/
select min(e.salary), max(e.salary), round(STDDEV(e.salary),2) as "Deviation", round(avg(e.salary),2) as "Mean"

from employees e
where e.department_id=80;
/*Generate a report to calculate the average salary in each department (i.e. department
name). The average salary must be rounded to 2 digits numbers according to the following
format. Sort the output by the average salary values in descending order*/
select e.department_id "Department Number", d.department_name "Department Name", round(AVG(e.SALARY),2) "Average salary"

from employees e, departments d
where e.department_id = d.department_id
group by e.DEPARTMENT_ID, d.department_name
order by round(AVG(e.SALARY),2) desc
;
/*Modify the previous report to display the average salary in each department but only for
departments who have average salary more than 6000.*/
select e.department_id "Department Number", d.department_name "Department Name", round(AVG(e.SALARY),2) "Average salary"

from employees e, departments d
where e.department_id = d.department_id

group by e.DEPARTMENT_ID, d.department_name
having round(AVG(e.SALARY),2) >6000
order by round(AVG(e.SALARY),2) desc

;
/*Generate a report to display staff full name, job title, department name, start date, end date
and the number of months spent in that position. Rename the columns accordingly and format
the report as following.
Note: some employees may used to work in a different department from their current one.
The query MUST display the department name and job title for that employee during the time
period in the job history table.*/
select
concat(e.first_name||' ',''||e.last_name) as Fullname,
j.job_title as "Job title",
d.DEPARTMENT_NAME as "Department name",
jh.start_date as "Start date",
jh.END_DATE as "End date",
trunc( months_between(jh.END_DATE,jh.start_date) ) "Number of months"
from employees e, departments d, jobs j, job_history jh
where e.job_id = j.job_id and e.department_id=d.department_id and e.employee_id=jh.EMPLOYEE_ID;