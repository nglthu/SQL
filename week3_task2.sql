/*Generate a report to display staff full names, jobs and department names. Rename the
column headings to “Full Name”, “Job Title”, and “Department Name” a*/
select e.first_name, e.last_name, j.job_title, d.department_name

from employees e, jobs j,  departments d

where e.job_id = j.job_id and e.department_id = d.department_id;

/*Generate a report to display staff full names, email (email ID@MEGACORP.COM),
department name, and office address (city and country). Sort the output by last name.
Rename the columns accordingly and format the report as following*/

select e.first_name, e.last_name, e.email || '@MEGACORP.COM' as Email, d.department_name, l.city, c.COUNTRY_NAME

from employees e, departments d, locations l, countries c
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = l.LOCATION_ID and l.COUNTRY_ID =c.COUNTRY_ID
order by e.LAST_NAME
;
/*Modify the previous question to generate a dynamic report that display the staff details
for a specific country only. The report must ask the end user to enter a country name. Run
the report for Germany and New Zealand. Explain this report output and highlight possible
format improvement(s)*/
select e.first_name, e.last_name, e.email || '@MEGACORP.COM' as Email, d.department_name, l.city, c.COUNTRY_NAME

from employees e, departments d, locations l, countries c
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = l.LOCATION_ID and l.COUNTRY_ID =c.COUNTRY_ID and c.COUNTRY_NAME='&country_name'
order by e.LAST_NAME
;
/*Generate a report to display staff full name, job title, department name, start date and
end date for each employee position given in the job history table. Sort the report by
employee id and then by start date. Rename the columns accordingly and format the
report as following.
Note: some employees may used to work in a different department from their current
one. The query MUST display the department name and job title for that employee during
the time period in the job history table.*/

SELECT
    e.first_name || ' ' || e.last_name as Fullname,
    j.job_title,
    d.department_name,
    jh.start_date,
    jh.end_date
   
FROM
    job_history jh, employees e, departments d, jobs j
    
   where  
    e.department_id (+)=d.DEPARTMENT_ID and e.employee_id=jh.EMPLOYEE_ID
   order by jh.EMPLOYEE_ID, jh.START_DATE;
/*Generate a report to display staff full names, and department names. The report must
also include all departments that currently DO NOT have any staff assigned to it*/
select e.first_name, d.DEPARTMENT_NAME
from departments d, employees e
where d.department_id= e.department_id(+);
/*Generate a report to display the employee name and employee number along with their
manager’s name and manager number. Label the columns Employee, Emp#, Manager,
and Mgr#, respectively. */

SELECT
    e.first_name || e.last_name as employeeName, e.employee_id as Emp#,
    m.FIRST_NAME || m.last_name as managerName, m.MANAGER_ID as Mgr#
   
    
FROM
    employees e join  employees m
    on e.manager_Id = m.MANAGER_ID
    ;
/*The staff member “Steven King” does not have a manager. He is the CEO. Modify
question 6 to include “Steven King” in the report.*/

SELECT
    e.first_name ||' '|| e.last_name as employeeName, e.employee_id as Emp#,
    m.FIRST_NAME ||' '|| m.last_name as managerName, m.MANAGER_ID as Mgr#
   
    
FROM
    employees e join  employees m
    on e.manager_Id = m.MANAGER_ID(+)
    ;
/*Generate a report to display staff full name, job title and salary of all employees who
earn more than the average salary.*/
select AVG(salary) from employees;
/*average is 6461*/
SELECT
   
    e.FIRST_NAME,
    e.last_name,
   
    e. salary
    
FROM
    employees e, jobs j
    
    where e.job_id=j.job_id and e.salary> (select AVG(salary) from employees)
    ;
    