# Airline Transportation Data Analysis Project

## Description
This project is a comprehensive data analysis of an airline transportation database using SQL. It covers various stages from data cleaning and consistency checks to advanced analysis like flight route efficiency, frequent flyer identification, and passenger income segmentation using ABC analysis. This project is part of the **Databases with SQL and Python** course on the [Hyperskill platform](https://hyperskill.org).

## Database Schema
Below is a visual representation of the database structure used in this project.
![Database Structure](database-schema.png)

## Database Explanation

## Project Structure
The project is organized into six stages:
1. **Stage 1**: Date adjustment and synchronization.
2. **Stage 2**: Identifying frequent flyers.
3. **Stage 3**: Analyzing flight routes, flight durations, passengers, and income.
4. **Stage 4**: Comparing Boeing and Airbus flight durations.
5. **Stage 5**: Finding the top two routes with the longest durations for each airline company.
6. **Stage 6**: Segmenting passengers using ABC testing based on their contribution to income.

## SQL Queries

### Overview
The following SQL files contain queries that analyze the database and provide insights based on various criteria:
- [stage_1_updating_passenger_trip_dates.sql](./stage_1_updating_passenger_trip_dates.sql)

### Example Queries
Below are a few key queries to illustrate the type of analysis performed:

#### Stage 1: Updating Passenger Trip Dates
```sql
ALTER TABLE Pass_in_trip
MODIFY trip_date DATE;

UPDATE Pass_in_trip
SET trip_date = CAST(trip_date AS DATE);

SELECT trip_date
FROM Pass_in_trip;
```
The query changes the data type of the trip_date column to DATE.
