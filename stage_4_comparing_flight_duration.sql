-- Stage 4: Comparing flight durations between Boeing and Airbus aircraft.

SELECT
    CASE
        WHEN T.plane_type LIKE 'Boeing%' THEN 'Boeing'
        WHEN T.plane_type LIKE 'Airbus%' THEN 'Airbus'
        ELSE 'Other'
    END AS aircraft_type,
    AVG(TIMESTAMPDIFF(MINUTE, T.time_out, T.time_in)) AS avg_flight_duration,
    COUNT(*) AS num_flights
FROM Trip T
GROUP BY aircraft_type