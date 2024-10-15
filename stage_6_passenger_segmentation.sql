-- Stage 6: Performing ABC analysis to segment passengers based on their income contribution.

WITH PassengerIncome AS (
    -- Step 1: Calculate the income in dollars generated by each passenger
    SELECT P.ID_psg,
        P.passenger_name,
        SUM(TIMESTAMPDIFF(MINUTE, t.time_out, t.time_in)) * 0.01 AS passenger_income_dollars
    FROM
        Passenger P
    JOIN Pass_in_trip pit ON pit.ID_psg = P.ID_psg
    JOIN Trip t ON t.trip_no = pit.trip_no
    GROUP BY P.ID_psg, P.passenger_name
),
TotalIncome AS (
    -- Step 2: Calculate the total income across all passengers
    SELECT
        SUM(passenger_income_dollars) AS total_income
    FROM 
        PassengerIncome
),
RankedIncome AS (
    -- Step 3: Rank passengers by income and calculate cumulative share percentage
    SELECT PI.ID_psg,
        PI.passenger_name,
        PI.passenger_income_dollars,
        SUM(passenger_income_dollars) OVER(ORDER BY PI.passenger_income_dollars DESC) / (SELECT total_income FROM TotalIncome) * 100 AS cumulative_share_percent
    FROM 
        PassengerIncome PI
)

-- Step 4: Categorize passengers based on cumulative share percentage
SELECT RI.ID_psg,
    RI.passenger_name,
    ROUND(RI.passenger_income_dollars, 2) AS passenger_income_dollars,
    ROUND(RI.cumulative_share_percent, 2) AS cumulative_share_percent,
    CASE
      WHEN RI.cumulative_share_percent <= 80 THEN 'A'
      WHEN RI.cumulative_share_percent <= 95 THEN 'B'
      ELSE 'C'
    END AS category
FROM 
    RankedIncome RI
ORDER BY 
    RI.passenger_income_dollars DESC;
