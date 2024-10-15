-- Stage 5: Ranking the top two longest routes for each airline company.

WITH RouteDuration AS (
    SELECT ac.company_name,
        T.town_from AS departure_city,
        T.town_to AS arrival_city,
        AVG(TIMESTAMPDIFF(MINUTE, T.time_out, T.time_in)) AS avg_flight_duration,
        ROW_NUMBER() OVER(PARTITION BY company_name ORDER BY AVG(TIMESTAMPDIFF(MINUTE, T.time_out, T.time_in)) DESC) AS company_rank
    FROM Trip T
    JOIN Airline_company ac ON ac.ID_comp = T.ID_comp
    GROUP BY company_name, departure_city, arrival_city
) 
    
SELECT 
    company_name,
    departure_city,
    arrival_city,
    avg_flight_duration
FROM 
    RouteDuration
WHERE 
    company_rank <=2;