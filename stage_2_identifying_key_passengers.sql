-- Stage 2: Identify passengers who have flown multiple times with specific airlines.
-- Output the passenger_name, num_flights, and company_name.

SELECT 
    p.passenger_name, 
    COUNT(t.trip_no) AS num_flights, 
    ac.company_name
FROM 
    Passenger p
JOIN Pass_in_trip pit ON p.ID_psg = pit.ID_psg
JOIN Trip t ON pit.trip_no = t.trip_no
JOIN Airline_company ac ON t.ID_comp = ac.ID_comp
GROUP BY p.passenger_name, ac.company_name
HAVING num_flights > 1;
