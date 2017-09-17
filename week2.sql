/*Generate a report to display staff full names and job titles of employees who earn $10,000
#or more.*/
SELECT
    first_name,
    last_name,
    job_title,
    salary
    
    
FROM
    employees e  JOIN jobs d
       USING (job_id)
 
where salary > 10000    ;
/*Modify the previous report to display full names, job titles and salary for any employee
whose salary is not in the range of $5,000 to $12,000.*/
SELECT
    first_name,
    last_name,
    job_title,
    salary
    
    
FROM
    employees e  JOIN jobs d
       USING (job_id)
 
where salary between 5000 and 12000 ;
/*Create a report to display the full name, job Title, and start working date for the following
staff members:
 Miss Hutton, Alyssa
 Mr Austin, David*/
SELECT
    first_name,
    last_name,
    job_title,
    salary,
    hire_date
    
    
FROM
    employees e  JOIN jobs d
       USING (job_id)
 
where (first_name like 'David' and last_name like 'Austin') or (first_name like 'Alyssa' and last_name like 'Hutton');
/*Create a report to display address, postal code and city for all offices that are located in Italy
and Japan.*/
SELECT
    department_name,
    street_address,
    postal_code,
    city,
    state_province,
    country_name
FROM
    departments d
    JOIN locations l
       USING (location_id)
    JOIN countries c
        using (country_id)
 where country_name like 'Italy' or country_name like 'Japan'   
    ;
/*Create a report to show staff full names in addition to contact details (email, phone
numbers) for all employees who were hired in January 1996. Display the names in
alphabetical order by last name. Format the report according to the example below. (Hint: to
identify the date format for your session use the following query select sysdate from dual).*/  
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    hire_date
    

FROM
    employees
where    
EXTRACT(MONTH FROM
   TO_DATE(hire_date, 'DD-MM-YY')) = 01 
and extract(year from hire_date) = 1996
 order by last_name, hire_date asc;
/*Modify the report you created in question 5 to display all the employees who were hired
after December 1999, display the results in descending order by hire date.*/ 
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    hire_date
    

FROM
    employees
where    
/*EXTRACT(MONTH FROM
   TO_DATE(hire_date, 'DD-MM-YY')) = 01 
and*/ extract(year from hire_date) > 1999
 order by hire_date desc;
 /*List all staff members who're their first name starts with the letter (S) and ends with the
letter (n)?*/
SELECT
   
    first_name,
    last_name
    
FROM
    employees
where first_name like 'S%n'    
    ;
/*List the employees who hold the following job titles (AC_MGR, AD_VP, FI_MGR, HR_REP,
PR_REP)?*/  
SELECT
    
    first_name,
    last_name,
    job_title
      
FROM
    employees e JOIN jobs d
       USING (job_id) 

where job_id in ('AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP','PR_REP')
    ;
/*The HR department wants to run reports based on a specific manager. Create a dynamic
report that prompts the user for a manager ID and generates the employee ID, last name,
salary, and department for that manager’s employees.*/    
SELECT
   
    employee_id,

    first_name,
    last_name,
    salary,
    DEPARTMENT_ID,
    
    manager_id
    
FROM
    employees
    where manager_id='&Manager_id'
    ;
/*List full details for all rooms with a price above $40 in ascending order by room type
and price*/
SELECT
    roomno,
    hotelno,
    type,
    price
FROM
    room
    where price >40
    order by TYPE asc
    ;
/*List the names and full addresses of all guests who live in AUT accommodation at “8
Mount St.”*/
SELECT
    guestno,
    guestname,
    guestaddress,
    guestcity
FROM
    guest
    where GUESTADDRESS like '8 Mount St.%';
/**/