-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
-- Answer: HNL is the furthest distance away
select distinct flight, origin, dest, distance as 'furthest distance' from flight.flights where distance in (select max(distance) from flight.flights) ;

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result. 
-- Answer: Pls run the query
select engines, max(seats) from flight.planes group by engines;

-- 3. Show the total number of flights.
-- Answer: 336776
select count(*) from flight.flights;

-- 4. Show the total number of flights by airline (carrier).
-- Answer: Pls run the query
select carrier, count(*) as 'total number of flights' from flight.flights group by carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.
-- Answer: Pls run the query
select carrier, count(*) as flightcount from flight.flights group by carrier order by flightcount desc;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
-- Answer: Pls run the query
select carrier, count(*) as flightcount from flight.flights group by carrier order by flightcount desc limit 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
-- Answer: Pls run the query
select carrier, count(*) as flightcount from flight.flights where distance >= 1000 group by carrier order by flightcount desc limit 5;

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.
-- Question: Create a query that show top 5 airlines, by number of flights in the month of august, ordered by flights number from heights.
select carrier, count(*) as FlightCount from flights where month = 8 group by carrier order by FlightCount desc limit 5;