/*Write SELECT statements to access data from more than one table using
equijoins and non-equijoins*/
/*equijoins*/
SELECT
    employee_id,
    first_name,
    last_name,
    email,
    
    department_name
FROM
    employees e join departments d
    on (e.department_id = d.department_id);
    
/*non-equijoins*/

SELECT
    
    first_name,
    last_name,
    e.SALARY,
    
    j.JOB_TITLE,
    j.min_salary,
    j.max_salary
    
    
FROM
    employees e join jobs j
    on e.salary between j.min_salary and j.max_salary
    
    ;
/*Join a table to itself by using a self-join*/
SELECT
    m.employee_id, m.MANAGER_ID
FROM
    employees m join employees e
    on m.employee_id = e.MANAGER_ID;
/*View data that generally does not meet a join condition by using outer joins*/
/*no employees in department*/
SELECT
    e.employee_id,
   
    d.department_id
FROM
    employees e join departments d
    on e.DEPARTMENT_ID (+) = d.DEPARTMENT_ID
    ;
/*Generate a report to display room details (price and type) in addition to the hotel
name for each room. Format the report as following:*/
SELECT
    
    h.hotelname,
    r.TYPE,
    r.PRICE
FROM
    hotel h join room r
    on r.hotelno = h.HOTELNO
    ;
/*Generate a report to display guest names along with their booking details (hotel name,
date from and date to). Format the report as following:guest name, hotel name, date from to*/

select g.GUESTNAME,h.HOTELNAME,b.DATEFROM, b.DATETO

from guest g , booking b , hotel h
where g.guestno = b.guestno and  b.hotelno=h.hotelno;
/**/