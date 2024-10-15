-- Stage 3: Route analysis to calculate key metrics like average flight duration, total passengers served, and revenue per flight route.

SELECT CONCAT(T.town_from, ' - ', T.town_to) AS route,
    AVG(TIMESTAMPDIFF(MINUTE, T.time_out, T.time_in)) AS avg_flight_duration,
    COUNT(P.passenger_name) AS total_passengers,
    SUM(TIMESTAMPDIFF(SECOND, T.time_out, T.time_in) * 0.01) AS total_income
FROM Pass_in_trip pit
JOIN Passenger P ON P.ID_psg = pit.ID_psg
JOIN Trip T ON T.trip_no = pit.trip_no
GROUP BY route
ORDER BY total_income DESC;
