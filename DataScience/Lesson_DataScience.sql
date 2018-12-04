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

-----------------------------------------------------------------
STATISTICAL DISTRIBUTIONS WITH NUMPY
Histograms, Part III

import codecademylib
import numpy as np

# Write matplotlib import here:
from matplotlib import pyplot as plt

commutes = np.genfromtxt('commutes.csv', delimiter=',')

# zoom in and see how many people have commutes ranging between 20 and 50 minutes.
#it has 6 bins 
#how many values fall between 20 and 25, 26 and 30 , etc.
#These groupings are called bins. 
#All bins in a histogram are always the same size. 
#The width of each bin is the distance between the minimum and maximum values of each bin.

# Plot histogram here:
plt.hist(commutes, bins = 6, range=(20,51))
plt.show()

++++++++++++++++++++++++++++++++++++

import codecademylib
import numpy as np
from matplotlib import pyplot as plt

# Brachiosaurus
b_data = np.random.normal(6.7,0.7,size=1000)

# Fictionosaurus
f_data = np.random.normal(7.7,0.3,size=1000)

plt.hist(b_data,
         bins=30, range=(5, 8.5), histtype='step',
         label='Brachiosaurus')
plt.hist(f_data,
         bins=30, range=(5, 8.5), histtype='step',
         label='Fictionosaurus')
plt.xlabel('Femur Length (ft)')
plt.legend(loc=2)
plt.show()

++++++++++++++++++++++++++++++++++++

import codecademylib
import numpy as np
from matplotlib import pyplot as plt

sunflowers = np.genfromtxt('sunflower_heights.csv',
                           delimiter=',')

# Calculate mean and std of sunflowers here:
sunflowers_mean = np.mean(sunflowers)
sunflowers_std = np.std(sunflowers)

# Calculate sunflowers_normal here:
sunflowers_normal = np.random.normal(
  loc=sunflowers_mean,
  scale=sunflowers_std,
  size=5000
)

plt.hist(sunflowers,
         range=(11, 15), histtype='step', linewidth=2,
        label='Observed', normed=True)
plt.hist(sunflowers_normal,
         range=(11, 15), histtype='step', linewidth=2,
        label='Normal', normed=True)
plt.legend()
plt.show()


# Calculate probabilities here:
experiments = np.random.binomial(200, 0.1, size=5000)
prob = np.mean(experiments < 20)
print(prob)

--------------------------------------------------------------------
HYPOTHESIS TESTING
1 Sample T-Testing

/*A univariate T-test compares a sample mean to a hypothetical population mean. 

SciPy has a function called ttest_1samp, which performs a 1 Sample T-Test for you.

ttest_1samp requires two inputs, a distribution of values and an expected mean:

tstat, pval = ttest_1samp(example_distribution, expected_mean)

When we conduct a hypothesis test, we want to first create a null hypothesis, which is a prediction that there is no significant difference. 

The null hypothesis that this test examines can be phrased as such: "The set of samples belongs to a population with the target mean".

if we receive a p-value of less than 0.05, we can reject the null hypothesis and state that there is a significant difference.
*/
from scipy.stats import ttest_1samp
import numpy as np

ages = np.genfromtxt("ages.csv")
print(ages)
ages_mean = np.mean(ages)
print(ages_mean)

tstat, pval = ttest_1samp(ages, 30)
print(pval) #0.56

++++++++++++++++++++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
2 Sample T-Test

/*One way of testing whether this difference is significant is by using a 2 Sample T-Test. 

A 2 Sample T-Test compares two sets of data, which are both approximately normally distributed.

The null hypothesis, in this case, is that the two distributions have the same mean.*/

from scipy.stats import ttest_ind
import numpy as np

week1 = np.genfromtxt("week1.csv",  delimiter=",")
week2 = np.genfromtxt("week2.csv",  delimiter=",")
week1_mean = np.mean(week1)
week2_mean = np.mean(week2)
print(week1_mean) #25.4480593951
print(week2_mean) #29.0215681077
week1_std = np.std(week1)
week2_std = np.std(week2)
print(week1_std)
print(week2_std)

tstatistic, pval = ttest_ind(week1, week2)
print(pval) #0.000676767690007

++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
Dangers of Multiple T-Tests

/*We know that the p-value is the probability that we incorrectly reject the null hypothesis on each t-test. 
The more t-tests we perform, the more likely that we are to get a false positive, a Type I error.

For a p-value of 0.05, if the null hypothesis is true then the probability of obtaining a significant result is 1 – 0.05 = 0.95. 
When we run another t-test, the probability of still getting a correct result is 0.95 * 0.95, or 0.9025. 
That means our probability of making an error is now close to 10%! 
This error probability only gets bigger with the more t-tests we do.
*/
from scipy.stats import ttest_ind
import numpy as np

a = np.genfromtxt("store_a.csv",  delimiter=",")
b = np.genfromtxt("store_b.csv",  delimiter=",")
c = np.genfromtxt("store_c.csv",  delimiter=",")

a_mean = np.mean(a)
b_mean = np.mean(b)
c_mean = np.mean(c)

a_std = np.std(a)
b_std = np.std(b)
c_std = np.std(c)

a_b_pval = ttest_ind(a, b).pvalue
a_c_pval = ttest_ind(a, c).pvalue
b_c_pval = ttest_ind(b, c).pvalue
print(a_b_pval)
print(a_c_pval)
print(b_c_pval)


error_prob = (1-(0.95**3))
print(error_prob)

+++++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
ANOVA

/*When comparing more than two numerical datasets, the best way to preserve a Type I error probability of 0.05 is to use ANOVA

ANOVA (Analysis of Variance) tests the null hypothesis that all of the datasets have the same mean. 
If we reject the null hypothesis with ANOVA, we're saying that at least one of the sets has a different mean; 
however, it does not tell us which datasets are different.*/

from scipy.stats import ttest_ind
from scipy.stats import f_oneway
import numpy as np

a = np.genfromtxt("store_a.csv",  delimiter=",")
b = np.genfromtxt("store_b_new.csv",  delimiter=",")
c = np.genfromtxt("store_c.csv",  delimiter=",")

pval = f_oneway(a,b,c).pvalue
print(pval) #8.49989098083e-215

+++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
Assumptions of Numerical Hypothesis Tests

/*Before we use numerical hypothesis tests, we need to be sure that the following things are true:

1. The samples should each be normally distributed...ish
2. The population standard deviations of the groups should be equal
3. The samples must be independent*/

import codecademylib
import numpy as np
import matplotlib.pyplot as plt

dist_1 = np.genfromtxt("1.csv",  delimiter=",")
dist_2 = np.genfromtxt("2.csv",  delimiter=",")
dist_3 = np.genfromtxt("3.csv",  delimiter=",")
dist_4 = np.genfromtxt("4.csv",  delimiter=",")

#plot your histogram here
#plt.hist(dist_1)
#plt.hist(dist_2)
plt.hist(dist_3)
#plt.hist(dist_4)
plt.show()
not_normal = 4
ratio = np.std(dist_2)/np.std(dist_3)
print(ratio) #0.58142210804

++++++++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
#Tukey's Range Test

/*We can perform a Tukey's Range Test to determine the difference between datasets.

For example, if we were looking to compare mean scores of movies that are dramas, comedies, or documentaries, 
we would make a call to pairwise_tukeyhsd like this:

It will return a table of information, telling you whether or not to reject the null hypothesis for each pair of datasets.*/


from statsmodels.stats.multicomp import pairwise_tukeyhsd
from scipy.stats import f_oneway
import numpy as np

a = np.genfromtxt("store_a.csv",  delimiter=",")
b = np.genfromtxt("store_b.csv",  delimiter=",")
c = np.genfromtxt("store_c.csv",  delimiter=",")

stat, pval = f_oneway(a, b, c)
print pval

# Using our data from ANOVA, we create v and l
v = np.concatenate([a, b, c])
labels = ['a'] * len(a) + ['b'] * len(b) + ['c'] * len(c)
tukey_results = pairwise_tukeyhsd(v,labels,0.05)
print(tukey_results)


+++++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
Binomial Test

/*So far, we have been working with numerical datasets. The tests we have looked at, the 1- and 2-Sample T-Tests, ANOVA, and Tukey's Range test, will not work if we can't find the means of our distributions and compare them.

If we have a dataset where the entries are not numbers, but categories instead, we have to use different methods.

To analyze a dataset like this, with two different possibilities for entries, we can use a Binomial Test. A Binomial Test compares a categorical dataset to some expectation.

SciPy has a function called binom_test, which performs a Binomial Test for you.

binom_test requires three inputs, the number of observed successes, the number of total trials, and an expected probability of success
*/

from scipy.stats import binom_test
pval = binom_test(510, n=10000, p=0.06)
print(pval)
pval2 = binom_test(590, n=10000, p=0.06)
print(pval2)


+++++++++++++++++++++++++++++++++++++++

HYPOTHESIS TESTING
Chi Square Test

/*If we have two or more categorical datasets that we want to compare, we should use a Chi Square test

In SciPy, you can use the function chi2_contingency to perform a Chi Square test.

The input to chi2_contingency is a contingency table where:
*/

from scipy.stats import chi2_contingency

# Contingency table
#         harvester |  leaf cutter
# ----+------------------+------------
# 1st gr | 30       |  10
# 2nd gr | 35       |  5
# 3rd gr | 28       |  12

X = [[30, 10],
     [35, 5],
     [28, 12],
    [20,20]]
chi2, pval, dof, expected = chi2_contingency(X)
print pval

--------------------------------------------------------------------------------

27/11/2018

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Create a DataFrame I

import codecademylib
import pandas as pd

df1 = pd.DataFrame({
  'Product ID': [1, 2, 3, 4],
  # add Product Name and Color here
  'Product Name': ['t-shirt', 't-shirt', 'skirt', 'skirt'],
  'Color': ['blue', 'green', 'red', 'black']
})

print(df1)


+++++++++++++++++++++++++++++++++++++++++++++
CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Create a DataFrame II

/*In this example, we were able to control the ordering of the columns because we used lists.
*/

import codecademylib
import pandas as pd

df2 = pd.DataFrame([
  [1, 'San Diego', 100],
  [2, 'Los Angeles', 120],
  # Fill in rows 3 and 4
  [3, 'San Francisco', 90],
  [4, 'Sacramento', 115]
],
  columns=[
    #add column names here
    'Store ID', 'Location', 'Number of Employees'
  ])

print(df2)

++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Comma Separated Variables (CSV)

-- Note that there are no spaces between the commas.

/*name,cake_flavor,frosting_flavor,topping
Devil's Food,chocolate,chocolate,chocolate shavings
Birthday Cake,vanilla,vanilla,rainbow sprinkles
Carrot Cake,carrot,cream cheese,almonds
*/
++++++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Loading and Saving CSVs


import codecademylib
import pandas as pd
df = pd.read_csv('sample.csv')
print(df)

#We can also save data to a CSV, using .to_csv().

df.to_csv('new-csv-file.csv')

++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Inspect a DataFrame

/*The method .head() gives the first 5 rows of a DataFrame.
The method df.info() gives some statistics for each column.
*/

import codecademylib
import pandas as pd

df = pd.read_csv('imdb.csv')
print(df.head())
print(df.info())

+++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Select Columns

/*There are two possible syntaxes for selecting all values from a column.

1.Select the column as if you were selecting a value from a dictionary using a key. 

2.If the name of a column follows all of the rules for a variable name 
(doesn't start with a number, doesn't contain spaces or special characters, etc.), 
*/
import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west']
)

clinic_north = df.clinic_north 
#clinic_north = df['clinic_north']
print(type(clinic_north))
print(type(df))

++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Selecting Multiple Columns

#Note: Make sure that you have a double set of brackets ([[]]), or this command won't work!

import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west']
)

clinic_north_south = df[['clinic_north','clinic_south']]
print(type(clinic_north_south))

+++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Select Rows

#DataFrames are zero-indexed, meaning that we start with the 0th row and count up from there. 

import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west'])

march = df.iloc[2]


+++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Selecting Multiple Rows

/*Here are some different ways of selecting multiple rows: 

orders.iloc[3:7] would select all rows starting at the 3rd row and up to but not including the 7th row 
orders.iloc[:4] would select all rows up to, but not including the 4th row
orders.iloc[-3:] would select the rows starting at the 3rd to last row and up to and including the final row
*/

import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west']
)

april_may_june = df.iloc[-3:]
print(april_may_june)


++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Select Rows with Logic I

#You can select a subset of a DataFrame by using logical statements: (==,>,<,!=,...)

import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west'])

#selects the row of df where the 'month' column is 'January'
january = df[df.month == 'January']
print(january)

+++++++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Select Rows with Logic II

#You can also combine multiple logical statements, as long as each statement is in parentheses.
#In Python, | means "or" and & means "and".

import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west'])

march_april = df[(df.month == 'March') | (df.month == 'April')]
print(march_april)

++++++++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Select Rows with Logic III

#We could use the isin command to check that df.name is one of a list of values:


import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west'])

january_february_march = df[df.month.isin(['January', 'February', 'March'])]
print(january_february_march)

+++++++++++++++++++++++++++++++++++++++

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Setting indices

/*When we select a subset of a DataFrame using logic, we end up with non-consecutive indices. 
This is inelegant and makes it hard to use .iloc().

We can fix this using the method .reset_index()
Using .reset_index() will return a new DataFrame, but we usually just want to modify our existing DataFrame. 
If we use the keyword inplace=True we can just modify our existing DataFrame

it's probably better to use the keyword drop=True so that you don't end up with that extra column
*/
import codecademylib
import pandas as pd

df = pd.DataFrame([
  ['January', 100, 100, 23, 100],
  ['February', 51, 45, 145, 45],
  ['March', 81, 96, 65, 96],
  ['April', 80, 80, 54, 180],
  ['May', 51, 54, 54, 154],
  ['June', 112, 109, 79, 129]],
  columns=['month', 'clinic_east',
           'clinic_north', 'clinic_south',
           'clinic_west']
)

df2 = df.loc[[1, 3, 5]]
print(df2)

df3 = df2.reset_index(drop=True, inplace=True)
print(df3)

+++++++++++++++++++++++++++++++++++++++++++++++
CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Review

import codecademylib
import pandas as pd

#Load the data from shoefly.csv into the variable orders.
orders = pd.read_csv('shoefly.csv')

#Inspect the first 5 lines of the data.
print(orders.head())

#Select all of the email addresses from the column email and save them to a variable called emails.
emails = orders.email

#Use logic to select that row of orders and save it to the variable frances_palmer.
frances_palmer = orders[(orders.first_name == 'Frances') & (orders.last_name == 'Palmer')]

#Select all orders for shoe_type: clogs, boots, and ballet flats and save them to the variable comfy_shoes.
comfy_shoes = orders[orders.shoe_type.isin(['clogs', 'boots', 'ballet flats'])]
print(comfy_shoes)

----------------------------------------------------------------------------

MODIFYING DATAFRAMES
Adding a Column I

One way that we can add a new column is by giving a list of the same length as the existing DataFrame.

import codecademylib
import pandas as pd

df = pd.DataFrame([
  [1, '3 inch screw', 0.5, 0.75],
  [2, '2 inch nail', 0.10, 0.25],
  [3, 'hammer', 3.00, 5.50],
  [4, 'screwdriver', 2.50, 3.00]
],
  columns=['Product ID', 'Description', 'Cost to Manufacture', 'Price']
)

# Add columns here
df['Sold in Bulk?'] = ['Yes', 'Yes', 'No', 'No']

print(df)

+++++++++++++++++++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Adding a Column II

We can also add a new column that is the same for all rows in the DataFrame.

import codecademylib
import pandas as pd

df = pd.DataFrame([
  [1, '3 inch screw', 0.5, 0.75],
  [2, '2 inch nail', 0.10, 0.25],
  [3, 'hammer', 3.00, 5.50],
  [4, 'screwdriver', 2.50, 3.00]
],
  columns=['Product ID', 'Description', 'Cost to Manufacture', 'Price']
)

# Add columns here
df['Is taxed?'] = 'Yes'

print(df)

+++++++++++++++++++++++++++++++++++++
MODIFYING DATAFRAMES
Adding a Column III

Finally, you can add a new column by performing a function on the existing columns.

import codecademylib
import pandas as pd

df = pd.DataFrame([
  [1, '3 inch screw', 0.5, 0.75],
  [2, '2 inch nail', 0.10, 0.25],
  [3, 'hammer', 3.00, 5.50],
  [4, 'screwdriver', 2.50, 3.00]
],
  columns=['Product ID', 'Description', 'Cost to Manufacture', 'Price']
)

# Add columns here
df['Revenue'] = df.Price - df['Cost to Manufacture']

print(df)

++++++++++++++++++++++++++++++++++++++
MODIFYING DATAFRAMES
Performing Column Operations

We can use the apply function to apply a function to every value in a particular column. 

import codecademylib
from string import lower
import pandas as pd

df = pd.DataFrame([
  ['JOHN SMITH', 'john.smith@gmail.com'],
  ['Jane Doe', 'jdoe@yahoo.com'],
  ['joe schmo', 'joeschmo@hotmail.com']
],
columns=['Name', 'Email'])

# Add columns here
df['Lowercase Name'] = df.Name.apply(lower)

print(df)

++++++++++++++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Reviewing Lambda Function

A lambda function is a way of defining a function in a single line of code. Usually, we would assign them to a variable.

Lambda functions work with all types of variables, not just integers! 

mylambda = lambda x: x[0] + x[-1]
print(mylambda('This is a string'))

+++++++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Reviewing Lambda Function: If Statements
/*
We can make our lambdas more complex by using a modified form of an if statement.

In general, the syntax for an if function in a lambda function is:

lambda x: [OUTCOME IF TRUE] \
    if [CONDITIONAL] \
    else [OUTCOME IF FALSE]
*/

mylambda = lambda x: 'Welcome to BattleCity!'\
                      if x>=13 \
                      else 'You must be over 13' 

print(mylambda(13)) 

+++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Applying a Lambda to a Column

In Pandas, we often use lambda functions to perform complex operations on columns.

import codecademylib
import pandas as pd

df = pd.read_csv('employees.csv')

# Add columns here
get_last_name = lambda x: x.split()[-1]

df['last_name'] = df.name.apply(get_last_name)

print(df)

++++++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Applying a Lambda to a Row

/*we use apply without specifying a single column and add the argument axis=1, the input to our lambda function will be an entire row, not a column. 
To access particular values of the row, we use the syntax row.column_name or row[‘column_name’].

We can create this column using a lambda function and the keyword axis=1:

df['Price with Tax'] = df.apply(lambda row:
     row['Price'] * 1.075
     if row['Is taxed?'] == 'Yes'
     else row['Price'],
     axis=1
)
*/

import codecademylib
import pandas as pd

df = pd.read_csv('employees.csv')

total_earned = lambda row: (row.hourly_wage * 40) + ((row.hourly_wage * 1.5) * (row.hours_worked - 40)) \
	if row.hours_worked > 40 \
  else row.hourly_wage * row.hours_worked
  
df['total_earned'] = df.apply(total_earned, axis = 1)

print(df)

+++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Renaming Columns

/*We can use df.column_name (which tab-completes) rather than df['column_name'] (which takes up extra space).
You can change all of the column names at once by setting the .columns property to a different list.
*/
import codecademylib
import pandas as pd

df = pd.read_csv('imdb.csv')

# Rename columns here
df.columns = ['ID', 'Title', 'Category', 'Year Released', 'Rating']

print(df)

++++++++++++++++++++++++++++++++++

MODIFYING DATAFRAMES
Renaming Columns II

/*
You also can rename individual columns by using the .rename method. 
Pass a dictionary like the one below to the columns keyword argument:

Using rename with only the columns keyword will create a new DataFrame, leaving your original DataFrame unchanged. 
That's why we also passed in the keyword argument inplace=True. 
Using inplace=True lets us edit the original DataFrame.

There are several reasons why .rename is preferable to .columns:

You can rename just one column
You can be specific about which column names are getting changed (with .column you can accidentally switch column names if you're not careful)
Note: If you misspell one of the original column names, this command won't fail. It just won't change anything.*/

import codecademylib
import pandas as pd

df = pd.read_csv('imdb.csv')

# Rename columns here
df.rename(columns={'name': 'movie_title'},inplace=True)

print(df)

++++++++++++++++++++++++++++++++
MODIFYING DATAFRAMES
Review

import codecademylib
import pandas as pd

orders = pd.read_csv('shoefly.csv')

print(orders.head(5))

orders['shoe_source'] = orders.shoe_material.apply(lambda x: \
                        	'animal' if x == 'leather'else 'vegan')

orders['salutation'] = orders.apply(lambda row: \
                                    'Dear Mr. ' + row['last_name']
                                    if row['gender'] == 'male'
                                    else 'Dear Ms. ' + row['last_name'],
                                    axis=1)
print(orders.head(5))

----------------------------------------------------------------

AGGREGATES IN PANDAS
Calculating Column Statistics

/*In the previous lesson, you learned how to perform operations on each value in a column using apply.

In this exercise, you will learn how to combine all of the values from a column for a single calculation.

The general syntax for these calculations is:

df.column_name.command()
The following table summarizes some common commands:

Command	Description
mean	Average of all values in column
std	Standard deviation
median	Median
max	Maximum value in column
min	Minimum value in column
count	Number of values in column
nunique	Number of unique values in column
unique	List of unique values in column*/

import codecademylib
import pandas as pd

orders = pd.read_csv('orders.csv')

#examine the first 10 rows 
print(orders.head(10))

#the most expensive pair of shoes purchased
most_expensive = orders.price.max()

#how many different colors of shoes we are selling. Save your answer to the variable num_colors
num_colors = orders.shoe_color.nunique()

++++++++++++++++++++++++++++++++++++++++++++++

AGGREGATES IN PANDAS
Calculating Aggregate Functions I

/*When we have a bunch of data, we often want to calculate aggregate statistics 
(mean, standard deviation, median, percentiles, etc.) over certain subsets of the data.

We want to get an average grade for each student across all assignments. 
We could do some sort of loop, but Pandas gives us a much easier option: the method .groupby.

For this example, we'd use the following command:

grades = df.groupby('student').grade.mean()

In general, we use the following syntax to calculate aggregates:

df.groupby('column1').column2.measurement()
where:

column1 is the column that we want to group by ('student' in our example)
column2 is the column that we want to perform a measurement on (grade in our example)
measurement is the measurement function we want to apply (mean in our example)*/

import codecademylib
import pandas as pd

orders = pd.read_csv('orders.csv')

#The most expensive shoe for each shoe_type
pricey_shoes = orders.groupby('shoe_type').price.max()
print(type(pricey_shoes)) #<class 'pandas.core.series.Series'>

++++++++++++++++++++++++++++++++++++++++

AGGREGATES IN PANDAS
Calculating Aggregate Functions II

/*After using groupby, we often need to clean our resulting data.

As we saw in the previous exercise, the groupby function creates a new Series, not a DataFrame. 
For our ShoeFly.com example, the indices of the Series were different values of shoe_type, 
and the name property was price.

Usually, we'd prefer that those indices were actually a column. In order to get that, we can use reset_index(). 
This will transform our Series into a DataFrame and move the indices into their own column.

Generally, you'll always see a groupby statement followed by reset_index:

df.groupby('column1').column2.measurement()
    .reset_index()

When we use groupby, we often want to rename the column we get as a result.
teas_counts = teas_counts.rename(columns={"id": "counts"})*/    

import codecademylib
import pandas as pd

orders = pd.read_csv('orders.csv')

#change pricey_shoes into a DataFrame
pricey_shoes = orders.groupby('shoe_type').price.max().reset_index()
print(type(pricey_shoes)) #<class 'pandas.core.frame.DataFrame'>

+++++++++++++++++++++++++++++++++++++++++++
AGGREGATES IN PANDAS
Calculating Aggregate Functions III

/*Sometimes, the operation that you want to perform is more complicated than mean or count. 
In those cases, you can use the apply method and lambda functions, just like we did for individual column operations. Note that the input to our lambda function will always be a list of values.

A great example of this is calculating percentiles.
If we want to calculate the 75th percentile (i.e., the point at which 75% of employees have a lower wage and 25% have a higher wage) for each category, we can use the following combination of apply and a lambda function:

# np.percentile can calculate any percentile over an array of values
high_earners = df.groupby('category').wage
    .apply(lambda x: np.percentile(x, 75))
    .reset_index()
*/

import codecademylib
import numpy as np
import pandas as pd

orders = pd.read_csv('orders.csv')

#let's calculate 25th percentile for shoe price for each shoe_color (the point at which 25% of each shoe_color have lower price and 75% have a higher price)
cheap_shoes = orders.groupby('shoe_color').price.apply(lambda x: np.percentile(x, 25)).reset_index()
print(cheap_shoes)

+++++++++++++++++++++++++++++++++++

AGGREGATES IN PANDAS
Calculating Aggregate Functions IV

/*Sometimes, we want to group by more than one column. 
We can easily do this by passing a list of column names into the groupby method.

Imagine that we run a chain of stores and have data about the number of sales at different locations on different days:
We suspect that sales are different at different locations on different days of the week. In order to test this hypothesis, we could calculate the average sales for each store on each day of the week across multiple months. The code would look like this:

df.groupby(['Location', 'Day of Week'])['Total Sales'].mean().reset_index()*/

import codecademylib
import numpy as np
import pandas as pd

orders = pd.read_csv('orders.csv')

#create a DataFrame with the total number of shoes of each shoe_type/shoe_color combination purchased.
#When we're using count(), it doesn't really matter which column we perform the calculation on. You should use id in this example, but we would get the same answer if we used shoe_type of last_name
shoe_counts = orders.groupby(['shoe_type', 'shoe_color'])['id'].count().reset_index()
print(shoe_counts)

++++++++++++++++++++++++++++++++++
AGGREGATES IN PANDAS
Pivot Tables

/*When we perform a groupby across multiple columns, we often want to change how our data is stored. 
In order to test our hypothesis, it would be more useful if the table was formatted like this:

Location	    M	Tu	W	Th	F	Sa	Su
Chelsea	        400	390	250	275	300	150	175
West Village	300	310	350	400	390	250	200

Reorganizing a table in this way is called pivoting. The new table is called a pivot table.

In Pandas, the command for pivot is:

df.pivot(columns='ColumnToPivot',
         index='ColumnToBeRows',
         values='ColumnToBeValues')


For our specific example, we would write the command like this:

# First use the groupby statement:
unpivoted = df.groupby(['Location', 'Day of Week'])['Total Sales'].mean().reset_index()
# Now pivot the table
pivoted = unpivoted.pivot(
    columns='Day of Week',
    index='Location',
    values='Total Sales')
Just like with groupby, the output of a pivot command is a new DataFrame, 
but the indexing tends to be "weird", so we usually follow up with .reset_index().*/

import codecademylib
import numpy as np
import pandas as pd

orders = pd.read_csv('orders.csv')
shoe_counts = orders.groupby(['shoe_type', 'shoe_color']).id.count().reset_index()
#make it easier for her to compare purchases of different shoe colors of the same shoe type by creating a pivot table
shoe_counts_pivot = shoe_counts.pivot(
     columns = 'shoe_color',
     index = 'shoe_type',
     values = 'id'
).reset_index()
print(shoe_counts_pivot)


+++++++++++++++++++++++++++++++++++
AGGREGATES IN PANDAS
Review


import codecademylib
import pandas as pd

user_visits = pd.read_csv('page_visits.csv')
print(user_visits.head())

#use a groupby statement to calculate how many visits came from each of the different source
click_source = user_visits.groupby('utm_source').id.count().reset_index()
print(click_source)

#use groupby to calculate the number of visits to our site from each utm_source for each month.
click_source_by_month = user_visits.groupby(['utm_source', 'month']).id.count().reset_index()

#Use pivot to create a pivot table where the rows are utm_source and the columns are month
click_source_by_month_pivot = click_source_by_month.pivot(
       columns = 'month',
       index = 'utm_source',
       values = 'id'
).reset_index()
print(click_source_by_month_pivot)
