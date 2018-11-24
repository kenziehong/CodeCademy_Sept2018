QUERIES
Select

SELECT is used every time you want to query data from a database and * means all columns.
#Line breaks don't mean anything specific in SQL. We could write this entire query in one line, and it would run just fine.

#select the name and genre columns of the table.
SELECT name, genre, year
FROM movies;

++++++++++++++++++++++++++++++++++

QUERIES
As

AS is a keyword in SQL that allows you to rename a column or table using an alias.

#select the imdb_rating column and rename it as IMDb.
SELECT imdb_rating AS 'IMDb' FROM movies;

+++++++++++++++++++++++++++++++++

QUERIES
Distinct

DISTINCT is used to return unique values in the output. It filters out all duplicate values in the specified column(s).

#return the unique values of the year column instead.
SELECT DISTINCT year FROM movies;

+++++++++++++++++++++++++++++++++

QUERIES
Where

We can restrict our query results using the WHERE clause in order to obtain only the information we want.
WHERE clause filters the result set to only include rows where the following condition is true.

#retrieve all the recent movies, specifically those that were released after 2014.
SELECT * FROM movies WHERE year > 2014;

++++++++++++++++++++++++++++++++++

QUERIES
Like I

when you want to compare similar values.
LIKE is a special operator used with the WHERE clause to search for a specific pattern in a column.

The _ means you can substitute any individual character here without breaking the pattern. 

#select all movies that start with 'Se' and end with 'en' and have exactly one character in the middle
SELECT * FROM movies WHERE name LIKE 'Se_en';

+++++++++++++++++++++++++++++++++

QUERIES
Like II

% is a wildcard character that matches zero or more missing letters in the pattern. 
We can also use % both before and after a pattern:

#selects all the information about the movie titles that begin with the word 'The'.
SELECT * FROM movies WHERE name LIKE 'The %';

+++++++++++++++++++++++++++++++++++

QUERIES
Is Null

Unknown values are indicated by NULL
It is not possible to test for NULL values with comparison operators, such as = and !=.

#Write a query to find all the movies without an IMDb rating.
#Select only the name column!
SELECT name FROM movies WHERE imdb_rating IS NULL;


++++++++++++++++++++++++++++++++++++++++

QUERIES
Between

filter the result set within a certain range

#select all information about movies whose name begins with the letter 'D','E','F' 
#(BETWEEN two letters is not inclusive of the 2nd letter.)
SELECT * FROM movies WHERE name BETWEEN 'D' AND 'G';

#selects all information about movies that were released in the 1970's 
#(BETWEEN two numbers is inclusive of the 2nd number.)
SELECT * FROM movies WHERE year BETWEEN 1970 AND 1979;


++++++++++++++++++++++++++++++++++

QUERIES
And
Or

Sometimes we want to combine multiple conditions in a WHERE clause to make the result set more specific and useful.
AND operator displays a row if all the conditions are true.
OR operator displays a row if any condition is true.

#Now, let's retrieve every movie released in the 70's, that's also well received.
SELECT * FROM movies 
WHERE year BETWEEN 1970 AND 1979 
  AND imdb_rating > 8;


#write a new query that selects all movies made prior to 1985 that are also in the horror genre.
SELECT * FROM movies 
WHERE year < 1985 
  AND genre = 'horror';

SELECT * FROM movies
WHERE year > 2014
   OR genre ='action';
  
SELECT * FROM movies
WHERE genre = 'romance' 
   OR genre ='comedy';
    
++++++++++++++++++++++++++++++++++

QUERIES
Order By

ORDER BY is a clause that indicates you want to sort the result set by a particular column.
Note: ORDER BY always goes after WHERE (if WHERE is present).

#retrieve the name, year columns of all the movies, ordered by their name alphabetically
SELECT name, year FROM movies ORDER BY name;

#retrieves the name, year, and imdb_rating columns of all the movies, ordered highest to lowest by their ratings.
SELECT name, year, imdb_rating FROM movies ORDER BY imdb_rating DESC;    


+++++++++++++++++++++++++++++++++
QUERIES
Limit

LIMIT is a clause that lets you specify the maximum number of rows the result set will have. This saves space on our screen and makes our queries run faster.

#write a query that returns the top 3 highest rated movies.Select all the columns.
SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 3;

+++++++++++++++++++++++++++++++++

QUERIES
Case

A CASE statement allows us to create different outputs (usually in the SELECT statement).
Each WHEN tests a condition and the following THEN gives us the string if the condition is true.
The ELSE gives us the string if all the above conditions are false.
The CASE statement must end with END


#Select the name column and use a CASE statement to create the second column that is. Rename the whole CASE statement to 'Mood' using AS
SELECT name,
 CASE
  WHEN genre = 'romance' THEN 'Chill'
  WHEN genre = 'comedy' THEN 'Chill'
  ELSE 'Intense'
 END 
 AS 'Mood'
FROM movies; 
 
 
-------------------------------------------------------------------------
AGGREGATE FUNCTIONS

COUNT() is a function that takes the name of a column as an argument and counts the number of non-empty values in that column.

SELECT COUNT(*)
FROM fake_apps
WHERE price = 0;

++++++++++++++++++

SUM() is a function that takes the name of a column as an argument and returns the sum of all the values in that column.

SELECT SUM(downloads)
FROM fake_apps;

+++++++++++++++++++++

The MAX() and MIN() functions return the highest and lowest values in a column, respectively.

SELECT MAX(price)
FROM fake_apps;

++++++++++++++++++++++

SQL uses the AVG() function to quickly calculate the average value of a particular column.

SELECT AVG(price)
FROM fake_apps;

+++++++++++++++++

We can make the result table easier to read using the ROUND() function.
SQL rounds the values in "the column name" to "integer" decimal places in the output.

SELECT ROUND(AVG(price),2)
FROM fake_apps;

++++++++++++++++++

GROUP BY is a clause in SQL that is used with aggregate functions. It is used in collaboration with the SELECT statement to arrange identical data into groups.

The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.

SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY category;


SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;

++++++++++++++++++++++++++++++++++++++++++

We can't use WHERE here because we don't want to filter the rows; we want to filter groups.

HAVING is very similar to WHERE. In fact, all types of WHERE clauses you learned about thus far can be used with HAVING.

When we want to limit the results of a query based on values of the individual rows, use WHERE.
When we want to limit the results of a query based on an aggregate property, use HAVING.
HAVING statement always comes after GROUP BY, but before ORDER BY and LIMIT.

SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*)>10;

------------------------------------------------------------

WORKING WITH MULTIPLE DATAFRAMES
Inner Merge I

import codecademylib
import pandas as pd

orders = pd.read_csv('orders.csv')

products = pd.read_csv('products.csv')

customers = pd.read_csv('customers.csv')

print(orders)
print(products)
print(customers)

order_3_description = 'thing-a-ma-jig'
order_5_phone_number = '112-358-1321'

+++++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Inner Merge II

#The .merge method looks for columns that are common between two DataFrames and then looks for rows where those column's values are the same. It then combines the matching rows into a single row in a new table.


import codecademylib
import pandas as pd

sales = pd.read_csv('sales.csv')
print(sales)
targets = pd.read_csv('targets.csv')
print(targets)
sales_vs_targets = pd.merge(sales,targets)
print(sales_vs_targets)

crushing_it = sales_vs_targets[sales_vs_targets.revenue > sales_vs_targets.target]

++++++++++++++++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Inner Merge III

#In addition to using pd.merge, each DataFrame has its own merge method. 

import codecademylib
import pandas as pd

sales = pd.read_csv('sales.csv')

targets = pd.read_csv('targets.csv')

men_women = pd.read_csv('men_women_sales.csv')

all_data = sales.merge(targets)\
	.merge(men_women)

print(all_data)

results = all_data[(all_data.revenue > all_data.target) & (all_data.women > all_data.men)]

++++++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Merge on Specific Columns

#merge two DataFrames whose columns don't match.
#One way that we could address this problem is to use .rename to rename the columns for our merges. In the example below, we will rename the column id to customer_id, so that orders and customers have a common column for the merge.
import codecademylib
import pandas as pd

orders = pd.read_csv('orders.csv')
print(orders)
products = pd.read_csv('products.csv')
print(products)

orders_products = pd.merge(
  orders,
  products.rename(columns={'id':'product_id'})
)

+++++++++++++++++++++++++++++
WORKING WITH MULTIPLE DATAFRAMES
Merge on Specific Columns II

#we have another option. We could use the keywords left_on and right_on to specify which columns we want to perform the merge on
#The new column names id_x and id_y aren't very helpful for us when we read the table. We can help make them more useful by using the keyword suffixes

import codecademylib
import pandas as pd

orders = pd.read_csv('orders.csv')
print(orders)
products = pd.read_csv('products.csv')
print(products)

orders_products = pd.merge(
	orders, 
  products,
  left_on = 'product_id',
  right_on = 'id',
  suffixes = ['_orders', '_products']
)

print(orders_products)


+++++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Mismatched Merges

#when we merge two DataFrames whose rows don't match perfectly, we lose the unmatched rows.
#This type of merge (where we only include matching rows) is called an inner merge
++++++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Outer Merge

#An Outer Join would include all rows from both tables, even if they don't match. Any missing values are filled in with None or nan (which stands for "Not a Number").

import codecademylib
import pandas as pd

store_a = pd.read_csv('store_a.csv')
print(store_a)
store_b = pd.read_csv('store_b.csv')
print(store_b)

store_a_b_outer = pd.merge(store_a, store_b, how = 'outer')
print(store_a_b_outer)

+++++++++++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Left and Right Merge

#A Left Merge includes all rows from the first (left) table, but only rows from the second (right) table that match the first table.
#Right merge is the exact opposite of left merge. Here, the merged table will include all rows from the second (right) table, but only rows from the first (left) table that match the second table.

import codecademylib
import pandas as pd

store_a = pd.read_csv('store_a.csv')
print(store_a)
store_b = pd.read_csv('store_b.csv')
print(store_b)
store_a_b_left = pd.merge(store_a, store_b, how ='left')
print(store_a_b_left)
store_b_a_left = pd.merge(store_b, store_a, how ='left')
print(store_b_a_left)

+++++++++++++++++++++

WORKING WITH MULTIPLE DATAFRAMES
Concatenate DataFrames

#When we need to reconstruct a single DataFrame from multiple smaller DataFrames, we can use the method pd.concat([df1, df2, df2, ...]). This method only works if all of the columns are the same in all of the DataFrames.

import codecademylib
import pandas as pd

bakery = pd.read_csv('bakery.csv')
print(bakery)
ice_cream = pd.read_csv('ice_cream.csv')
print(ice_cream)

menu = pd.concat([bakery,ice_cream])
print(menu)

---------------------------------------------------------------

MULTIPLE TABLES
Combining Tables with SQL

#we use the syntax table_name.column_name to be sure that our requests for columns are unambiguous. 
#In our example, we use this syntax in the ON statement, but we will also use it in the SELECT or any other statement where we refer to column names.

-- First query
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id;

-- Second query
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';

+++++++++++++++++++++++++++++++

MULTIPLE TABLES
Inner Joins

SELECT COUNT(*)
FROM newspaper;

SELECT COUNT(*)
FROM online;

SELECT COUNT(*)
FROM newspaper
JOIN online
  ON newspaper.id = online.id;
 
++++++++++++++++++++++++++++++

MULTIPLE TABLES
Left Joins

#A left join will keep all rows from the first table, regardless of whether there is a matching row in the second table.

-- First query
SELECT *
FROM newspaper
LEFT JOIN online
	ON newspaper.id = online.id;
  
-- Second query
SELECT *
FROM newspaper
LEFT JOIN online
	ON newspaper.id = online.id
WHERE online.id IS NULL;

++++++++++++++++++++++++++++

MULTIPLE TABLES
Primary Key vs Foreign Key

/*
Each of these tables has a column that uniquely identifies each row of that table:

These special columns are called primary keys.

Primary keys have a few requirements:

None of the values can be NULL.
Each value must be unique (i.e., you can't have two customers with the same customer_id in the customers table).
A table can not have more than one primary key column.

When the primary key for one table appears in a different table, it is called a foreign key.

So customer_id is a primary key when it appears in customers, but a foreign key when it appears in orders

*/

++++++++++++++++++++++++

MULTIPLE TABLES
Cross Join

A more common usage of CROSS JOIN is when we need to compare each row of a table to a list of values.


SELECT month, 
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
  AND end_month >= month
GROUP BY month;

+++++++++++++++++++++++++++++++++
MULTIPLE TABLES
Union

Sometimes we just want to stack one dataset on top of the other. Well, the UNION operator allows us to do that.

SQL has strict rules for appending data:

Tables must have the same number of columns.
The columns must have the same data types in the same order as the first table.

SELECT *
FROM newspaper 
UNION
SELECT *
FROM online ;

+++++++++++++++++++++++++++++++

MULTIPLE TABLES
With

#Often times, we want to combine two tables, but one of the tables is the result of another calculation.
#Essentially, we are putting a whole first query inside the parentheses () and giving it a name. After that, we can use this name as if it's a table and write a new query using the first query.

WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;

------------------------------------------------------------

Introduction to NumPy

import numpy as np

#Create a NumPy array
test_1=np.array([92,94,88,91,87])

#Import the student's scores on the second test from the CSV test_2.csv into an array.
test_2 = np.genfromimport numpy as np

rainfall = np.array([5.21, 3.76, 3.27, 2.35, 1.89, 1.55, 0.65, 1.06, 1.72, 3.35, 4.82, 5.11])

rain_mean = np.mean(rainfall)
rain_median = np.median(rainfall)
first_quarter = np.percentile(rainfall,25)
third_quarter = np.percentile(rainfall,75)
interquartile_range = third_quarter - first_quarter
rain_std = np.std(rainfall)
rain_min = np.min(rainfall)
rain_max = np.max(rainfall)
print(rain_mean)
print(rain_median)
print(first_quarter)
print(third_quarter)
print(interquartile_range)
print(rain_std)
print(rain_min)
print(rain_max)



txt('test_2.csv', delimiter =',')

#Operations with NumPy Arrays
temperatures_fixed = temperatures + 3

#Selecting Elements from a 1-D Array
jeremy_test_2 = test_2[-2]
manual_adwoa_test_1 = test_1[1:3]


#Selecting Elements from a 2-D Array
#The syntax for selecting from a 2-d array is a[row,column] where a is the array.
monday_temperatures = temperatures_fixed[0,:]
thursday_friday_morning = temperatures_fixed[3:5,1]

#Logical Operations with Arrays
#We can also combine logical statements to further specify our criteria. To do so, we place each statement in parentheses and use boolean operators like & (and) and | (or).
temperature_extremes = temperatures_fixed[(temperatures_fixed<50) | (temperatures_fixed>60)]

-----------------------------------------------------------------

INTRODUCTION TO STATISTICS WITH NUMPY


import numpy as np

rainfall = np.array([5.21, 3.76, 3.27, 2.35, 1.89, 1.55, 0.65, 1.06, 1.72, 3.35, 4.82, 5.11])

#NumPy and Mean
#The mean is a useful measurement to get the center of a dataset
#average number
rain_mean = np.mean(rainfall)

#Mean and Logical Operations
#how many percentage items in an array if it matches the specified condition
#the total number of True = 1 items divided by the total array length.
rain_over_3 = np.mean(rainfall>3)

#Calculating the Mean of 2D Arrays
allergy_trials = np.array([[6, 1, 3, 8, 2], 
                           [2, 6, 3, 9, 8], 
                           [5, 2, 6, 9, 9]])

trial_mean = np.mean(allergy_trials, axis=1) #the rows
patient_mean = np.mean(allergy_trials, axis =0) #the columns

#Sorting and Outliers
#One way to quickly identify outliers is by sorting our data
sorted_temps = np.sort(temps)


#NumPy and Median
#The median is the middle value of a dataset that’s been ordered in terms of magnitude (from lowest to highest).
rain_median = np.median(rainfall)

#Mean vs. Median
#In a dataset, the median value can provide an important comparison to the mean. 
#Unlike a mean, the median is not affected by outliers. 
#This becomes important in skewed datasets, datasets whose values are not distributed evenly.

#Percentiles, Part I
#the median is the middle of a dataset: it is the number for which 50% of the samples are below, and 50% of the samples are above. 
#But what if we wanted to find a point at which 40% of the samples are below, and 60% of the samples are above?
first_quarter = np.percentile(rainfall,25)
third_quarter = np.percentile(rainfall,75)

#The difference between the first and third quartile is a value called the interquartile range. 
#50% of the dataset will lie within the interquartile range.
interquartile_range = third_quarter - first_quarter

#NumPy and Standard Deviation, Part I
#While the mean and median can tell us about the center of our data, 
#they do not reflect the range of the data. That's where standard deviation comes in.
#Similar to the interquartile range, the standard deviation tells us the spread of the data. The larger the standard deviation, the more spread out our data is from the center. The smaller the standard deviation, the more the data is clustered around the mean.
rain_std = np.std(rainfall)

rain_min = np.min(rainfall)
rain_max = np.max(rainfall)
print(rain_mean)
print(rain_median)
print(first_quarter)
print(third_quarter)
print(interquartile_range)
print(rain_std)
print(rain_min)
print(rain_max)

2.895
2.81
1.6775
4.025
2.3475
1.52673125773
0.65
5.21

