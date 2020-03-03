# Airlines-Reservation- System(SQL - PL/SQL)
Concept of an airlines reservation system where the user and the admin can perform real world fucntions

* The project consists of 4 tables(Flight,Reservation, Passenger,Payment) with 9 PL/SQL procedures 2 sequences and 1 Trigger. 

* Trigger subtracts the NEW number of passengers registered(Reservation table) from the Remaining_Seats(flight table). 
* If the the passenger registers for more than the number of avaialable seats then it give an error(check constraint on Remaining_seats to remain > 0)
* Sequences to auto generate Reservation_ID and Passenger_ID for the Passenger
* Reservation table acts as a bridge table for Fight and Passenger
<br /><br />
#### Trigger Demo
1) ![image](https://user-images.githubusercontent.com/52587103/60775991-9ee94f00-a0f6-11e9-8559-b63b9c9042c9.png)

2) ![image](https://user-images.githubusercontent.com/52587103/60775992-a3ae0300-a0f6-11e9-958a-6743d5fd43d8.png)

   ![image](https://user-images.githubusercontent.com/52587103/60775994-a6a8f380-a0f6-11e9-8fd0-2794e94db96c.png)

3) ![image](https://user-images.githubusercontent.com/52587103/60775999-ac9ed480-a0f6-11e9-809e-c9814aa838a4.png)


<br /><br />
### Passenger Procedures -   (refer to '4_passenger_procedures.sql')
</br></br>

#### User Procedure #1  -  Registering a Passenger  
###### Gives user their Passenger_ID upon registration


1) ![image](https://user-images.githubusercontent.com/52587103/60776006-b1fc1f00-a0f6-11e9-8640-0a6f887e44d9.png)

2) ![image](https://user-images.githubusercontent.com/52587103/60776007-b45e7900-a0f6-11e9-98ce-f666f28a20c6.png)


<br /><br />

#### User Procedure #2  -  Searching for Flights 
##### (Origin, Destination, flight date) as parameters

![image](https://user-images.githubusercontent.com/52587103/75728698-a9281100-5cb6-11ea-9672-435c0f291861.png)


<br /><br />


#### User Procedure #3  - 
##### Reserving X amount of seats(flight Number, Passenger ID, number of seats being reserved)
* Passenger_ID was given to the user upon registration

![image](https://user-images.githubusercontent.com/52587103/75730688-95cb7480-5cbb-11ea-98c8-af8eeef02018.png)


<br /><br />


## Admin procedure #3 - (refer to '5_Admin_Procedures.sql')
##### Displays ALL reservations for a particular flight using FLIGHT_ID as the parameter


![image](https://user-images.githubusercontent.com/52587103/60776011-b7596980-a0f6-11e9-98d9-7c928a811ccc.png)




