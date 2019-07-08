--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


-- Procdure 1. Registering customers-- 

create or replace procedure P1_Register_passenger(p_fname IN passenger.first_name%type ,  p_lname IN passenger.last_name%type ,
p_address IN passenger.address%type , p_city IN passenger.city%type , 
p_state IN passenger.state%type ,p_zip IN passenger.zipcode%type, p_phone IN passenger.phone%type)

IS
BEGIN 
    insert into passenger values(PASSENGERID_SEQ.nextval, p_Fname, p_Lname, p_address, p_city, p_state ,p_zip, p_phone);
    dbms_output.put_line('You are registered ' || p_Fname || '! ' || 'Your ID number is: ' || passengerID_seq.currval);
commit;
END;


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- Procdure 2. Searching flights based on the origin airport, destination airport and the time-- 


Set serveroutput on
create or replace procedure P2_Search_flights
(P_origin IN flight.origin%TYPE,
P_dest IN flight.destination%TYPE,
P_date IN flight.flight_date%TYPE)
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
    where origin = P_origin
    and destination = P_dest
    and  flight_date = p_date;
BEGIN 

Open c1;
DBMS_OUTPUT.put_line('Here are the flights from ' || P_origin || ' to ' || P_dest || ' on ' || P_date|| ': ');
DBMS_OUTPUT.put_line(' ');
LOOP
    --looping the cursor into the variables and printing the outcome-- 
    FETCH c1 INTO v_flightnum, v_airlines, v_origin, v_destination,  v_flight_date,v_seats,  v_fare;
    exit when c1%NOTFOUND ;
    dbms_output.put_line( 'Flight Number: ' || v_flightnum ||' |  Airlines: ' ||v_airlines || '| '|| v_origin || ' to ' || v_destination || ' | ' || v_flight_date || ' |  Seats Remaining: '|| v_seats || ' | Price: '|| v_fare);
END LOOP;    
close c1;

END;
/


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


--Procedure #3 - reserving flight based on flight number, passeneger ID, and number of passengers--


create or replace procedure p3_reserve_flight(
p_flight_num IN reservation.flight_num%type,
P_passengerID IN reservation.passengerid%type,
P_num_pass IN reservation.num_of_passengers%type)
IS 
BEGIN 
   INSERT INTO reservation VALUES (reservationnum_seq.NEXTVAL, P_flight_num ,P_passengerID, CURRENT_DATE, P_num_pass);
    dbms_output.put_line('Your reservation has been confirmed for ' || p_num_pass || ' passengers');
    dbms_output.put_line('Your Reserveration Number is ' || RESERVATIONNUM_SEQ.currval );
commit;
END;
/



--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


--Procedure #4 - searching all the reservations based on passengerID'


create or replace procedure p4_search_reservation(
p_ID IN reservation.reservation_num%type)
IS
    --variables--
    v_res_num reservation.reservation_num%type;
    v_flight_num reservation.flight_num%type;
    v_passengerID reservation.flight_num%type;
    v_res_date reservation.reservation_date%type;
    v_num__of_pass reservation.num_of_passengers%type;

    --cursor--
    cursor c1 is 
    select *from reservation
    where passengerID = p_ID;
BEGIN
open c1;
    DBMS_OUTPUT.PUT_LINE('All of Your Reservations: ');
      DBMS_OUTPUT.PUT_LINE(' ');
LOOP
    fetch c1 into v_res_num, v_flight_num, v_passengerID, v_res_date, v_num__of_pass;
    exit when c1%NOTFOUND OR c1%NOTFOUND IS NULL;
    DBMS_OUTPUT.PUT_LINE('Reservation Number: ' ||v_res_num || ' | Flight Number: ' ||v_flight_num 
    || ' | Your Passenger ID: ' ||v_passengerID || ' | Date of Reservation: ' ||v_res_date || ' | Number of passengers: ' ||v_num__of_pass);
end loop;
close c1;
end;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
