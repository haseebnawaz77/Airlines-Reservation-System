--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

--Procedure #1 - Searching based on the location  --

set serveroutput on 
create or replace procedure AdminP1_View_Flight
--This procedure allows the admin to view the details of the flight based on a given source --
(p_origin IN flight.origin%type)
IS 
-- Vairables -- 
    v_flightnum flight.flight_num%TYPE;
    v_airlines flight.airlines%TYPE;
    v_origin flight.origin%TYPE;
    v_destination flight.destination%TYPE;
    v_flight_date flight.flight_date%TYPE;
    v_seats flight.remaining_seats%TYPE;
    v_fare  flight.fare%type;

-- declaring the cursor--
cursor C1 is 
    select * From flight 
    where origin = P_origin;
BEGIN 

Open c1;
DBMS_OUTPUT.put_line('Flights from ' || P_origin );
DBMS_OUTPUT.put_line(' ');
LOOP
    --looping the cursor into the variables and printing the outcome-- 
    FETCH c1 INTO v_flightnum, v_airlines, v_origin, v_destination,  v_flight_date,v_seats,  v_fare;
    exit when c1%NOTFOUND ;
    dbms_output.put_line( 'Flight Number: ' || v_flightnum ||' |  Airlines: ' ||v_airlines || ' |   '|| v_origin || 
    ' to ' || v_destination || '   | ' || v_flight_date || '   |  Seats Remaining: '|| v_seats || '   | Price: '|| v_fare);
END LOOP;    
close c1;
END;
/


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

--Procedure #2- Updating Fare given a specific flight number--


create or replace procedure adminP2_update_fare
--This proc. allows the admin to update fare given the flight_num --
(P_flight_num IN flight.flight_num%type,
P_new_fare flight.fare%type)
is 
BEGIN 
    Update flight 
    set fare =  p_new_fare
    where flight_num = P_flight_num;
    dbms_output.put_line('The Fare has been updated to '|| p_new_fare || ' for flight ' || P_flight_num);
    commit;
END;
/


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

 -- procedure #3- Displaying the reservation for given flight(based on flight number) -- 




set serveroutput on
create or replace procedure Adminp3_search_reservation
--This Procedure allows the ADMIN to search all the reservations for a given flight --
(p_flight_num IN reservation.flight_num%type)
IS

    v_res_num reservation.reservation_num%type;
    v_flight_num reservation.flight_num%type;
    v_passengerID reservation.passengerid%type;
    v_res_date reservation.reservation_date%type;
    V_num_pass reservation.num_of_passengers%type;
  
-- -- Cursor C1 -- --
    cursor c1 is
    select *From reservation
    where flight_num = p_flight_num;

BEGIN 
        DBMS_OUTPUT.PUT_LINE('All Reservations for flight Number ' ||p_flight_num ||': ');
        DBMS_OUTPUT.PUT_LINE('');
open c1;
loop
    fetch c1 into v_res_num, v_flight_num, v_passengerid, v_res_date, v_num_pass;
    exit when c1%NOTFOUND OR c1%NOTFOUND IS NULL;
    DBMS_OUTPUT.PUT_LINE('Reservation Number: '||v_res_num || '  |  Flight Number: ' || v_flight_num ||
     '  |    Passenger ID: ' ||v_passengerid|| '  |   Reservation Date: ' ||v_res_date || '  |   Number of Passengers '||v_num_pass );
END loop;
close c1;
end;
/

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


  -- Procedure #4 - displaying passanger detailes based on passenger ID  --


set serveroutput on
create or replace procedure adminp4_passenger_details
--This procedure allows the admin to seach for customer details given the ID--
(P_ID passenger.passengerid%type)
IS
    -- variables--
    
    V_ID passenger.passengerid%type;
    v_fname passenger.first_name%type;
    v_lname passenger.last_name%type;
    v_address passenger.address%type;
    v_city passenger.city%type;
    v_state passenger.state%type;
    v_zip passenger.zipcode%type;
    v_phone passenger.phone%type;
    
  --cursor--
  cursor c1 is 
  select *from passenger where passengerid = P_ID;
BEGIN
 dbms_output.put_line('Details for Passenger ID number '|| p_ID || ': ');
  dbms_output.put_line(' ');
open c1;
loop
    fetch c1 into  V_ID,  v_fname, v_lname, v_address, v_city, v_state, v_zip, v_phone;
    exit when c1%NOTFOUND OR c1%NOTFOUND IS NULL;
    dbms_output.put_line(v_fname || ' '|| v_lname ||'  |  '||v_address ||' '||v_city || ', '||v_state ||' '|| v_zip ||
                         '   |  '|| v_phone);
end loop;
close c1;
end;
/


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


-- procedure #5 - adding new flights to flight table--

set serveroutput on
create or replace procedure Adminp5_Add_Flight
(
    p_flight_num  IN flight.flight_num%type,
    p_airlines IN flight.airlines%type,
    p_origin IN flight.origin%type,
    p_destination IN flight.destination%type,
    p_flight_date IN flight.flight_date%type,
    p_remaining_seat IN flight.remaining_seats%type,
    p_fare IN flight.fare%type
)
IS 

    
Begin    
    Insert into flight values(p_flight_num  , p_airlines, p_origin, p_destination, 
    p_flight_date, p_remaining_seat, p_fare);
    DBMS_OUTPUT.put_line('Your record has been inserted for flight number '||p_flight_num);
commit;
end;
/


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
