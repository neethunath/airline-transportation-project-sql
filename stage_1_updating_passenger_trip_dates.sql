-- Stage 1: Alter the passenger's trip table to adjust date data types and synchronize trip dates with departure times to ensure data consistency.

-- Changing the data type of trip_date column from DATETIME to DATE.
ALTER TABLE Pass_in_trip
MODIFY trip_date DATE;

-- Updating trip_date to adapt to the new datatype.
UPDATE Pass_in_trip
SET trip_date = CAST(trip_date AS DATE);

-- Verifying changes by selecting the updated trip_date column.
SELECT trip_date
FROM Pass_in_trip;
