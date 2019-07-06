# Airlines-Reservation-System
Concept of an airlines reservation system where the user and the admin can perform real world fucntions

* The project consists of 4 tables(Flight,Reservation, Passenger,Payment) with 9 PL/SQL procedures 2 sequences and 1 Trigger. 

* Trigger subtracts the NEW number of passengers registered(Reservation table) from the Remaining_Seats(flight table). 
* If the the passenger registers for more than the number of avaialable seats then it give an error(check constraint on Remaining_seats to remain > 0)
* Sequences to auto generate Reservation_ID and Passenger_ID for the Passenger
* Reservation table acts as a bridge table for Fight and Passenger
