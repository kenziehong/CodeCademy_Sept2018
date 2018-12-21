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


---------------------------------------------------------------------

RECREATE GRAPHS USING MATPLOTLIB!
Bar Chart with Error

#First, we are going to look at the chart called bar_chart.png.

import codecademylib
from matplotlib import pyplot as plt

past_years_averages = [82, 84, 83, 86, 74, 84, 90]
years = [2000, 2001, 2002, 2003, 2004, 2005, 2006]
error = [1.5, 2.1, 1.2, 3.2, 2.3, 1.7, 2.4]

# Make your chart here

#1. First, create a figure of width 10 and height 8
plt.figure(figsize=(10,8))

#2. Plot the blue bars, which have the heights listed in past_years_averages
#3.Add error bars of cap size 5 and heights corresponding to the list error
plt.bar(years, past_years_averages, color = 'blue', yerr = error, capsize = 5)

#4. Set the axis to go from -0.5 to 6.5 on the x-axis and 70 to 95 on the y-axis
plt.axis([-0.5, 6.5, 70, 95])

#5. Create an ax object using plt.subplot(). Use ax to set the x-axis ticks to be range(len(year)) and the x-axis labels to be years list
ax = plt.subplot()
ax.set_xticks(range(len(years)))
ax.set_xticklabels(years)

#6. Add the title, x-axis label and y-axis label
plt.title("Final Exam Averages")
plt.xlabel("Year")
plt.ylabel("Test average")

#7. Save your figure to a file called my_bar_chart.png
plt.savefig("my_bar_chart.png")
plt.show()

----------------------------------------------------------------

RECREATE GRAPHS USING MATPLOTLIB!
Side By Side Bars

/*Now, we are going to look at the chart called side-by-side.png. This displays the differences in average test scores 
between students who went to two different middle schools before enrolling in your high school.
*/
import codecademylib
from matplotlib import pyplot as plt

unit_topics = ['Limits', 'Derivatives', 'Integrals', 'Diff Eq', 'Applications']
middle_school_a = [80, 85, 84, 83, 86]
middle_school_b = [73, 78, 77, 82, 86]

def create_x(t, w, n, d):
    return [t*x + w*n for x in range(d)]
  
#1. Using create_x, make the lists school_a_x and school_b_x which will determine where to put the bars for Middle School A and Middle School B along the x-axis

#For school_a_x, use the following inputs to create_x:
#t = 2 # There are two sets of data: A and B
#w = 0.8 # We generally want bars to be 0.8
#n = 1 # A is first set of data
#d = 5 # There are 5 topics we're plotting
school_a_x = create_x(2, 0.8, 1, 5)
school_b_x = create_x(2, 0.8, 2, 5)

#2.Create a figure of width 10 and height 8.
plt.figure(figsize=(10,8))

#3. Create a set of axes and save them to ax.
ax = plt.subplot()  

#4.Plot a set of bars representing middle_school_a and a set representing middle_school_b next to each other on the same graph.
plt.bar(school_a_x, middle_school_a)
plt.bar(school_b_x,middle_school_b)

#5.Create a new list of x-values called middle_x, which are the values in the middle of school_a_x and school_b_x. This is where we will place the x-ticks. Look at the final graph to see this placement.
middle_x = [ (a + b) / 2.0 for a, b in zip(school_a_x, school_b_x)]

#6.Set the x-ticks to be the middle_x list.
ax.set_xticks(middle_x)

#7.Set the x-tick labels to be the list unit_topics.
ax.set_xticklabels(unit_topics)

#8.Create a legend, as shown in the final graph, that labels the first set of bars Middle School A and the second set of bars Middle School B
plt.legend(["Middle School A", "Middle School B"])

#9.Create a title ("Test Averages on Different Units"), x-axis label ("Unit"), and y-axis label ("Test Average").
plt.title('Test Averages on Different Units')
plt.ylabel('test average')
plt.xlabel('unit')
plt.show()

#10.Save your figure to a file called my_side_by_side.png.
plt.savefig('my_side_by_side.png')

++++++++++++++++++++++++++++++++++++++++++++++++++

RECREATE GRAPHS USING MATPLOTLIB!
Stacked Bars

/*Now, we are going to look at the chart called stacked-bars.png. 
This graph displays the breakdown of students who got As, Bs, Cs, Ds, and Fs in each unit.
*/
import codecademylib
from matplotlib import pyplot as plt
import numpy as np

unit_topics = ['Limits', 'Derivatives', 'Integrals', 'Diff Eq', 'Applications']
As = [6, 3, 4, 3, 5]
Bs = [8, 12, 8, 9, 10]
Cs = [13, 12, 15, 13, 14]
Ds = [2, 3, 3, 2, 1]
Fs = [1, 0, 0, 3, 0]

x = range(5)

#create d_bottom and f_bottom here
#1. The Bs bars will go on top of the As bars, but at what heights will the Cs, Ds, and Fs bars start? 
#The bottom of the bars representing the Cs will be at the height of the As plus the Bs. We can do this in NumPy (a scientific computing package for Python) with the np.add function. c_bottom, the starting heights for the Cs
#Underneath the definition of c_bottom, define d_bottom (where the Cs end), and f_bottom (where the Ds end).
c_bottom = np.add(As, Bs)
d_bottom = np.add(c_bottom, Cs)
f_bottom = np.add(d_bottom, Ds)

#create your plot here
#2.Create a figure of width 10 and height 8
plt.figure(figsize=(10,8))

#3.Plot the As, Bs, Cs, Ds, and Fs. Give each one the appropriate bottom list that will stack them on top of each other
plt.bar(x, As)
plt.bar(x, Bs, bottom=As)
plt.bar(x, Cs, bottom=c_bottom)
plt.bar(x, Ds, bottom=d_bottom)
plt.bar(x, Fs, bottom=f_bottom)

#4.Create a set of axes and save them to ax
ax = plt.subplot()

#5.Set the x-ticks to be range(len(unit_topics))
ax.set_xticks(range(len(unit_topics)))

#6.Set the x-tick labels to be the unit_topics
ax.set_xticklabels(unit_topics)

#7.Give the plot the title you see in the final graph, and the same x-axis label and y-axis label.
plt.title('Grade distribution')
plt.xlabel('Unit')
plt.ylabel('Number of Students')
plt.show()

#8.Save your figure to a file called my_stacked_bar.png.
plt.savefig('my_stacked_bar.png')

++++++++++++++++++++++++++++++++++++++++

RECREATE GRAPHS USING MATPLOTLIB!
Two Histograms on a Plot

/*Now, we are going to look at the chart called histograms.png. 
This displays the breakdown of final exam scores between your first year of teaching vs your second year of teaching.
*/
import codecademylib
from matplotlib import pyplot as plt

exam_scores1 = [62.58, 67.63, 81.37, 52.53, 62.98, 72.15, 59.05, 73.85, 97.24, 76.81, 89.34, 74.44, 68.52, 85.13, 90.75, 70.29, 75.62, 85.38, 77.82, 98.31, 79.08, 61.72, 71.33, 80.77, 80.31, 78.16, 61.15, 64.99, 72.67, 78.94]
exam_scores2 = [72.38, 71.28, 79.24, 83.86, 84.42, 79.38, 75.51, 76.63, 81.48,78.81,79.23,74.38,79.27,81.07,75.42,90.35,82.93,86.74,81.33,95.1,86.57,83.66,85.58,81.87,92.14,72.15,91.64,74.21,89.04,76.54,81.9,96.5,80.05,74.77,72.26,73.23,92.6,66.22,70.09,77.2]

# Make your plot here
#1.Create a figure of width 10 and height 8
plt.figure(figsize=(10, 8))

#2.Make a histogram of the exam_scores1, normalized, with 12 bins.
plt.hist(exam_scores1, bins=12, normed=True, histtype='step', linewidth=2)

#3.Make a histogram of the exam_scores2, normalized, with 12 bins.
plt.hist(exam_scores2, bins=12, normed=True, histtype='step', linewidth=2)

#4.Add histtype = 'step' to each plt.hist call, in order to make these histograms more visible.
#We can also make the lines thicker by setting the linewidth inside the calls to plt.hist.
#Let's set the linewidth to be 2 for both histograms.

#5.Create a legend showing that the first set of data is "1st Yr Teaching" and the second set of data is "2nd Yr Teaching"
plt.legend(["1st Yr Teaching", "2nd Yr Teaching"])

#6.Add the title, x-axis label, and y-axis label that you see on the final graph.Add the title, x-axis label, and y-axis label that you see on the final graph.
plt.title("Final Exam Score Distribution")
plt.xlabel("Percentage")
plt.ylabel("Frequency")

plt.show()

#7.Save your figure to a file called my_histogram.png.
plt.savefig('my_histogram.png')

+++++++++++++++++++++++++++++++++++

RECREATE GRAPHS USING MATPLOTLIB!
Labeled Pie Chart

/*Now, we are going to look at the chart called pie.png. 
This displays what students think the hardest topic covered throughout your math course is.
*/
import codecademylib
from matplotlib import pyplot as plt

unit_topics = ['Limits', 'Derivatives', 'Integrals', 'Diff Eq', 'Applications']
num_hardest_reported = [1, 3, 10, 15, 1]

#Make your plot here
#1.Create a figure of width 10 and height 8.
plt.figure(figsize=(10,8))

#2.Plot the num_hardest_reported list as a pie chart.
#4.Label the slices with the unit_topics list and put a percentage label on each slice, rounded to the nearest int.
plt.pie(num_hardest_reported, labels=unit_topics, autopct="%1d%%")

#3.Set the axes to be 'equal'
plt.axis('equal')

#5.Add the title "Hardest Topics"
plt.title('Hardest Topics')

plt.show()

#6.Save your figure to a file called my_pie_chart.png.
plt.savefig("my_pie_chart.png")

++++++++++++++++++++++++++++++++++++++++

RECREATE GRAPHS USING MATPLOTLIB!
Line with Shaded Error

/*Now, we are going to look at the chart called line_graph.png. 
This displays the relationship between the time students say they studied and 
the scores they received on their final exams.
*/

import codecademylib
from matplotlib import pyplot as plt

hours_reported =[3, 2.5, 2.75, 2.5, 2.75, 3.0, 3.5, 3.25, 3.25,  3.5, 3.5, 3.75, 3.75,4, 4.0, 3.75,  4.0, 4.25, 4.25, 4.5, 4.5, 5.0, 5.25, 5, 5.25, 5.5, 5.5, 5.75, 5.25, 4.75]
exam_scores = [52.53, 59.05, 61.15, 61.72, 62.58, 62.98, 64.99, 67.63, 68.52, 70.29, 71.33, 72.15, 72.67, 73.85, 74.44, 75.62, 76.81, 77.82, 78.16, 78.94, 79.08, 80.31, 80.77, 81.37, 85.13, 85.38, 89.34, 90.75, 97.24, 98.31]

#1.Create a figure of width 10 and height 8.
plt.figure(figsize=(10,8))

# Create your hours_lower_bound and hours_upper_bound lists here 
#3.Let's assume the error on students' reporting of their hours studying is 20%.
#Create a list hours_lower_bound, which has the elements of hours_reported minus 20%, and a list hours_upper_bound, which has the elements of hours_reported plus 20%.
hours_lower_bound = [element - (element * 0.2) for element in hours_reported]
hours_upper_bound = [element + (element * 0.2) for element in hours_reported]

# Make your graph here
#2.Plot the exam_scores on the x-axis and the hours_reported on the y-axis, with a linewidth of 2.
plt.plot(exam_scores, hours_reported, linewidth=2)

#4.Shade the area between hours_lower_bound and hours_upper_bound with an alpha of 0.2
plt.fill_between(exam_scores, hours_lower_bound, hours_upper_bound, alpha = 0.2)

#5.Give the plot the title 'Time spent studying vs final exam scores', x-axis label 'Score', and y-axis label 'Hours studying (self-reported)'.
plt.xlabel("Score")
plt.title("Time spent studying vs final exam scores")
plt.ylabel('Hours studying (self-reported)')
plt.show()

#6.Save your figure to a file called my_line_graph.png.
plt.savefig("my_line_graph.png")

------------------------------------------------------------------------

PROJECT: BOARD SLIDES FOR FOODWHEEL
FoodWheel: Let the Food Choose For You

"""
FoodWheel is a startup delivery service that takes away the struggle of deciding where to eat! FoodWheel picks you an amazing local restaurant and lets you order through the app. Senior leadership is getting ready for a big board meeting, and as the resident Data Analyst, you have been enlisted to help decipher data and create a presentation to answer several key questions:

What cuisines does FoodWheel offer? Which areas should the company search for more restaurants to partner with?
How has the average order amount changed over time? What does this say about the trajectory of the company?
How much has each customer on FoodWheel spent over the past six months? What can this tell us about the average FoodWheel customer?

Over this project, you will analyze several DataFrames and create several visualizations to help answer these questions.

Time to get started.
"""

from matplotlib import pyplot as plt
import pandas as pd

#2. Start by loading ...into a DataFrame called...
restaurants = pd.read_csv('restaurants.csv')

#3. Inspect...using head()
print(restaurants.head())

#4. How many different types of cuisine does FoodWheel offer? Save this number to the variable...
cuisine_options_count = restaurants.cuisine.nunique()

#5. Let's count the number of restaurants of each cuisine. Use groupby and count. Save your results to ...
cuisine_counts = restaurants.groupby('cuisine').id.count().reset_index()

print(cuisine_counts)

++++++++++++++++++++++++++++++++++++++
PROJECT: BOARD SLIDES FOR FOODWHEEL
What cuisines does FoodWheel offer?


import codecademylib
from matplotlib import pyplot as plt
import pandas as pd

restaurants = pd.read_csv('restaurants.csv')

cuisine_counts = restaurants.groupby('cuisine')\
                            .name.count()\
                            .reset_index()


#1. Start by creating two variables:
# ...contains the values of the column cuisine from cuisine_counts
#...contains the number of restaurants of each cuisine from cuisine_counts
cuisines = cuisine_counts.cuisine.values
counts = cuisine_counts.name.values

#2. Let's use this the values from counts to create a pie chart. Make sure that your pie chart includes:
#Labels for each cuisine
#Percent labels using autopct
#A title
#Using plt.axis to make the pie chart a perfect circle
plt.pie(counts, labels = cuisines, autopct = "%d%%")
plt.axis("equal")
plt.show()

++++++++++++++++++++++++++++++++++++++++++

PROJECT: BOARD SLIDES FOR FOODWHEEL
Orders Over Time

/*FoodWheel is a relatively new startup. They launched in April, and have grown more popular since then. Management suspects that the average order size has increased over time. They'd like you to investigate if this claim is true and answer this questions:

How has the average order amount changed over time? What does this say about the trajectory of the company?
*/
import codecademylib
from matplotlib import pyplot as plt
import pandas as pd

#1. Start by loading the data from ...into the DataFrame...
orders = pd.read_csv("orders.csv")

#2. Examine the first few rows 
print(orders.head())

#3. Create a new column in orders called month that contains the month that the order was placed
orders['month'] = orders.date.apply(lambda x: x.split('-')[0])

print orders.head()

#4. Group orders by month and get the average order price in each month. Save your answer to ...
avg_order = orders.groupby('month').price.mean().reset_index()

#5. We've eventually going to make a bar chart with this information. It would be nice if our bar chart had error bars. 
#Calculate the standard deviation for the average price of orders for each month using std. Save this to std_order
std_order = orders.groupby('month').price.std().reset_index()

+++++++++++++++++++++++++++++++++++++++++++++++
PROJECT: BOARD SLIDES FOR FOODWHEEL
Orders Over Time

-- You've now created two new DataFrames from the orders DataFrame, avg_order, 
-- which gives the average amount spent on an order for each month and std_order, which gives the standard deviation for each month. 

-- Now it's time to create a bar chart that uses both of these DataFrames.

import codecademylib
from matplotlib import pyplot as plt
import pandas as pd

orders = pd.read_csv('orders.csv')

orders['month'] = orders.date.apply(lambda x: x.split('-')[0])

avg_order = orders.groupby('month').price.mean().reset_index()

std_order = orders.groupby('month').price.std().reset_index()

#1.Start by creating a set of axes using plt.subplot and saving them to the variable ax
ax = plt.subplot()

#2. Create a variable with the average prices in it by selecting the column price from avg_order. Save this to bar_heights
#bar_heights = avg_order.price.values
#bar_errors = std_order.price.values

bar_heights = avg_order.price
bar_errors = std_order.price

#4. Create a bar chart to share this data
# Create an axes object called ax using plt.subplot
#The height of each bar should come from bar_heights
#Use the standard deviation in bar_errors as the yerr
#The error capsize should be 5
#Make sure that you label each bar with the name of the month
#Also be sure to label the y-axis
#Give your plot a descriptive title
plt.bar(range(len(bar_heights)),
  			bar_heights,
        yerr=bar_errors,
       capsize=5)
ax.set_xticks(range(len(bar_heights)))
ax.set_xticklabels(['April', 'May', 'June', 'July', 'August', 'September'])
plt.ylabel('Average Order Amount')
plt.title('Order Amount over Time')
plt.show()

++++++++++++++++++++++++++++++++++++++++++

PROJECT: BOARD SLIDES FOR FOODWHEEL
Customer Types

/*-- There is a range of amounts that customers spend on FoodWheel. Let's investigate and aim to answer our final question:

-- How much has each customer on FoodWheel spent over the past six months? 
-- What can this tell us about the average FoodWheel customer?

-- A great way to answer this question is to create 
a histogram of the amount spent by each customer over the past six months.*/

import codecademylib
from matplotlib import pyplot as plt
import pandas as pd

orders = pd.read_csv('orders.csv')
print(orders.head())
#1. Start by grouping orders by cuustomer_id and calculating the sum of price spent by each customer. Save your results to ...
customer_amount = orders.groupby('customer_id').price.sum().reset_index()

#2.Inspect customer_amount using print and .head().
print customer_amount.head()

#3.Create a histogram of this data.
#The range should be from 0 to 200
#The number of bins should be 40
#Label the x-axis Total Spent
#Label the y-axis Number of Customers
#Add a title
plt.hist(customer_amount.price.values,
        range=(0, 200), bins=40)
plt.xlabel('Total Spent')
plt.ylabel("Number of Customers")
plt.title('Customer Expenditure Over 6 Months')

plt.show()

--------------------------------------------------------------------
12/12/2108

"""
Honey Production
Now that you have learned how linear regression works, let's try it on an example of real-world data.

As you may have already heard, the honeybees are in a precarious state right now. 
You may have seen articles about the decline of the honeybee population for various reasons. 
You want to investigate this decline and how the trends of the past predict the future for the honeybees.

Note: All the tasks can be completed using Pandas or NumPy. Pick whichever one you prefer.

"""

import codecademylib3_seaborn
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from sklearn import linear_model

df = pd.read_csv("https://s3.amazonaws.com/codecademy-content/programs/data-science-path/linear_regression/honeyproduction.csv")

#1.Use .head() to get a sense of how this DataFrame is structured.
print(df.head())

#2Use the .groupby() method provided by pandas to get the mean of totalprod per year.Store this in a variable called prod_per_year.
prod_per_year = df.groupby("year").totalprod.mean().reset_index()
print(prod_per_year)

#3.Create a variable called X that is the column of years in this prod_per_year DataFrame.
X = prod_per_year.year

#After creating X, we will need to reshape it to get it into the right format, using this command:
X = X.values.reshape(-1,1)
print(X)

#4.Create a variable called y that is the totalprod column in the prod_per_year dataset
y = prod_per_year.totalprod

#5.Using plt.scatter(), plot y vs X as a scatterplot. Display the plot using plt.show().
#Can you see a vaguely linear relationship between these variables?

plt.scatter(X,y)
plt.show()

#Create and Fit a Linear Regression Model

#6.Create a linear regression model from scikit-learn and call it regr. 
#Use the LinearRegression() constructor from the linear_model module to do this.
regr = linear_model.LinearRegression()

#7.Fit the model to the data by using .fit(). You can feed X into your regr model by passing it in as a parameter of .fit().
regr.fit(X,y)

#8.After you have fit the model, print out the slope of the line (stored in a list called regr.coef_) and the intercept of the line (regr.intercept_).
print(regr.coef_[0])
print(regr.intercept_)

#9. Create a list called y_predict that is the predictions your regr model would make on the X data
#You can use the .predict() method, using X as a parameter, to get the predictions from the regr object.
y_predict = regr.predict(X)

#10. Plot y_predict vs X as a line, on top of your scatterplot using plt.plot()
plt.plot(X,y_predict)
plt.show()

#11. Let's predict what the year 2050 may look like in terms of honey production
#Create a NumPy array called X_future that is the range from 2013 to 2050
X_future = np.array(range(2013, 2051))

#Reshape it for scikit-learn
#You can think of reshape() as rotating this array. Rather than one big row of numbers, X_future is now a big column of numbers  there's one number in each row.
X_future = X_future.reshape(-1,1)

#12.Create a list called future_predict that is the y-values that your regr model would predict for the values of X_future
future_predict = regr.predict(X_future)

#13.
plt.plot(X_future, future_predict)
plt.show()


--------------------------------------------------------------

------------------------------------------------------------

CLASSIFICATION: K-NEAREST NEIGHBORS
Breast Cancer Classifier

# In this project, we will be using several Python libraries to make a K-Nearest Neighbor classifier 
# that is trained to predict whether a patient has breast cancer.

import codecademylib3_seaborn
#1.Let's begin by importing the breast cancer data from sklearn. We want to import the function load_breast_cancer from sklearn.datasets.
#Once we've imported the dataset, let's load the data into a variable called breast_cancer_data. Do this by setting breast_cancer_data equal to the function load_breast_cancer().
from sklearn.datasets import load_breast_cancer
breast_cancer_data = load_breast_cancer()

#2.Before jumping into creating our classifier, let's take a look at the data. Begin by printing breast_cancer_data.data[0]. That's the first datapoint in our set. But what do all of those numbers represent? Let's also print breast_cancer_data.feature_names.
#print(breast_cancer_data.data[0])
#print(breast_cancer_data.feature_names)

#3.We know have a sense of what the data looks like, but what are we trying to classify? Let's print both breast_cancer_data.target and breast_cancer_data.target_names.
#Was the very first data point tagged as malignant or benign?
#print(breast_cancer_data.target)
#print(breast_cancer_data.target_names)

#Splitting the data into Training and Validation Sets

#4. We have our data, but now it needs to be split into training and valiation sets. Luckily, sklearn has a function that does that for us. Begin by importing the train_test_split function from sklearn.model_selection
from sklearn.model_selection import train_test_split

#5.Call the train_test_split function. It takes several parameters: 
#The data you want to split (for us breast_cancer_data.data)
#The labels associated with that data (for us, breast_cancer_data.target)
#The test_size. This is what percentage of your data you want to be in your testing set. Let's use test_size = 0.2
#random_state. This will ensure that every time you run your code, the data is split in the same way. This can be any number. We used random_state = 100

#6. Right now we're not storing the return value of train_test_split. It returns four values in the following order: The training set, The validation set, The training labels, The validation labels
#Store those values in variables named training_data, validation_data, training_labels, and validation_labels
training_data, validation_data, training_labels,  validation_labels = train_test_split(
  breast_cancer_data.data,
  breast_cancer_data.target,
  test_size = 0.2,
  random_state = 80
)

#7. Let's confirm that worked correctly. Print out the length of training_data and training_labels. They should be the same size - one label for every piece of data
#print(len(training_data))
#print(len(training_labels))

#----------Running the classifier-----------
#8. Now that we've created training and validation sets, we can create a KNeighborsClassifier and tests its accuracy. Begin by importing KNeighborsClassifier from sklearn.neighbors
from sklearn.neighbors import KNeighborsClassifier

#9. Create a KNeighborsClassifier where n_neighbors = 3. Name the classifier classifier
#classifier = KNeighborsClassifier(n_neighbors =3)

#10. Train your classifier using the fit function. This function takes two parameters: the training set and the training labels
#classifier.fit(training_data, training_labels)

#11. Now that the classifier has been trained, let's find how accurate it is on the validation set. Call the classifier's score function. score takes two parameters: the validation set and the validation labels. Print the result!
#print(classifier.score(validation_data, validation_labels))

#12. The classifier does pretty well when k=3. But maybe there's a better k! Put the previous 3 lines of code inside a for loop. The loop should have a variable named k that starts at 1 and increases to 100. Rather than n_neighbors always being 3, it should be this new variable k. 
#You should now see 100 different validation accuracies print out. Which k seems the best?

#15
accuracies = []
for k in range(1,101):
  classifier = KNeighborsClassifier(n_neighbors =k)
  classifier.fit(training_data, training_labels)
  accuracies.append(classifier.score(validation_data, validation_labels))
  
#---------------Graphing the results--------------
#13. We now have the validation accuracy for 100 different ks. Rather than just printing it out. Begin by importing mathplot.pyplot as plt
import matplotlib.pyplot as plt

#14. The x-axis should be the values of k that we tested. This shoul be a list of numbers between 1 and 100. You can use range function to make this list. Store it in a variable named k_list
k_list = range(1, 101)

#15. The y-axis of our graph should be the validation accuracies, we want to add them to a list. Outside of the for loop, create an empty list named accuracies. Inside the for loop, instead of printing each accuracy, append it to accuracies

#16. We can now plot our data! Call plt.plot(). The first parameter should be k_list and the second parameter should be accuracies. 
#After plotting the graph, show it using plt.show()
plt.plot(k_list, accuracies)

#17.
plt.title("Breast Cancer Classifier Accuracy")
plt.xlabel("k")
plt.ylabel("Validation Accuracy")
plt.show()

#17. Let's add some labels and a title. Set the x-axis label to "k" using plt.xlabel(). Set the y-axis label to "Validation Accuracy". Set the title to "Breast Cancer Classifier Accuracy"

#18.Great work! If you want to play around with this more, try changing the random_state parameter when making the training set and validation set. This will change which points are in the training set and which are in the validation set.
#Ideally, the graph will look the same no matter how you split up the training set and test set. This data set is fairly small, so there is slightly more variance than usual.

-------------------------------------------------------------
CLASSIFICATION: NAIVE BAYES
Email Similarity

/*In this project, you will use scikit-learn's Naive Bayes implementation on several different datasets. 
By reporting the accuracy of the classifier, we can find which datasets are harder to distinguish.
 For example, how difficult do you think it is to distinguish the difference between emails about hockey 
 and emails about soccer? How hard is it to tell the difference between emails about hockey and emails about tech?
  In this project, we’ll find out exactly how difficult those two tasks area
*/


#------Exploring the Data---------------
#1.We've imported a dataset of emails from scikit-learn's datasets. All of these emails are tagged based on their content. Print emails.target_names to see the different categories.
from sklearn.datasets import fetch_20newsgroups
from sklearn.naive_bayes import MultinomialNB
from sklearn.feature_extraction.text import CountVectorizer

#2.We're interested in seeing how effective our Naive Bayes classifier is at telling the difference between a baseball email and a hockey email. We can select the categories of articles we want from fetch_20newsgroups by adding the parameter categories. In the function call, set categories equal to the list ['rec.sport.baseball', 'rec.sport.hockey']
emails = fetch_20newsgroups(categories = ['rec.sport.baseball', 'rec.sport.hockey'])
#print(emails.target_names)

#3.Let's take a look at one of these emails. All of the emails are stored in a list called emails.data. Print the email at index 5 in the list.
#print(emails.data[5])

#4.All of the labels can be found in the list emails.target. Print the label of the email at index 5. The labels themselves are numbers, but those numbers correspond to the label names found at emails.target_names. Is this a baseball email or a hockey email?
#print(emails.target[5])

#------------Making the Training and Test Sets----
#5. We now want to split our data into training and test sets. Change the name of your variable from emails to train_email. Add these three parameters to the function call: 
#Adding the random_state parameter will make sure that every time you run the code, your dataset is split in the same way.
train_emails = fetch_20newsgroups(categories = ['rec.sport.baseball', 'rec.sport.hockey'], subset = 'train', shuffle = True, random_state = 108)

#6.Create another variable named test_emails and set it equal to fetch_20newsgroups. The parameters of the function should be the same as before except subset should now be 'test'
test_emails = fetch_20newsgroups(categories = ['rec.sport.baseball', 'rec.sport.hockey'], subset = 'test', shuffle = True, random_state = 108)

#------------Couting Words-------------------
#7.We want to transform these emails into lists of word counts. The CountVectorizer class makes this easy for us.Create a CountVectorizer object and name it counter
counter= CountVectorizer()

#8.We need to tell counter what possible words can exist in our emails. counter has a .fit() a function that takes a list of all your data. Call .fit() with test_emails.data + train_emails.data as a parameter.
counter.fit(test_emails.data, train_emails.data)

#9.We can now make a list of the counts of our words in our training set. Create a variable named train_counts. Set it equal to counter's transform function using train_emails.data as a parameter.
train_counts = counter.transform(train_emails.data)

#10.Let's also make a variable named test_counts. This should be the same function call as before, but use test_emails.data as the parameter of transform.
test_counts = counter.transform(test_emails.data)

#----------Making a Naive Bayes Classifier---------
#11. Let's now make a Naive Bayes classifier that we can train and test on. Create a MultinomialNB object named classifier.
classifier = MultinomialNB()

#12.Call classifier's .fit() function. .fit() takes two parameters. The first should be our training set, which for us is train_counts. The second should be the labels associated with the training emails. Those are found in train_emails.target.
classifier.fit(train_counts, train_emails.target)

#13.Test the Naive Bayes Classifier by printing classifier's .score() function. .score() takes the test set and the test labels as parameters. .score() will classify all the emails in the test set and compare the classification of each email to its actual label. After completing these comparisons, it will calculate and return the accuracy.
print(classifier.score(test_counts, test_emails.target))

#----------Testing Other Datasets----------------
#14. Our classifier does a pretty good job distinguishing between soccer emails and hockey emails. But let's see how it does with emails about really different topics. Find where you create train_emails and test_emails. Change the categories to be ['comp.sys.ibm.pc.hardware','rec.sport.hockey'].Did your classifier do a better or worse job on these two datasets?

#15.Play around with different sets of data. Can you find a set that's incredibly accurate or incredibly inaccurate? The possible categories are listed below.


----------------------------------------------------
18/12/2018
CLUSTERING: K-MEANS
Handwriting Recognition using K-Means

/*The U.S. Postal Service has been using machine learning and scanning technologies since 1999. Because its postal offices have to look at roughly half a billion pieces of mail every day, they have done extensive research and developed very efficient algorithms for reading and understanding addresses. And not only the post office:

ATMs can recognize handwritten bank checks
Evernote can recognize handwritten task lists
Expensify can recognize handwritten receipts
But how do they do it?

In this project, you will be using K-means clustering (the algorithm behind this magic) and scikit-learn to cluster images of handwritten digits.

Let's get started!
*/

import codecademylib3_seaborn
import numpy as np
from matplotlib import pyplot as plt

#------------Getting Started with the Digits Dataset:---
#1. The sklearn library comes with a digits dataset for practise. From sklearn library, import the datasets module.Then, load in the digits data using .load_digits() and print digits.
from sklearn import datasets
digits = datasets.load_digits()

#2.When first starting out with a dataset, it’s always a good idea to go through the data description and see what you can already learn.Instead of printing the digits, print digits.DESCR.What is the size of an image (in pixel)?Where is this dataset from?
#print(digits.DESCR)

#3.Let's see what the data looks like!
#print(digits.data)

#4.Next, print out the target values in digits.target.
print(digits.target)

#5.To visualize the data images, we need to use Matplotlib. Let's visualize the image at index 100:
plt.gray()
plt.matshow(digits.images[100])
plt.show()

#Is it a 4? Let's print out the target label at index 100 to find out!
print(digits.target[100])


/*#Open the hint to see how you can visualize more than one image.
#To take a look at 64 sample images. Copy and paste the code below:
# Figure size (width, height)

fig = plt.figure(figsize=(6, 6))

# Adjust the subplots 

fig.subplots_adjust(left=0, right=1, bottom=0, top=1, hspace=0.05, wspace=0.05)

# For each of the 64 images

for i in range(64):

    # Initialize the subplots: add a subplot in the grid of 8 by 8, at the i+1-th position

    ax = fig.add_subplot(8, 8, i+1, xticks=[], yticks=[])

    # Display an image at the i-th position

    ax.imshow(digits.images[i], cmap=plt.cm.binary, interpolation='nearest')

    # Label the image with the target value

    ax.text(0, 7, str(digits.target[i]))

plt.show()
*/
#---------K-Means Clustering:------
#6Now we understand what we are working with. Let's cluster the 1797 different digit images into groups.
from sklearn.cluster import KMeans

#7What should be the k, the number of clusters, here? Use the KMeans() method to build a model that finds k clusters.
#The random_state will ensure that every time you run your code, the model is built in the same way. This can be any number. We used random_state = 42.
model = KMeans(n_clusters =10, random_state =42)

#8.Use the .fit() method to fit the digits.data to the model.
model.fit(digits.data)

#---------Visualizing after K-Means:----------
#9.Let's visualize all the centroids! Because data samples live in a 64-dimensional space, the centroids have values so they can be images!First, add a figure of size 8x3 using .figure().Then, add a title using .suptitle().
fig = plt.figure(figsize=(8, 3))
fig.suptitle('Cluser Center Images', fontsize=14, fontweight='bold')

#10.Scikit-learn sometimes calls centroids "cluster centers". Write a for loop to displays each of the cluster_centers_ like so. Scikit-learn sometimes calls centroids "cluster centers".
for i in range(10):

  # Initialize subplots in a grid of 2X5, at i+1th position
  ax = fig.add_subplot(2, 5, 1 + i)

  # Display images
  ax.imshow(model.cluster_centers_[i].reshape((8, 8)), cmap=plt.cm.binary)
 
#11.Outside of the for loop, use .show() to display the visualization.
plt.show()

#12.Optional:If you want to see another example that visualizes the data clusters and their centers using K-means, check out the sklearn's own example.

#---------Testing Your Model:-----------
#13.Instead of feeding new arrays into the model, let's do something cooler! Inside the right panel, go to test.html.

#14What year will robots take over the world? Use your mouse to write a digit in each of the boxes and click Get Array.

#15 Back in script.py, create a new variable named new_samples and copy and paste the 2D array into it.
new_samples = np.array([
[0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.37,1.52,1.52,0.68,0.00,0.00,0.00,0.08,5.55,7.62,7.62,6.85,0.76,0.00,0.00,2.73,7.62,3.73,2.43,7.54,3.81,0.00,0.00,4.49,7.24,0.00,0.00,6.17,4.57,0.00,0.00,5.32,5.62,0.00,0.00,7.08,4.42,0.00,0.00,4.88,7.24,1.82,3.05,7.62,2.59,0.00,0.00,0.99,6.86,7.62,7.62,5.71,0.15,0.00],
[0.00,0.00,1.06,3.80,3.80,1.37,0.00,0.00,0.00,0.30,6.62,7.39,7.46,5.33,0.00,0.00,0.00,2.27,7.61,2.66,4.78,6.78,0.00,0.00,0.00,1.60,7.55,7.39,7.61,6.85,0.00,0.00,0.00,0.00,1.52,3.81,5.70,6.85,0.00,0.00,0.00,0.00,0.00,0.00,3.80,6.85,0.00,0.00,0.00,1.67,5.03,3.19,5.92,6.84,0.00,0.00,0.00,1.98,7.23,7.61,7.45,3.57,0.00,0.00],
[0.00,0.00,3.40,5.32,2.59,0.00,0.00,0.00,0.00,3.20,7.62,7.53,5.33,0.00,0.00,0.00,0.00,4.57,6.48,5.55,5.32,0.00,0.00,0.00,0.00,2.74,4.34,7.39,4.57,0.00,0.00,0.00,0.00,0.00,3.72,7.62,1.51,0.00,0.00,0.00,0.00,1.06,7.23,5.71,0.00,0.00,0.00,0.00,0.00,4.79,7.62,6.39,6.08,6.86,1.60,0.00,0.00,2.74,4.65,5.33,5.33,4.03,0.69,0.00],
[0.00,0.00,0.00,0.07,0.76,0.00,0.00,0.00,0.00,0.00,0.08,5.16,7.62,2.06,0.00,0.00,0.00,1.29,5.56,7.62,7.62,2.29,0.00,0.00,1.14,7.55,7.32,3.95,7.62,2.29,0.00,0.00,0.23,2.89,0.68,0.76,7.61,2.28,0.00,0.00,0.00,0.00,0.00,0.76,7.61,2.28,0.00,0.00,0.00,0.00,0.00,0.76,7.62,2.28,0.00,0.00,0.00,0.00,0.00,0.08,2.81,0.46,0.00,0.00]
])

#16.Use the .predict() function to predict new labels for these four new digits. Store those predictions in a variable named new_labels.
new_labels = model.predict(new_samples)

#17.But wait, because this is a clustering algorithm, we don't know which label is which.By looking at the cluster centers, let's map out each of the labels with the digits we think it represents:
for i in range(len(new_labels)):
  if new_labels[i] == 0:
    print(0, end='')
  elif new_labels[i] == 1:
    print(9, end='')
  elif new_labels[i] == 2:
    print(2, end='')
  elif new_labels[i] == 3:
    print(1, end='')
  elif new_labels[i] == 4:
    print(6, end='')
  elif new_labels[i] == 5:
    print(8, end='')
  elif new_labels[i] == 6:
    print(4, end='')
  elif new_labels[i] == 7:
    print(5, end='')
  elif new_labels[i] == 8:
    print(7, end='')
  elif new_labels[i] == 9:
    print(3, end='')
    
print(new_labels)    

#18.Is the model recognizing your handwriting?Remember, this model is trained on handwritten digits of 30 Turkish people (from the 1990's).Try writing your digits similar to these cluster centers:


-----------------------------------------------------------------
20/12/2018

SQL CUMULATIVE PROJECT
Analyzing Heart Disease

/*You are a Data Analyst at Codecademy Laboratory, a company that determines if a patient is at risk for developing coronary artery disease (CAD). CAD is one of the most common forms of heart disease. It can lead to heart attacks and strokes.

You will perform tasks to identify patients who are at-risk for developing CAD, so the lab can advise them to seek medical care. Before you do that, you'll complete tasks to reorganize your datasets in a better way.

How does the lab identify CAD risk?

First, a blood sample is collected. This blood sample is sent for a test called a lipid panel. The panel tests for levels of lipids that indicate CAD risk:

Total Cholesterol,
LDL,
HDL,
and Triglycerides.
When these lipid values range from Low, to Desirable, to Borderline_High, to High.

Desirable is good! Everything else may indicate CAD risk.

How do you tell if values are desirable or not?

You’ll work with patients, panels, and recommended_values tables. Keep in mind that data in these tables is semi-real. While it's based on real recommended values, we've simplified it for this project. Doctors take additional factors into account when guiding patients. Don't use it to make decisions about your health.

Here is some background you'll need:

patients: You'll use this table to add more context If you get stuck during this project, check out the project walkthrough video which can be found at the bottom of the page after the final step of the project.
to values in panels table - who's lipid panel is it? How can you contact them? Are they an active patient or inactive?

panels: It stores patients' lipid values from the blood test, such as total cholesterol, LDL, HDL, and triglycerides.

recommended_values: You should use this table to check if values in the panels table indicate CAD risk. Here is how you tell if values are desirable or not:

Total Cholesterol: <200 is Desirable, 200 - 239 is Borderline-High, and >=240 is High
LDL: <130 is Desirable, 130 - 159 is Borderline-High, and >=160 is High
HDL: <50 is Low, and >=50 is Desirable
Triglycerides: <150 is Desirable, 150 - 199 is Borderline-High, and >=200 is High
Note: Don't delete the code after you complete a checkpoint. Continue below it. If you don't do this, your subsequent code won't work.
*/

#1.If you get stuck during this project, check out the project walkthrough video which can be found at the bottom of the page after the final step of the project.
#When you're ready to find the answer, check the hint.

SELECT *
FROM recommended_value
LIMIT 10;

#----Tasks to help the lab run more efficiently:-----
#2.Something seems weird in the panels table... Oh, there is a duplicate row. That's not helpful!
#Let's remove this row. Make sure you return the first 5 rows again to check that it's actually gone.
DELETE FROM panels 
WHERE ID = 'ID';

SELECT * 
FROM panels 
LIMIT 5;

#3.Valaria Broadwell, a patient with ID 7, was an inactive patient at our lab but would like to become a regular patient again.
#Change her Status in patients table from inactive to active.

UPDATE patients
SET Status = "active"
WHERE ID =7;

SELECT * 
FROM patients
WHERE ID =7;

#4.Your lab thinks that data in patients table could be organized better. They want their inactive patients in a separate table from now on.
#Create a table called inactive_patients and copy all inactive patients into this table. This new table should have columns identical to the patients table.
#We haven't learned how to copy a table, so take a moment and Google "SQL CREATE AS" and see if you can figure it out

CREATE TABLE inactive_patients
AS SELECT * 
    FROM patients 
    WHERE Status = "inactive";
    
    
DELETE FROM patients 
WHERE status = "inactive";

#5.patients is not the best name for patients table anymore, is it?
#Change the name to active_patients.    
ALTER TABLE patients
RENAME TO active_patients;

#6.Did you know you can do arithmetic with SQL?
#Your lab's marketing team is trying to re-engage inactive patients. They want to know how many patients they'll need to convince.
#Find the percentage of active and inactive patients.
#Take a look at the hint below.
WITH
total_active AS (
  SELECT COUNT() AS active
  FROM active_patients),
  
total_inactive AS (
  SELECT COUNT() AS inactive
  FROM inactive_patients ),
  
total_patients AS (
  SELECT total_active.active + total_inactive.inactive AS total
  FROM total_active, total_inactive)

SELECT 
   (total_active.active*100/total_patients.total) AS percent_active,    (total_inactive.inactive*100/total_patients.total) AS percent_inactive 
FROM total_active, total_inactive, total_patients;   
  

#7.The most recent patient to visit the lab is the last patient in the active_patients table. Find out who it is, so we can ask them if they forgot their wallet.
#Challenge yourself to not just use ID = 99! That's too easy!  

#Did your query from the last checkpoint not work, even when you ran the solution code?
#The solution code isn't wrong, it's just not complete. Can you find out what's missing?
DELETE FROM active_patients
WHERE ID = 'ID';

DELETE FROM active_patients 
WHERE Name IN 
(SELECT Name FROM active_patients LIMIT 1);

SELECT *
FROM active_patients 
WHERE ID = (SELECT MAX(ID) 
            FROM active_patients);

#9.Find patients that have come in for a lipid panel more than once.
#Use the panels table. You only need to list the patient_IDs for this.  
SELECT patient_ID, COUNT() FROM panels GROUP BY patient_ID HAVING COUNT() > 1;

#10.Remember your panels table did not have an LDL column? Well, let's add it now.
#LDL is not calculated directly from the blood sample. 
#Most specialists use the Friedewald Equation to estimate LDL 
#from Total Cholesterol, HDL, and Triglycerides. This is the equation:
ALTER TABLE panels
ADD COLUMN LDL DECIMAL(5,2);

UPDATE panels
SET LDL = panels.Cholesterol - (panels.HDL + panels.Triglycerides)/5;

#11.LDL is the bad cholesterol. Patients with Borderline_High and High LDL levels may be at risk for heart disease.
#Find these patients, organize the list from High to Low, and round off the values. You should return the list in the following format:
#While it was mentioned above that other lipids play a role in CAD risk as well, let's just focus on LDL here.

WITH 
rv AS(
  SELECT Borderline_High, High
  FROM recommended_values
  WHERE Lipid = 'LDL')
  
SELECT Name, ROUND(LDL), Address, Phone, COUNT(patient_ID), Borderline_High
FROM active_patients,rv
JOIN panels
ON active_patients.ID = panels.patient_ID
GROUP BY Name, LDL
HAVING LDL>= rv.Borderline_High 
ORDER BY LDL DESC;

/*SELECT 
    active_patients.Name AS 'Name', 
    ROUND(LDL) AS 'LDL', 
    active_patients.Address AS 'Address',
    active_patients.Phone AS 'Phone'
FROM 
    panels, 
    (SELECT Borderline_High, High FROM recommended_values WHERE Lipid = "LDL") rv
JOIN active_patients ON panels.patient_ID = active_patients.ID
GROUP BY 
    LDL, 
    active_patients.Name 
HAVING LDL >= rv.Borderline_High
ORDER BY LDL DESC;
*/

#12.How many patients have Borderline_High levels of LDL? and How many patients have High levels of LDL?
#Your result should look like this:

WITH 
rv AS(
  SELECT Borderline_High, High
  FROM recommended_values
  WHERE Lipid = 'LDL')
  
SELECT 
  COUNT(
  	CASE
     	WHEN (LDL>=rv.High) THEN High
    END 
  ) AS High,
  COUNT(
  	CASE
     	WHEN (LDL>=rv.Borderline_high AND LDL<rv.High) THEN High
    END 
  ) AS Borderline_High
FROM panels, rv;  
  

/*SELECT 
    COUNT(CASE WHEN (LDL >= rv.Borderline_High AND LDL < rv.High) THEN LDL END) AS Borderline_High,
    COUNT(CASE WHEN LDL >= rv.High THEN LDL END) AS High
FROM 
    panels, 
    (SELECT Borderline_High, High FROM recommended_values WHERE Lipid = "LDL") rv;*/