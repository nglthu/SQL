SELECT
    hotelname, city
FROM
    hotel;
/*Full detail of all guest*/
SELECT
    guestno,
    guestname,
    guestaddress,
    guestcity
FROM
    guest;    
/*Create a report to display the room number and price of all “Standard” rooms.


*/
select roomno, price from room where TYPE='S' ;   


/*4. Create a report to display name and address details for all guests who live in London.*/
SELECT
    guestno,
    guestname,
    guestaddress,
    guestcity
FROM
    guest
    where guestcity='London';


/*5. Create a report to list all bookings for which no dateTo has been specified.*/

SELECT
    hotelno,
    guestno,
    datefrom,
    dateto,
    roomno
FROM
    booking
    where datefrom > '26/12/03';

/*using between ...and*/
SELECT
    hotelno,
    guestno,
    datefrom,
    dateto,
    roomno
FROM
    booking
    where datefrom between '26/12/03' and '06/06/04';    