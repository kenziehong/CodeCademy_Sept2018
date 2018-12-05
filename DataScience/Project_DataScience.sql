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
 
 
--------------------------------------------------

INTRODUCTION TO NUMPY
#Betty's Bakery Project

import numpy as np
cupcakes = np.array([2, 0.75, 2, 1, 0.5])
recipes = np.genfromtxt('recipes.csv', delimiter =',')
print(recipes)

eggs = recipes[:,2]
one_egg = recipes[eggs==1]
print(one_egg)

cookies = recipes[2,:]
double_batch = cupcakes*2

grocery_list = cookies + double_batch
print(grocery_list) 



-----------------------------------------------
STATISTICS IN NUMPY
CrunchieMunchies


import codecademylib
import numpy as np

calorie_stats = np.genfromtxt('cereal.csv', delimiter = ',')
average_calorites = np.mean(calorie_stats) #106

calorie_stats_sorted = np.sort(calorie_stats)
median_calories = np.median(calorie_stats) #110
#While the median demonstrates that at least half of our values are over 110 calories (median),
#it would be more impressive to show that a significant portion of the competition has a higher calorie count that CrunchieMunchies.

#find the lowest percentile that is greater than 60 calories
print np.percentile(calorie_stats,25)
print np.percentile(calorie_stats,10)
print np.percentile(calorie_stats,5)
print np.percentile(calorie_stats,4)
print np.percentile(calorie_stats,3)

#While the percentile shows us that the majority of the competition has a much higher calorie count
#let's calculate the percentage of cereals that have more than 60 calories per serving.
nth_percentile = 4
more_calories = 100-4

#Can we make the generalization that most cereals have around 106 calories (mean) or is the spread even greater?
calorie_std = np.std(calorie_stats) #19
 
 
--------------------------------------------------------
STATISTICS IN NUMPY
Election Results

import codecademylib
import numpy as np
from matplotlib import pyplot as plt

survey_responses = ['Ceballos', 'Kerrigan', 'Ceballos', 'Ceballos', 'Ceballos','Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Ceballos', 
'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Ceballos', 'Ceballos', 'Ceballos', 'Ceballos',
'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Ceballos',
'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Ceballos', 'Ceballos', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Kerrigan', 'Ceballos']

total_ceballos = sum([1 for item in survey_responses if item == 'Ceballos'])

survey_length = float(len(survey_responses))
percentage_ceballos = total_ceballos/ survey_length

possible_surveys = np.random.binomial(survey_length, 0.54, size = 10000) / survey_length
plt.hist(possible_surveys, range = (0,1), bins =20)
plt.show()

possible_surveys_length = float(len(possible_surveys))
incorrect_predictions = len(possible_surveys[possible_surveys<0.5])
ceballos_loss_surveys = incorrect_predictions / possible_surveys_length

large_survey_length = float(7000)
large_survey = np.random.binomial(large_survey_length, 0.54, size = 10000) / large_survey_length
plt.close()
plt.hist(large_survey, alpha = 0.5, range =(0,1), bins =20)
plt.show()

incorrect_predictions = len(large_survey[large_survey <0.5])
ceballos_loss_new = incorrect_predictions /  large_survey_length

print(total_ceballos) #33
print(percentage_ceballos) #0.471428571429
print(ceballos_loss_surveys) #0.213
print(ceballos_loss_new) #0
 
--------------------------------------------------------------------
4/12/2018

INTRODUCTION TO PANDAS
Petal Power Inventory

#You're the lead data analyst for a chain of gardening stores called Petal Power. Help them analyze their inventory!

import codecademylib
import pandas as pd

#1. Load the data into a DataFrame called inventory
inventory = pd.read_csv('inventory.csv')

#3.select these rows and save them to staten_island
staten_island = inventory.head(10)

#4. select the column product_description from staten_island and save it to the variable product_request
product_request = staten_island.product_description

#5. select all rows where location is equal to Brooklyn and product_type is equal to seeds and save them to the variable seed_request
seed_request = inventory[(inventory.location == 'Brooklyn') & (inventory.product_type == 'seeds')]

#6. add a column to inventory called in_stock which is True if quantity is greater than 0 and False if quantity equals 0
inventory['in_stock'] = inventory.apply(lambda row: True if row.quantity > 0 else False, axis = 1)

#7. create a column called total_value that is equal to price multiplied by quantity
inventory['total_value'] = inventory.apply(lambda row: row.quantity * row.price, axis =1 )

#8. 
combine_lambda = lambda row: \
                 '{} - {}'.format(row.product_type, row.product_description)

#9. using combine_lambda, create a new column in ventory called full_description of each product
inventory['full_description'] = inventory.apply(combine_lambda, axis =1)
  
print(inventory.head(10))
print(product_request)
print(seed_request)

---------------------------------------------------------------

AGGREGATES IN PANDAS
A/B Testing for ShoeFly.com

/*Our favorite online shoe store, ShoeFly.com is performing an A/B Test. 
They have two different versions of an ad, which they have placed in emails, 
as well as in banner ads on Facebook, Twitter, and Google. 
They want to know how the two ads are performing on each of the different platforms on each day of the week. 
Help them analyze the data using aggregate measures. 
 
*/ 
 
import codecademylib
import pandas as pd

ad_clicks = pd.read_csv('ad_clicks.csv')

#1. examine the first few rows of ad_clicks
print(ad_clicks.head())

#2. how many views came from each utm_source
print(ad_clicks.groupby('utm_source')\
         .user_id.count()\
         .reset_index()
     )

#3. create a new column called is_click, which is True if ad_click_timestamp is not null and False otherwise
#ad_clicks['is_click'] = ad_clicks.apply(lambda row: True if row.ad_click_timestamp.isnull() else False) --error AttributeError: ("'Series' object has no attribute 'ad_click_timestamp'", u'occurred at index user_id') ???
ad_clicks['is_click'] = ~ ad_clicks.ad_click_timestamp.isnull()
#The ~ is a NOT operator, and isnull() tests whether or not the value of ad_click_timestamp is null.

#4. the percent of people who clicked on ads from each utm_source
#start by grouping by utm_source and is_click and counting the number of user_id's in each of those groups. Save your answer to the variable
clicks_by_source = ad_clicks\
  .groupby(['utm_source', 'is_click'])\
  .user_id.count()\
  .reset_index()

#5. let's pivot the data so that the columns are is_click, the index is utm_source, and the values are are user_id 
clicks_pivot = clicks_by_source.pivot(
    columns = 'is_click',
    index = 'utm_source',
    values = 'user_id'
)

#6. create a new column in clicks_pivot called per_cent_clicked which is equal to the percent of users who clicked on the ad from each utm_source
clicks_pivot['percent_clicked'] = clicks_pivot[True] / \
(clicks_pivot[True] + clicks_pivot[False])
print(clicks_pivot)

#7. Were approximately the same number of people shown both adds
print(ad_clicks\
       .groupby('experimental_group')\
       .user_id.count()      
     )

#8. Check to see if a greater percentage of users clicked on Ad A or Ad B
print(ad_clicks\
        .groupby(['experimental_group', 'is_click'])\
        .user_id.count()\
        .reset_index() 
        .pivot(
            columns = 'is_click',
            index = 'experimental_group',
            values = 'user_id'
        )\
        .reset_index()
     )
#9. Maybe the clicks have changed by day of the week. Start by creating two DataFrames: a_clicks and b_clicks, which contain only the results for A group and B group, respectively
a_clicks = ad_clicks[ad_clicks.experimental_group == 'A']
b_clicks = ad_clicks [ad_clicks.experimental_group == 'B']

#10. For each group, calculate the percent of users who clicked on the ad by day
a_clicks_pivot = a_clicks\
      .groupby(['is_click', 'day'])\
      .user_id.count()\
      .reset_index()\
      .pivot(
          columns = 'is_click',
          index = 'day',
          values = 'user_id'
       )
a_clicks_pivot['percentage_clicked'] = a_clicks_pivot[True] / (a_clicks_pivot[True] + a_clicks_pivot[False])
print(a_clicks_pivot)


