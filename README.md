# Airlines-Reservation-System(SQL - PL/SQL)
Concept of an airlines reservation system where the user and the admin can perform real world fucntions

* The project consists of 4 tables(Flight,Reservation, Passenger,Payment) with 9 PL/SQL procedures 2 sequences and 1 Trigger. 

* Trigger subtracts the NEW number of passengers registered(Reservation table) from the Remaining_Seats(flight table). 
* If the the passenger registers for more than the number of avaialable seats then it give an error(check constraint on Remaining_seats to remain > 0)
* Sequences to auto generate Reservation_ID and Passenger_ID for the Passenger
* Reservation table acts as a bridge table for Fight and Passenger

### Trigger Demo
![image](https://user-images.githubusercontent.com/52587103/60775991-9ee94f00-a0f6-11e9-8559-b63b9c9042c9.png)

![image](https://user-images.githubusercontent.com/52587103/60775992-a3ae0300-a0f6-11e9-958a-6743d5fd43d8.png)

![image](https://user-images.githubusercontent.com/52587103/60775994-a6a8f380-a0f6-11e9-8fd0-2794e94db96c.png)

### User Procedure #1 – Registering a Passenger

![image](https://user-images.githubusercontent.com/52587103/60775999-ac9ed480-a0f6-11e9-809e-c9814aa838a4.png)

![image](https://user-images.githubusercontent.com/52587103/60776001-af99c500-a0f6-11e9-8150-4107c8afabf6.png)

![image](https://user-images.githubusercontent.com/52587103/60776006-b1fc1f00-a0f6-11e9-8640-0a6f887e44d9.png)

### Admin procedure #3 – Searching for the reservations for a particular flight using FLIGHT_ID (refer to "5 Admin Procedures" file for the code)

![image](https://user-images.githubusercontent.com/52587103/60776007-b45e7900-a0f6-11e9-98ce-f666f28a20c6.png)

![image](https://user-images.githubusercontent.com/52587103/60776011-b7596980-a0f6-11e9-98d9-7c928a811ccc.png)
