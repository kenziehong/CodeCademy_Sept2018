INTRODUCTION TO SQL
Create a Table


CREATE TABLE friends(
  id INTEGER,
  name TEXT,
  birthday DATE
);

INSERT INTO friends(id, name, birthday) 
VALUES(1, "Jane Doe", "1990-05-30");

INSERT INTO friends(id, name, birthday) 
VALUES(2, "BFF One", "1990-02-10");

INSERT INTO friends(id, name, birthday) 
VALUES(3, "BFF Two", "1990-12-12");

UPDATE friends SET name = "Smith" WHERE id =1;

ALTER TABLE friends ADD COLUMN email TEXT;

UPDATE friends SET email = "jane@codecademy.com" WHERE id = 1;

UPDATE friends SET email = "bffone@codecademy.com" WHERE id = 2;

UPDATE friends SET email = "bbftwo@codecademy.com" WHERE id = 3;

DELETE FROM friends WHERE id = 1;

SELECT * FROM friends;

---------------------------------------------------------
Code Challenge
Queries

#Find the number of girls who were named Lillian for the full span of time of the database.
#Select only the year and number columns.

SELECT year, number FROM babies WHERE name = 'Lillian';

#Find 20 distinct names that start with 'S'.
#Select only the name column.
SELECT DISTINCT name FROM babies WHERE name LIKE 'S%' LIMIT 20;

#What are the top 10 names in 1880?
#Select the name, gender, and number columns.

SELECT name, gender, number FROM babies 
WHERE year = 1880
ORDER BY number DESC
LIMIT 10;

#Return all the restaurants that are Italian and $$$.
#Select all the columns.
SELECT * FROM nomnom WHERE cuisine ='Italian' AND price = '$$$';

#Your coworker Trey can't remember the exact name of a restaurant he went to but he knows it contains the word 'meatball' in it.
#Select all the columns.
SELECT * FROM nomnom WHERE name LIKE '%meatball%'; 

#Some of the restaurants have not been inspected yet or are currently appealing their health grade score.
#Find the restaurants that have empty health values.
SELECT * FROM nomnom WHERE health IS NULL; 

 
#Order the table by title (from A-Z).
#Select only the title and publisher columns.
SELECT title, publisher FROM news ORDER BY title ASC;

#What are the 20 business articles published most recently?
SELECT * FROM news WHERE category ='b' 
ORDER BY timestamp DESC 
LIMIT 20;

---------------------------------------------------------------

/*1. Start by getting a feel for the nomnom table:*/
SELECT * FROM nomnom;

/*2.What are the distinct neighborhoods?*/
SELECT DISTINCT neighborhood FROM nomnom;

/*3.What are the distinct cuisine types?*/
SELECT DISTINCT cuisine FROM nomnom;

/*4.Suppose we would like some Chinese takeout.
What are our options?*/
SELECT * FROM nomnom WHERE cuisine ='Chinese';

/*5.Return all the restaurants with reviews of 4 and above.*/
SELECT * FROM nomnom WHERE review >= 4;


/**8.Find all the close by spots in Midtown, Downtown or Chinatown..*/
SELECT * FROM nomnom WHERE neighborhood = 'Midtown' OR neighborhood = 'Downtown' OR neighborhood = 'Chinatown';

/**11.Use a CASE statement to change the rating system to:.*/
SELECT review,
  CASE
   WHEN review>4.5 THEN 'Extraordinary'
   WHEN review>4 THEN 'Excellent'
   WHEN review>3 THEN 'Good'
   WHEN review>2 THEN 'Fair'
   ELSE 'Poor'
  END AS 'status'
FROM nomnom;

-------------------------------------
CODE CHALLENGE: AGGREGATE FUNCTIONS
Code Challenge   

/*
2.Use COUNT() and a LIKE operator to determine the number of users that have an email ending in '.com'.

SELECT COUNT(*) FROM users WHERE email LIKE '%.com';

3.Use COUNT(), GROUP BY, and ORDER BY to create a list of first names and occurrences within the users table.

Order the data so that the most popular names are displayed first.

SELECT first_name, COUNT(*) FROM users 
GROUP BY first_name
ORDER BY COUNT(*) DESC;

4.
SELECT
  ROUND(watch_duration_in_minutes,0) as duration,
  COUNT(*) as count
FROM watch_history
GROUP BY duration
ORDER BY duration ASC;

5.
SELECT
  user_id,
  SUM(amount) AS 'total'
FROM payments
WHERE status = 'paid'
GROUP BY 1
ORDER BY 2 DESC;

6.
SELECT 
 user_id,
 SUM(watch_duration_in_minutes) AS 'total'
FROM watch_history
GROUP BY user_id
HAVING total>400 ;

7.To the nearest minute, how many minutes of content were streamed on Codeflix?
SELECT ROUND(SUM(watch_duration_in_minutes)) 
FROM watch_history;

8.Which days in this period did Codeflix collect the most money?
SELECT pay_date, SUM(amount)
FROM payments
WHERE status = 'paid'
GROUP BY pay_date
ORDER BY 2 DESC;

9.When users successfully pay Codeflix (status = 'paid'), what is the average payment amount?
SELECT AVG(amount)
FROM payments
WHERE status ='paid';

10.
SELECT 
 MAX(watch_duration_in_minutes) as 'longest',
 MIN(watch_duration_in_minutes) as 'shortes'
FROM watch_history ;


*/
  
---------------------------------------------------------------------
AGGREGATE FUNCTIONS
Trends in Startups

SELECT * FROM startups LIMIT 10;

SELECT COUNT(*) FROM startups;

SELECT SUM(valuation) FROM startups;

SELECT MAX(raised) FROM startups WHERE stage ='Seed';

SELECT MIN(founded) FROM startups;

SELECT category, ROUND(AVG(valuation),2) FROM startups 
GROUP BY category ORDER BY 2 DESC;

SELECT category, COUNT(*) FROM startups 
GROUP BY category HAVING COUNT(*) > 3 ;

SELECT location, AVG(employees) FROM startups GROUP BY location HAVING AVG(employees) >500;


------------------------------------------------------
AGGREGATE FUNCTIONS PROJECTS AND APPLICATIONS
How to Hack Hacker News


SELECT * FROM hacker_news LIMIT 10;

SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

SELECT SUM(score) FROM hacker_news;

SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score)>200;

SELECT (309+ 304 + 282 + 517)/6366.0;

SELECT user, url, COUNT(*)
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' GROUP BY user ORDER BY COUNT(*) DESC;

SELECT 
 CASE 
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
 END AS 'Source',
 COUNT (*)
FROM hacker_news
GROUP BY Source; 

SELECT timestamp
FROM hacker_news
LIMIT 10;

SELECT 
   strftime('%H', timestamp) AS hour,
   ROUND(AVG(score),2) AS avg_score,
   COUNT(*) num_stories
FROM hacker_news
WHERE hour IS NOT NULL
GROUP BY 1
ORDER BY AVG(score) DESC;

------------------------------------------------

AGGREGATE FUNCTIONS PROJECTS AND APPLICATIONS
The Metropolitan Museum of Art

SELECT category, COUNT (*) FROM met WHERE category LIKE '%celery%';
 
SELECT title, medium, MIN(date) FROM met; 
 
SELECT country, COUNT(country) FROM met 
GROUP BY country 
ORDER BY 2 DESC LIMIT 10; 
 
SELECT country, COUNT(*) FROM met 
GROUP BY country 
ORDER BY 2 DESC LIMIT 10; 
 
SELECT medium, COUNT(*) FROM met
WHERE medium LIKE '%gold%' OR medium LIKE '%silver%' GROUP BY medium ORDER BY 2 DESC;
 
----------------------------------------------------

WORKING WITH MULTIPLE TABLES
Multiple Tables with REBU

/*SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM cars;

SELECT * 
FROM riders
CROSS JOIN cars;

SELECT *
FROM rider, cars;

SELECT *
FROM trips
LEFT JOIN riders
 ON trips.rider_id = riders.id;

SELECT * 
FROM trips
JOIN cars
 ON trips.car_id = cars.id; 

SELECT * 
FROM riders
UNION
SELECT *
FROM riders2;
*/

SELECT ROUND(AVG(cost),2)
FROM trips;

SELECT *
FROM riders
WHERE total_trips < 500;

SELECT COUNT(*)
FROM cars
WHERE status ='active';

SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
 
 
 
 
 
 
 
 
 
 
 
 
