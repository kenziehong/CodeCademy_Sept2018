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

When we conduct a hypothesis test, we want to first create a null hypothesis,
 which is a prediction that there is no significant difference. 

The null hypothesis that this test examines can be phrased as such: 
"The set of samples belongs to a population with the target mean".

if we receive a p-value of less than 0.05, we can reject the null hypothesis and 
state that there is a significant difference.
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

For a p-value of 0.05, if the null hypothesis is true then the probability of obtaining a significant result 
is 1 – 0.05 = 0.95. 
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

/*When comparing more than two numerical datasets, the best way to preserve a Type I error probability of 0.05 
is to use ANOVA

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

It will return a table of information, telling you whether or not to reject the null hypothesis 
for each pair of datasets.*/


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

/*So far, we have been working with numerical datasets. The tests we have looked at, the 1- and 2-Sample T-Tests,
 ANOVA, and Tukey's Range test, will not work if we can't find the means of our distributions and compare them.

If we have a dataset where the entries are not numbers, but categories instead, we have to use different methods.

To analyze a dataset like this, with two different possibilities for entries, we can use a Binomial Test. 
A Binomial Test compares a categorical dataset to some expectation.

SciPy has a function called binom_test, which performs a Binomial Test for you.

binom_test requires three inputs, the number of observed successes, the number of total trials, 
and an expected probability of success
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

-------------------------------------------------------------------------------

5/12/2018

LINE GRAPHS IN MATPLOTLIB
Basic Line Plot

/*Line graphs are helpful for visualizing how a variable changes over time.

x_values = [0, 1, 2, 3, 4]
y_values = [0, 1, 4, 9, 16]
plt.plot(x_values, y_values)
plt.show()

x_values is a variable holding a list of x-values for each point on our line graph
y_values is a variable holding a list of y-values for each point on our line graph
plt is the name we have given to the Matplotlib module we have imported at the top of the code
plt.plot(x_values, y_values) will create the line graph
plt.show() will actually display the graph*/

import codecademylib
from matplotlib import pyplot as plt

days = [0, 1, 2, 3, 4, 5, 6]
money_spent = [10, 12, 12, 10, 14, 22, 24]

#plot days on the x-axis and money_spent on the y-axis 
plt.plot(days, money_spent)
plt.show()

++++++++++++++++++++++++++++++++++++++

LINE GRAPHS IN MATPLOTLIB
Basic Line Plot II

/*We can also have multiple line plots displayed on the same set of axes. 
This can be very useful if we want to compare two datasets with the same scale and axis categories.
*/
import codecademylib
from matplotlib import pyplot as plt

time = [0, 1, 2, 3, 4]
revenue = [200, 400, 650, 800, 850]
costs = [150, 500, 550, 550, 560]

plt.plot(time, revenue)
plt.plot(time, costs)
plt.show()

++++++++++++++++++++++++++++++++++++++

LINE GRAPHS IN MATPLOTLIB
Linestyles

/*We can specify a different color for a line by using the keyword color with either an HTML color name or a HEX code:
We can also change make a line dotted or dashed using the keyword linestyle (--,:, ' ')
We can also add a marker using the keyword marker (o, s, *)
*/
import codecademylib
from matplotlib import pyplot as plt

time = [0, 1, 2, 3, 4]
revenue = [200, 400, 650, 800, 850]
costs = [150, 500, 550, 550, 560]
plt.plot(time, revenue, color = 'purple', linestyle = '--')
plt.plot(time, costs, color = '#82edc9', marker = 's')
plt.show()

++++++++++++++++++++++++++++++++++++++
LINE GRAPHS IN MATPLOTLIB
Axis and Labels

/*Sometimes, it can be helpful to zoom in or out of the plot, 
especially if there is some detail we want to address. 
To zoom, we can use plt.axis(). We use plt.axis() by feeding it a list as input. This list should contain:

The minimum x-value displayed
The maximum x-value displayed
The minimum y-value displayed
The maximum y-value displayed*/

import codecademylib
from matplotlib import pyplot as plt

x = range(12)
y = [3000, 3005, 3010, 2900, 2950, 3050, 3000, 3100, 2980, 2980, 2920, 3010]
plt.plot(x, y)

#modify the axes 
plt.axis([0,12,2900,3100])

plt.show()

+++++++++++++++++++++++++++++++++
LINE GRAPHS IN MATPLOTLIB
Labeling the Axes

/*Eventually, we will want to show these plots to other people to convince them of important trends in our data. 
When we do that, we’ll want to make our plots look as professional as possible.

We can label the x- and y- axes by using plt.xlabel() and plt.ylabel(). The plot title can be set by using plt.title().

All of these commands require a string, which is a set of characters in either single (') or double (") quotes.
*/
import codecademylib
from matplotlib import pyplot as plt

x = range(12)
y = [3000, 3005, 3010, 2900, 2950, 3050, 3000, 3100, 2980, 2980, 2920, 3010]
plt.plot(x, y)
plt.axis([0, 12, 2900, 3100])

plt.xlabel('Time')
plt.ylabel('Dollars spent on coffee')
plt.title('My Last Twelve Years of Coffee Drinking')

plt.show()

+++++++++++++++++++++++++++++

LINE GRAPHS IN MATPLOTLIB
Subplots

/*Sometimes, we want to display two lines side-by-side, rather than in the same set of x- and y-axes. 
When we have multiple axes in the same picture, we call each set of axes a subplot. 
The picture or object that contains all of the subplots is called a figure.

We can create subplots using .subplot().

The command plt.subplot() needs three arguments to be passed into it:

The number of rows of subplots
The number of columns of subplots
The index of the subplot we want to create

Any plt.plot() that comes after plt.subplot() will create a line plot in the specified subplot. */

import codecademylib
from matplotlib import pyplot as plt

months = range(12)
temperature = [36, 36, 39, 52, 61, 72, 77, 75, 68, 57, 48, 48]
flights_to_hawaii = [1200, 1300, 1100, 1450, 850, 750, 400, 450, 400, 860, 990, 1000]

plt.subplot(1,2,1)
plt.plot(months, temperature)
plt.subplot(1,2,2)
plt.plot(temperature, flights_to_hawaii, 'o')
plt.show()

++++++++++++++++++++++++++++++++

LINE GRAPHS IN MATPLOTLIB
Subplots Part II

/*Sometimes, when we're putting multiple subplots together, some elements can overlap and make the figure unreadable

We can customize the spacing between our subplots to make sure that the figure we create is visible and easy to understand.
To do this, we use the plt.subplots_adjust() command. .subplots_adjust() has some keyword arguments that can move your plots within the figure:

left — the left-side margin, with a default of 0.125. You can increase this number to make room for a y-axis label
right — the right-side margin, with a default of 0.9. You can increase this to make more room for the figure, or decrease it to make room for a legend
bottom — the bottom margin, with a default of 0.1. You can increase this to make room for tick mark labels or an x-axis label
top — the top margin, with a default of 0.9
wspace — the horizontal space between adjacent subplots, with a default of 0.2
hspace — the vertical space between adjacent subplots, with a default of 0.2*/

import codecademylib
from matplotlib import pyplot as plt

x = range(7)
straight_line = [0, 1, 2, 3, 4, 5, 6]
parabola = [0, 1, 4, 9, 16, 25, 36]
cubic = [0, 1, 8, 27, 64, 125, 216]

plt.subplot(2,1,1)
plt.plot(x,straight_line)

plt.subplot(2,2,3)
plt.plot(x, parabola)

plt.subplot(2,2,4)
plt.plot(x, cubic)

plt.subplots_adjust(wspace = 0.35, bottom = 0.2)
plt.show()

+++++++++++++++++++++++++++++++++++++++

LINE GRAPHS IN MATPLOTLIB
Legends

/*When we have multiple lines on a single graph we can label them by using the command plt.legend().

The legend method takes a list with the labels to display.

plt.legend() can also take a keyword argument loc, which will position the legend on the figure.

These are the position values loc accepts:

Number Code	String
0	best
1	upper right
2	upper left
3	lower left
4	lower right
5	right
6	center left
7	center right
8	lower center
9	upper center
10	center
Note: If you decide not to set a value for loc, it will default to choosing the "best" location.

Sometimes, it's easier to label each line as we create it. If we want, we can use the keyword label inside of plt.plot(). 
If we choose to do this, we don't pass any labels into plt.legend(). */

import codecademylib
from matplotlib import pyplot as plt

months = range(12)
hyrule = [63, 65, 68, 70, 72, 72, 73, 74, 71, 70, 68, 64]
kakariko = [52, 52, 53, 68, 73, 74, 74, 76, 71, 62, 58, 54]
gerudo = [98, 99, 99, 100, 99, 100, 98, 101, 101, 97, 98, 99]

plt.plot(months, hyrule)
plt.plot(months, kakariko)
plt.plot(months, gerudo)

#create your legend here
legend_labels = ['Hyrule', 'Kakariko', 'Gerudo Valley']
plt.legend(legend_labels, loc = 8)

plt.show()

++++++++++++++++++++++++++
LINE GRAPHS IN MATPLOTLIB
Modify Ticks

/*In all of our previous exercises, our commands have started with plt..
In order to modify tick marks, we'll have to try something a little bit different.

Because our plots can have multiple subplots, we have to specify which one we want to modify. 
In order to do that, we call plt.subplot() in a different way.

ax = plt.subplot(1, 1, 1)
ax is an axes object, and it lets us modify the axes belonging to a specific subplot. Even if we only have one subplot, when we want to modify the ticks, we will need to start by calling either ax = plt.subplot(1, 1, 1) or ax = plt.subplot() in order to get our axes object.

Suppose we wanted to set our x-ticks to be at 1, 2, and 4. We would use the following code:

ax = plt.subplot()
plt.plot([0, 1, 2, 3, 4], [0, 1, 4, 9, 16])
plt.plot([0, 1, 2, 3, 4], [0, 1, 8, 27, 64])
ax.set_xticks([1, 2, 4])

We can also modify the y-ticks by using ax.set_yticks().

When we change the x-ticks, their labels automatically change to match. 
But, if we want special labels (such as strings), we can use the command ax.set_xticklabels() or ax.set_yticklabels(). For example, we might want to have a y-axis with ticks at 0.1, 0.6, and 0.8, but label them 10%, 60%, and 80%, respectively. To do this, we use the following commands:

ax = plt.subplot()
plt.plot([1, 3, 3.5], [0.1, 0.6, 0.8], 'o')
ax.set_yticks([0.1, 0.6, 0.8])
ax.set_yticklabels(['10%', '60%', '80%'])*/


import codecademylib
from matplotlib import pyplot as plt

month_names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep","Oct", "Nov", "Dec"]

months = range(12)
conversion = [0.05, 0.08, 0.18, 0.28, 0.4, 0.66, 0.74, 0.78, 0.8, 0.81, 0.85, 0.85]

plt.xlabel("Months")
plt.ylabel("Conversion")

plt.plot(months, conversion)

# Save the set of axes in a variable called ax
ax = plt.subplot()

#Set the x-ticks to be the months list
ax.set_xticks(months)

#Set the x-ticks labels to be the month_names list
ax.set_xticklabels(month_names)

ax.set_yticks([0.10, 0.25, 0.5, 0.75])
ax.set_yticklabels(["10%", "25%", "50%", "75%"])

plt.show()

+++++++++++++++++++++++++++++++++++++++
LINE GRAPHS IN MATPLOTLIB
Figures

/*When we're making lots of plots, it's easy to end up with lines that have been plotted and not displayed. 
If we’re not careful, these "forgotten" lines will show up in your new plots. 
In order to be sure that you don't have any stray lines, you can use the command plt.close('all') 
to clear all existing plots before you plot a new one.

Previously, we learned how to put two sets of axes into the same figure. 
Sometimes, we would rather have two separate figures. 
We can use the command plt.figure() to create new figures and size them how we want. 
We can add the keyword figsize=(width, height) to set the size of the figure, in inches. 
We use parentheses (( and )) to pass in the width and height, which are separated by a comma (,).

To create a figure with a width of 4 inches, and height of 10 inches, we would use:

plt.figure(figsize=(4, 10))

Once we've created a figure, we might want to save it so that we can use it in a presentation or a website. 
We can use the command plt.savefig() to save out to many different file formats, such as png, svg, or pdf. 
After plotting, we can call plt.savefig('name_of_graph.png')
# Figure 2
plt.figure(figsize=(4, 10)) 
plt.plot(x, parabola)
plt.savefig('tall_and_narrow.png')*/

import codecademylib
from matplotlib import pyplot as plt

word_length = [8, 11, 12, 11, 13, 12, 9, 9, 7, 9]
power_generated = [753.9, 768.8, 780.1, 763.7, 788.5, 782, 787.2, 806.4, 806.2, 798.9]
years = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009]

#close all plots to make sure we have no lines already plotted that we've forgotton about
plt.close('all')

#Create a figure and plot word_length against years
plt.plot(years, word_length)
plt.savefig('winning_word_lengths.png')

#create a figure with 7 inches of width and 3 inches of height and plot power_generated against years
plt.figure(figsize=(7, 3)) 
plt.plot(years, power_generated)
plt.savefig('power_generated.png')

+++++++++++++++++++++++++++++++++++++++++++++++++
LINE GRAPHS IN MATPLOTLIB
Review

import codecademylib
from matplotlib import pyplot as plt

x = range(5)
y1 = range(2,7)
y2 = range(4,9)

plt.plot(x,y1, color = 'pink', marker ='o')
plt.plot(x,y2, color = 'gray', marker ='o')

plt.title("Two Lines on One Graph")
plt.xlabel("Amazing X-axis")
plt.ylabel("Incredible Y-axis")
plt.legend(["label_1", "label_2"], loc=4)

plt.show()

-------------------------------------------------------------
6/12/2018

DIFFERENT PLOT TYPES
Simple Bar Chart

T/*he plt.bar function allows you to create simple bar charts to compare multiple categories of data.

You call plt.bar with two arguments:

the x-values — a list of x-positions for each bar
the y-values — a list of heights for each bar*/

import codecademylib
from matplotlib import pyplot as plt

drinks = ["cappuccino", "latte", "chai", "americano", "mocha", "espresso"]
sales =  [91, 76, 56, 66, 52, 27]
plt.bar(range(len(drinks)), sales)
plt.show()

+++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Simple Bar Chart II

/*When we create a bar chart, we want each bar to be meaningful and correspond to a category of data.
In the previous lesson, we learned how to customize the tick marks on the x-axis in three steps:

1.Create an axes object
ax = plt.subplot()
2.Set the x-tick positions using a list of numbers
ax.set_xticks([0, 1, 2, 3, 4, 5, 6, 7, 8])
3.Set the x-tick labels using a list of strings
ax.set_xticklabels(['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune', 'Pluto'])
4.If your labels are particularly long, you can use the rotation keyword to rotate your labels by 
a specified number of degrees:
ax.set_xticklabels(['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune', 'Pluto'],
rotation=30)

Note: We have to set the x-ticks before we set the x-labels 
because the default ticks won’t necessarily be one tick per bar, 
especially if we’re plotting a lot of bars. If we skip setting the x-ticks before the x-labels, 
we might end up with labels in the wrong place.

Remember from Lesson I that we can label the x-axis (plt.xlabel) and y-axis (plt.ylabel) as well. 
Now, our graph is much easier to understand*/

import codecademylib
from matplotlib import pyplot as plt

drinks = ["cappuccino", "latte", "chai", "americano", "mocha", "espresso"]
sales =  [91, 76, 56, 66, 52, 27]

plt.bar(range(len(drinks)), sales)

#create your ax object here
ax = plt.subplot()
ax.set_xticks(range(len(drinks)))
ax.set_xticklabels(drinks, rotation=30)

plt.show()

++++++++++++++++++++++++++++++++++++++++++++
DIFFERENT PLOT TYPES
Side-By-Side Bars

/*We can use a bar chart to compare two sets of data with the same types of axis values. 
To do this, we plot two sets of bars next to each other, so that the values of each category can be compared
*/
import codecademylib
from matplotlib import pyplot as plt

drinks = ["cappuccino", "latte", "chai", "americano", "mocha", "espresso"]
sales1 =  [91, 76, 56, 66, 52, 27]
sales2 = [65, 82, 36, 68, 38, 40]

n = 1 # This is our first dataset (out of 2) 
t = 2 # Number of datasets 
d = len(drinks) # Number of sets of bars 
w = 0.8 # Width of each bar 
store1_x = [t*element + w*n for element in range(d)]
plt.bar(store1_x,sales1)

n = 2  # This is our second dataset (out of 2)
t = 2 # Number of datasets
d = len(drinks) # Number of sets of bars
w = 0.8 # Width of each bar
store2_x = [t*element + w*n for element
             in range(d)]
plt.bar(store2_x, sales2)

plt.show()

+++++++++++++++++++++++++++++++++++++++
DIFFERENT PLOT TYPES
Stacked Bars

/*If we want to compare two sets of data while preserving knowledge of the total between them, 
we can also stack the bars instead of putting them side by side.
We do this by using the keyword bottom. */

import codecademylib
from matplotlib import pyplot as plt

drinks = ["cappuccino", "latte", "chai", "americano", "mocha", "espresso"]
sales1 =  [91, 76, 56, 66, 52, 27]
sales2 = [65, 82, 36, 68, 38, 40]
  
plt.bar(range(len(drinks)), sales1)
plt.bar(range(len(drinks)), sales2, bottom=sales1)

plt.legend(["Location 1", "Location 2"])

plt.show()

++++++++++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Error Bars
/*
In the previous exercise, you learned to represent data as bars of different heights.
 Sometimes, we need to visually communicate some sort of uncertainty in the heights of those bars.

 To display error visually in a bar chart, we often use error bars 
 to show where each bar could be, taking errors into account.

 Each of the black lines is called an error bar. 
 The taller the bar is, the more uncertain we are about the height of the blue bar. 
 The horizontal lines at the top and bottom are called caps. They make it easier to read the error bars.
 */

 import codecademylib
from matplotlib import pyplot as plt

drinks = ["cappuccino", "latte", "chai", "americano", "mocha", "espresso"]
ounces_of_milk = [6, 9, 4, 0, 9, 0]
error = [0.6, 0.9, 0.4, 0, 0.9, 0]

# Plot the bar graph here
plt.bar(range(len(drinks)), ounces_of_milk, yerr= error, capsize=5)

plt.show()

+++++++++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Fill Between

/*We’ve learned how to display errors on bar charts using error bars. 
Let’s take a look at how we might do this in an aesthetically pleasing way on line graphs. 
In Matplotlib, we can use plt.fill_between to shade error. This function takes three arguments:

x-values — this works just like the x-values of plt.plot
lower-bound for y-values — sets the bottom of the shared area
upper-bound for y-values — sets the top of the shared area

Generally, we use fill_between to create a shaded error region, and then plot the actual line over it. 
We can set the alpha keyword to a value between 0 and 1 
in the fill_between call for transparency so that we can see the line underneath. */


import codecademylib
from matplotlib import pyplot as plt

months = range(12)
month_names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
revenue = [16000, 14000, 17500, 19500, 21500, 21500, 22000, 23000, 20000, 19500, 18000, 16500]

#plot these revenues against months as a line
plt.plot(months,revenue)

#make an axis object, store it in the variable ax, and then use it to set the x-ticks to months and x-axis tick labels to be the months of the year, given to you in the varibale month_names
ax = plt.subplot()
ax.set_xticks(months)
ax.set_xticklabels(month_names)

#Create a list containing the lower bound of the expected revenue for each month, and call it y_lower
y_lower =[el - 0.1*el for el in revenue]
y_upper = [el + 0.1*el for el in revenue]

#Use fill_between to shade the error above and below the line we've plotted, with an alpha of 0.2
plt.fill_between(months, y_lower, y_upper, alpha = 0.2 )

plt.show()

+++++++++++++++++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Pie Chart

#If we want to display elements of a data set as proportions of a whole, we can use a pie chart.

import codecademylib
from matplotlib import pyplot as plt
import numpy as np

payment_method_names = ["Card Swipe", "Cash", "Apple Pay", "Other"]
payment_method_freqs = [270, 77, 32, 11]

#display the payment_method_freqs list as a pie chart
plt.pie(payment_method_freqs)

#set the axes to be equal
plt.axis('equal')

plt.show()

+++++++++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Pie Chart Labeling

/*We also want to be able to understand what each slice of the pie represents. To do this, we can either:
1.use a legend to label each color, or
2.put labels on the chart itself.

One other useful labeling tool for pie charts is adding the percentage of the total that each slice occupies. 

'%0.2f' — 2 decimal places, like 4.08
'%0.2f%%' — 2 decimal places, but with a percent sign at the end, like 4.08%. You need two consecutive percent signs because the first one acts as an escape character, so that the second one gets displayed on the chart.
'%d%%' — rounded to the nearest int and with a percent sign at the end, like 4%.

*/

import codecademylib
from matplotlib import pyplot as plt

payment_method_names = ["Card Swipe", "Cash", "Apple Pay", "Other"]
payment_method_freqs = [270, 77, 32, 11]

plt.pie(payment_method_freqs, labels = payment_method_names, autopct ='%0.1f%%')
plt.axis('equal')

#Add a legend to the chart you made in the previous exercise by passing in a list of labels to plt.legend. For the labels, use the list payment_method_names
plt.legend(payment_method_names)

#Add a percentage to each slice using autopct parameter. Go to one decimal point of precision

plt.show()

++++++++++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Histogram

/*Sometimes we want to get a feel for a large dataset with many samples 
beyond knowing just the basic metrics of mean, median, or standard deviation. 
To get more of an intuitive sense for a dataset, we can use a histogram to display all the values.

A histogram tells us how many values in a dataset fall between different sets of numbers 
(i.e., how many numbers fall between 0 and 10? Between 10 and 20? Between 20 and 30?). 
Each of these questions represents a bin, for instance, our first bin might be between 0 and 10.

All bins in a histogram are always the same size. The width of each bin is the distance 
between the minimum and maximum values of each bin. In our example, the width of each bin would be 10.

Each bin is represented by a different rectangle whose height is the number of elements from the dataset 
that fall within that bin.

To make a histogram in Matplotlib, we use the command plt.hist. plt.hist finds the minimum and the maximum values 
in your dataset and creates 10 equally-spaced bins between those values.

The histogram above, for example, was created with the following code:

plt.hist(dataset) 
plt.show()
If we want more than 10 bins, we can use the keyword bins to set how many bins we want to divide the data into. 
The keyword range selects the minimum and maximum values to plot.
 For example, if we wanted to take our data from the last example and make a new histogram that 
 just displayed the values from 66 to 69, divided into 40 bins (instead of 10), we could use this function call:

plt.hist(dataset, range=(66,69), bins=40)

Histograms are best for showing the shape of a dataset. 
For example, you might see that values are close together, or skewed to one side. 
With this added intuition, we often discover other types of analysis we want to perform.*/

import codecademylib
from matplotlib import pyplot as plt
from script import sales_times

#make a histogram out of this data
#Use the bins keyword to create 20 bins instead of the default 10.
plt.hist(sales_times, bins=20)

plt.show()

+++++++++++++++++++++++++++++++++

DIFFERENT PLOT TYPES
Multiple Histograms

/*If we want to compare two different distributions, we can put multiple histograms on the same plot. 
However, it can be hard to read two histograms on top of each other. 

We have two ways we can solve a problem like this:

1.use the keyword "alpha", which can be a value between 0 and 1. This sets the transparency of the histogram.
A value of 0 would make the bars entirely transparent. A value of 1 would make the bars completely opaque.

2.use the keyword "histtype" with the argument 'step' to draw just the outline of a histogram:

Another problem we face is that our histograms might have different numbers of samples, making one much bigger than the other

To solve this, we can normalize our histograms using normed=True. This command divides the height of each column by 
a constant such that the total shaded area of the histogram sums to 1.
*/

import codecademylib
from matplotlib import pyplot as plt
from script import sales_times1
from script import sales_times2


#Modify the transparency value of both histograms to be 0.4 so that we can see the separate histograms better.

#Normalize both the histograms so that we can compare the patterns between them despite the differences in sample size.

plt.hist(sales_times1, bins=20, alpha=0.4, normed=True)

plt.hist(sales_times2, bins=20, alpha=0.4, normed=True)



plt.show()

--------------------------------------------------------

8/12/2018

LEARN SEABORN INTRODUCTION
Introduction to Seaborn

/*Seaborn is a Python data visualization library that provides simple code to 
create elegant visualizations for statistical exploration and insight. 
Seaborn is based on Matplotlib, but improves on Matplotlib in several ways:

1.Seaborn provides a more visually appealing plotting style and concise syntax.
2.Seaborn natively understands Pandas DataFrames, making it easier to plot data directly from CSVs.
3.Seaborn can easily summarize Pandas DataFrames with many rows of data into aggregated charts.
*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt

# Paste import here:
import seaborn as sns

df = pd.read_csv('survey.csv')
sns.barplot(x='Age Range', y='Response', hue='Gender', data=df)
plt.show()

++++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Using Pandas For Seaborn

/*Throughout this lesson, you'll use Seaborn to visualize a Pandas DataFrame.

DataFrames contain data structured into rows and columns. 
DataFrames look similar to other data tables you may be familiar with, 
but they are designed specifically to be used with Python.

You can create a DataFrame from a local CSV file (CSV files store data in a tabular format).

To create a DataFrame from a local CSV file you would use the syntax:

df = pd.read_csv('file_name.csv')
The code above creates a DataFrame saved to a variable named df. 
The data inside of the df DataFrame comes from the data in the local CSV file named file_name.csv.

Once you have prepared and organized a Pandas DataFrame with your chosen dataset, 
you are ready to plot with Seaborn!*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns


df = pd.read_csv('survey.csv')
print(df.head())

++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Plotting Bars with Seaborn

/*To plot this data using Matplotlib, you would write the following:

df = pd.read_csv("results.csv")
ax = plt.subplot()
plt.bar(range(len(df)),
        df["Mean Satisfaction"])
ax.set_xticks(range(len(df)))
ax.set_xticklabels(df.Gender)
plt.xlabel("Gender")
plt.ylabel("Mean Satisfaction")

That's a lot of work for a simple bar chart! Seaborn gives us a much simpler option. 
With Seaborn, you can use the sns.barplot() command to do the same thing.

The Seaborn function sns.barplot(), takes at least three keyword arguments:

1.data: a Pandas DataFrame that contains the data (in this example, data=df)
2.x: a string that tells Seaborn which column in the DataFrame contains otheur x-labels (in this case, x="Gender")
3.y: a string that tells Seaborn which column in the DataFrame contains the heights we want to plot 
for each bar (in this case y="Mean Satisfaction")*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns

# Use Pandas to load in the data from results.csv and save it to the variable df.
df =pd.read_csv("results.csv")

#Display df using print
print(df)

#3.Remove all of the # characters from in front of the sns.barplot command and fill in the missing values.
sns.barplot(
	data= df,
	x= "Gender",
	y= "Mean Satisfaction"
)

#4.Type plt.show() to display the completed bar plot.
plt.show()

+++++++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Understanding Aggregates

/*Seaborn can also calculate aggregate statistics for large datasets. 
To understand why this is helpful, we must first understand what an aggregate is.

An aggregate statistic, or aggregate, is a single number used to describe a set of data. 
One example of an aggregate is the average, or mean of a data set. 
There are many other aggregate statistics as well.

In Python, you can compute aggregates fairly quickly and easily using Numpy, a popular Python library for computing. 
You'll use Numpy in this exercise to compute aggregates for a DataFrame.*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt
#1.To calculate aggregates using Numpy, you'll first need to import the Numpy library at the top of script.py.
import numpy as np

gradebook = pd.read_csv("gradebook.csv")

#2. take a minute to understand the data you'll analyze
print(gradebook)

#3.Select all rows from the gradebook DataFrame where assignment_name is equal to Assignment 1. Save the result to the variable assignment1.
assignment1 = gradebook[gradebook.assignment_name == "Assignment 1"]

#4.Check out the DataFrame you just created. Print assignment1.
print(assignment1)

#5. Use np.median() to calculate the median of the column grade from assignment1 and save it to asn1_median.
asn1_median = np.median(assignment1.grade)
print(asn1_median)

++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Plotting Aggregates

/*Suppose this data is stored in a Pandas DataFrame called df.

The same Seaborn command that you previously learned (sns.barplot()) will plot this data in a bar plot 
and automatically aggregate the data:

sns.barplot(data=df, x="student", y="grade")
In the example above, Seaborn will aggregate grades by student, and plot the average grade for each student.*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns

gradebook = pd.read_csv("gradebook.csv")

#1.Use Seaborn to plot the average grade for each assignment.
sns.barplot(data=gradebook, x="assignment_name", y="grade")

#2.Use plt.show() to display the graph.
plt.show()

++++++++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Modifying Error Bars

/*By default, Seaborn will place error bars on each bar when you use the barplot() function.

Error bars are the small lines that extend above and below the top of each bar. 
Errors bars visually indicate the range of values that might be expected for that bar.

There are several different calculations that are commonly used to determine error bars.

By default, Seaborn uses something called a bootstrapped confidence interval. 
Roughly speaking, 
this interval means that "based on this data, 95% of similar situations would have an outcome within this range".

In our gradebook example, the confidence interval for the assignments means 
"if we gave this assignment to many, many students,
 we're confident that the mean score on the assignment would be within the range represented by the error bar".

The confidence interval is a nice error bar measurement because it is defined for different types of 
aggregate functions, such as medians and mode, in addition to means.

If you're calculating a mean and would prefer to use standard deviation for your error bars, 
you can pass in the keyword argument ci="sd" to sns.barplot() 
which will represent one standard deviation.*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns

gradebook = pd.read_csv("gradebook.csv")

#Modify the bar plot so that the error bars represent one standard deviation, rather than 95% confidence intervals.
sns.barplot(data=gradebook,
            x="name",
            y="grade"
            ci = "sd"
           )
plt.show()

++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Calculating Different Aggregates


/*In most cases, we'll want to plot the mean of our data, but sometimes, we'll want something different:

If our data has many outliers, we may want to plot the median.
If our data is categorical, we might want to count how many times each category appears

Seaborn is flexible and can calculate any aggregate you want. 
To do so, you'll need to use the keyword argument "estimator", 
which accepts any function that works on a list.
*/

import codecademylib3_seaborn
import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns

#1.Consider our hospital satisfaction survey data, which is loaded into the Pandas DataFrame df. 
#Use print to examine the data.
df = pd.read_csv("survey.csv")
print(df)

#2.We'd like to know how many men and women answered the survey
#To calculate the number of times a particular value appears in the Response column , we pass in len
sns.barplot(data=df,
            x='Gender',
            y='Response',
            estimator=len)

#4.Change sns.barplot() to graph the median Response aggregated by Gender using estimator=np.median
#sns.barplot(data=df,
#            x='Gender',
#            y='Response',
#           estimator=np.median)

plt.show()

++++++++++++++++++++++++++++++++++++++

LEARN SEABORN INTRODUCTION
Aggregating by Multiple Columns

/*Sometimes we'll want to aggregate our data by multiple columns to visualize nested categorical variables.

For example, consider our hospital survey data. The mean satisfaction seems to depend on Gender,
 but it might also depend on another column: Age Range.

We can compare both the Gender and Age Range factors at once by using the keyword hue.*/

import codecademylib3_seaborn
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns

df = pd.read_csv("survey.csv")
print(df)

sns.barplot(data=df,
           x='Gender',
           y='Response',
           hue='Age Range')
plt.show()

--------------------------------------------------------------+++++++++++++++++++++++++++++++++++

LEARN SEABORN: DISTRIBUTIONS
Bar Charts Hide Information

/*Here is a bar chart that uses three different randomly generated sets of data:
These three datasets look identical! 
As far as we can tell, they each have the same mean and similar confidence intervals.

We can get a lot of information from these bar charts, but we can't get everything. 
For example, what are the minimum and maximum values of these datasets? How spread out is this data?

While we may not see this information in our bar chart, these differences might be significant and worth understanding better.
*/

import codecademylib3_seaborn
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns

# Take in the data from the CSVs as NumPy arrays:
set_one = np.genfromtxt("dataset1.csv", delimiter=",")
set_two = np.genfromtxt("dataset2.csv", delimiter=",")
set_three = np.genfromtxt("dataset3.csv", delimiter=",")
set_four = np.genfromtxt("dataset4.csv", delimiter=",")

# Creating a Pandas DataFrame:
n=500
df = pd.DataFrame({
    "label": ["set_one"] * n + ["set_two"] * n + ["set_three"] * n + ["set_four"] * n,
    "value": np.concatenate([set_one, set_two, set_three, set_four])
})

# Setting styles:
sns.set_style("darkgrid")
sns.set_palette("pastel")

# Add your code below:
#1.We've imported four different datasets using NumPy and have combined them into one DataFrame, df.
#Use sns.barplot() to graph the datasets in one plot, with "label" as the x data and "value" as the y data.
sns.barplot(data=df, x ="label", y="value")
plt.show()

+++++++++++++++++++++++++++++++++++++++++++

LEARN SEABORN: DISTRIBUTIONS
KDE Plots, Part I

/*Bar plots can tell us what the mean of our dataset is, 
but they don't give us any hints as to the distribution of the dataset values. 
For all we know, the data could be clustered around the mean or spread out evenly across the entire range.

To find out more about each of these datasets, we'll need to examine their distributions. 
A common way of doing so is by plotting the data as a histogram, but histograms have their drawback as well.

Seaborn offers another option for graphing distributions: KDE Plots.

KDE stands for Kernel Density Estimator. 
A KDE plot gives us the sense of a univariate as a curve. 
A univariate dataset only has one variable and is also referred to as being one-dimensional, 
as opposed to bivariate or two-dimensional datasets which have two variables.

KDE plots are preferable to histograms because depending on how you group the data into bins and the width of the bins,
you can draw wildly different conclusions about the shape of the data. 
Using a KDE plot can mitigate these issues, because they smooth the datasets, 
allow us to generalize over the shape of our data, and aren't beholden to specific data points.*/

++++++++++++++++++++++++++++++++++++++++++++++

LEARN SEABORN: DISTRIBUTIONS
KDE Plots, Part II
/*
To plot a KDE in Seaborn, we use the method sns.kdeplot().

A KDE plot takes the following arguments:

data - the univariate dataset being visualized, like a Pandas DataFrame, Python list, or NumPy array
shade - a boolean that determines whether or not the space underneath the curve is shaded

Notice that when using a KDE we need to plot each of the original datasets separately, 
rather than using a combined dataframe like we did with the bar plot.

It looks like there are some big differences between the three datasets:

Dataset 1 is skewed left
Dataset 2 is normally distributed
Dataset 3 is bimodal (it has two peaks)

So although all three datasets have roughly the same mean, 
the shapes of the KDE plots demonstrate the differences in how the values are distributed.*/

import codecademylib3_seaborn
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns

# Take in the data from the CSVs as NumPy arrays:
set_one = np.genfromtxt("dataset1.csv", delimiter=",")
set_two = np.genfromtxt("dataset2.csv", delimiter=",")
set_three = np.genfromtxt("dataset3.csv", delimiter=",")
set_four = np.genfromtxt("dataset4.csv", delimiter=",")

# Creating a Pandas DataFrame:
n=500
df = pd.DataFrame({
    "label": ["set_one"] * n + ["set_two"] * n + ["set_three"] * n + ["set_four"] * n,
    "value": np.concatenate([set_one, set_two, set_three, set_four])
})

# Setting styles:
sns.set_style("darkgrid")
sns.set_palette("pastel")

# Add your code below:
#1.Use sns.kdeplot() to graph the four datasets and set shade to True
sns.kdeplot(set_one, shade=True)
sns.kdeplot(set_two, shade=True)
sns.kdeplot(set_three, shade=True)
sns.kdeplot(set_four, shade=True)

plt.show()

++++++++++++++++++++++++++++++++++++++++++

LEARN SEABORN: DISTRIBUTIONS
Box Plots, Part I

/*While a KDE plot can tell us about the shape of the data, it's cumbersome to compare multiple KDE plots at once. 
They also can't tell us other statistical information, like the values of outliers.

The box plot (also known as a box-and-whisker plot) can tell us about how our dataset is distributed, 
like a KDE plot. But it shows us the range of our dataset, gives us an idea about where a significant portion 
of our data lies, and whether or not any outliers are present.

Let's examine how we interpret a box plot:

The box represents the interquartile range
The line in the middle of the box is the median
The end lines are the first and third quartiles
The diamonds show outliers*/

++++++++++++++++++++++++++++++++++++++++

LEARN SEABORN: DISTRIBUTIONS
Box Plots, Part II

-- One advantage of the box plot over the KDE plot is that in Seaborn, it is easy to plot multiples and 
-- compare distributions.

-- Let's look again at our three datasets, and how they look plotted as box plots:

-- sns.boxplot(data=df, x='label', y='value')
-- plt.show()


-- The box plot does a good job of showing certain differences, the different between Dataset 1 and Dataset 2; 
-- however, it does not show that Dataset 3 is bimodal.

-- To plot a box plot in Seaborn, we use the method sns.boxplot().

-- A box plot takes the following arguments:

-- data - the dataset we're plotting, like a DataFrame, list, or an array
-- x - a one-dimensional set of values, like a Series, list, or array
-- y - a second set of one-dimensional data

-- If you use a Pandas Series for the x and y values, the Series will also generate the axis labels. 
-- For example, if you use the value Series as your y value data, 
-- Seaborn will automatically apply that name as the y-axis label.

import codecademylib3_seaborn
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns

# Take in the data from the CSVs as NumPy arrays:
set_one = np.genfromtxt("dataset1.csv", delimiter=",")
set_two = np.genfromtxt("dataset2.csv", delimiter=",")
set_three = np.genfromtxt("dataset3.csv", delimiter=",")
set_four = np.genfromtxt("dataset4.csv", delimiter=",")

# Creating a Pandas DataFrame:
n=500
df = pd.DataFrame({
    "label": ["set_one"] * n + ["set_two"] * n + ["set_three"] * n + ["set_four"] * n,
    "value": np.concatenate([set_one, set_two, set_three, set_four])
})

# Setting styles:
sns.set_style("darkgrid")
sns.set_palette("pastel")

# Add your code below:
#1.Use sns.boxplot() to plot the four datasets as box plots.
sns.boxplot(data=df, x='label', y='value')
plt.show()

++++++++++++++++++++++++++++++++++++++++++++

LEARN SEABORN: DISTRIBUTIONS
Violin Plots, Part I

/*As we saw in the previous exercises, while it's possible to plot multiple histograms, 
it is not a great option for comparing distributions. 
Seaborn gives us another option for comparing distributions - a violin plot. 
Violin plots provide more information than box plots because instead of mapping each individual data point, 
we get an estimation of the dataset thanks to the KDE.

Violin plots are less familiar and trickier to read, so let's break down the different parts:

There are two KDE plots that are symmetrical along the center line.
A white dot represents the median.
The thick black line in the center of each violin represents the interquartile range.
The lines that extend from the center are the confidence intervals - just as we saw on the bar plots, 
a violin plot also displays the 95% confidence interval.

Examine the violin plot to the right. Notice how it also is able to show distributions, like the KDE plot,
as well as information about the median and interquartile range, like the box plot.
*/

++++++++++++++++++++++++++++++++++++++++++++++++
LEARN SEABORN: DISTRIBUTIONS
Violin Plots, Part II

/*Violin Plots are a powerful graphing tool that allows you to compare multiple distributions at once.

Let's look at how our original three data sets look like as violin plots:

sns.violinplot(data=df, x="label", y="value")
plt.show()


As we can see, violin plots allow us to graph and compare multiple distributions. 
It also retains the shape of the distributions, so we can easily tell that Dataset 1 is skewed left 
and that Dataset 3 is bimodal.

To plot a violin plot in Seaborn, use the method sns.violinplot().

There are several options for passing in relevant data to the x and y parameters:

data - the dataset that we're plotting, such as a list, DataFrame, or array
x, y, and hue - a one-dimensional set of data, such as a Series, list, or array
any of the parameters to the function sns.boxplot()*/

import codecademylib3_seaborn
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns

# Take in the data from the CSVs as NumPy arrays:
set_one = np.genfromtxt("dataset1.csv", delimiter=",")
set_two = np.genfromtxt("dataset2.csv", delimiter=",")
set_three = np.genfromtxt("dataset3.csv", delimiter=",")
set_four = np.genfromtxt("dataset4.csv", delimiter=",")

# Creating a Pandas DataFrame:
n=500
df = pd.DataFrame({
    "label": ["set_one"] * n + ["set_two"] * n + ["set_three"] * n + ["set_four"] * n,
    "value": np.concatenate([set_one, set_two, set_three, set_four])
})

# Setting styles:
sns.set_style("darkgrid")
sns.set_palette("pastel")

# Add your code below:
#1.Using sns.violinplot(), plot the four datasets as violin plots.
sns.violinplot(data=df, x="label", y="value")

#2.Use plt.show() to display the violin plots.
#Notice how much easier it is to compare the shape of the datasets than when they were layered on top of each other!
plt.show()

------------------------------------------------------------------------------
10/12/2018

WHY USE MACHINE LEARNING?
Introduction to Machine Learning

/*The year is 2049...

Neo York is overrun by bots and web crawlers. The capabilities of Machine Learning have reached new heights and the world 
as we know it will never be the same:

Facial recognition technology that helps users tag and share photos of friends can now tag future friends;
night drones are on the prowl.

Machine learning powered self-driving cars (and flying cars) are now massively available to consumers. 
The steering wheel has become a thing of the past.

Recommendation engines that suggest what VR shows to watch and what products to buy will now display 
a different environment for each user group.

At the dawn of a new age, you can't help but wonder, 
what is Machine Learning and how did it pivot our world so drastically?
*/
++++++++++++++++++++++++

WHY USE MACHINE LEARNING?
What is Machine Learning?

/*While at IBM, Arthur Samuel developed a program that learned how to play checkers. 
He called it — "the field of study that gives computers the ability to learn without being explicitly programmed" (1959).

What does this mean?

As programmers, we often approach problems in a methodical, logic-based way. 
We try to determine what our desired outputs should be, and then create the proper rules 
that will transform our inputs into those outputs.

Machine learning flips the script. We want the program itself to learn the rules that describe our data the best, 
by finding patterns in what we know and applying those patterns to what we don't know.

These algorithms are able to learn. Their performance gets better and better with each iteration, 
as it uncovers more hidden trends in the data.*/

++++++++++++++++++++++++++++++

WHY USE MACHINE LEARNING?
Supervised Learning


/*Machine learning can be branched out into the following categories:

Supervised Learning
Unsupervised Learning

Supervised Learning is where the data is labeled and the program learns to predict the output from the input data. For instance, a supervised learning algorithm for credit card fraud detection would take as input a set of recorded transactions. For each transaction, the program would predict if it is fraudulent or not.

Supervised learning problems can be further grouped into regression and classification problems.

Regression:

In regression problems, we are trying to predict a continuous-valued output. Examples are:

What is the housing price in Neo York?
What is the value of cryptocurrencies?
Classification:

In classification problems, we are trying to predict a discrete number of values. Examples are:

Is this a picture of a human or a picture of an AI?
Is this email spam?
*/

from texts import text_counter, text_training
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB

intercepted_text = "abc"

text_counts = text_counter.transform([intercepted_text])

text_classifier = MultinomialNB()

text_labels = [0] * 1000 + [1] * 1000

text_classifier.fit(text_training, text_labels)

final_pos = text_classifier.predict_proba(text_counts)[0][1]

final_neg = text_classifier.predict_proba(text_counts)[0][0]

if final_pos > final_neg:
  print("The text is positive.")
else:
  print("The text is negative.")

++++++++++++++++++++++++++++

WHY USE MACHINE LEARNING?
Unsupervised Learning

/*Unsupervised Learning is a type of machine learning where the program learns the inherent structure of the data 
based on unlabeled examples.

Clustering is a common unsupervised machine learning approach that finds patterns and structures in unlabeled data 
by grouping them into clusters.

Some examples:

Social networks clustering topics in their news feed
Consumer sites clustering users for recommendations
Search engines to group similar objects in one cluster

*/

from texts import text_counter, text_training
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB

intercepted_text = "abc"

text_counts = text_counter.transform([intercepted_text])

text_classifier = MultinomialNB()

text_labels = [0] * 1000 + [1] * 1000

text_classifier.fit(text_training, text_labels)

final_pos = text_classifier.predict_proba(text_counts)[0][1]

final_neg = text_classifier.predict_proba(text_counts)[0][0]

if final_pos > final_neg:
  print("The text is positive.")
else:
  print("The text is negative.")
plt.show()

+++++++++++++++++++++++++++++

WHY USE MACHINE LEARNING?
Begin Your Journey
DING DING DING!

-- Whew, it's still 2018. There is still time. Understanding Machine Learning will 
-- help you change this bleak future, or be ready for it.

-- As you begin your journey through Codecademy's Machine Learning content, 
-- you will learn the different applications of this powerful field. 
-- You will build your own models, test them, and try to improve them. You will analyze bigger, and more complex data
-- and deliver faster, more accurate results — even on a very large scale using:

-- Supervised Learning
-- Unsupervised Learning
-- Throughout your exploration of ML, we hope you gain an understanding of 
-- how to harness predictive models to do good, and enhance human life rather than replace it!

-- So what are you going to build?

-- What is the kind of future that you want to see?

------------------------------------------------------

LINEAR REGRESSION
Introduction to Linear Regression

/*The purpose of machine learning is often to create a model that explains some real-world data, 
so that we can predict what may happen next, with different inputs.

The simplest model that we can fit to data is a line. When we are trying to find a line that fits a set of data best, 
we are performing Linear Regression.

A line is a rough approximation, but it allows us the ability to explain and predict variables 
that have a linear relationship with each other. 
In the rest of the lesson, we will learn how to perform Linear Regression.
*/
import codecademylib3_seaborn
import matplotlib.pyplot as plt

months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
revenue = [52, 74, 79, 95, 115, 110, 129, 126, 147, 146, 156, 184]

plt.plot(months, revenue, "o")

plt.title("Sandra's Lemonade Stand")

plt.xlabel("Months")
plt.ylabel("Revenue ($)")

plt.show()

# What do you think the revenue in month 13 would be?
month_13 = 175

+++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Points and Lines

/*For our program to make the same level of guess, we have to determine what a line would look like through 
those data points.

A line is determined by its slope and its intercept. In other words, for each point y on a line we can say:

y = m x + by=mx+b

where m is the slope, and b is the intercept. y is a given point on the y-axis, 
and it corresponds to a given x on the x-axis.

The slope is a measure of how steep the line is, while the intercept is a measure of where the line hits the y-axis.

When we perform Linear Regression, the goal is to get the "best" m and b for our data. 
We will determine what "best" means in the next exercises.

*/
import codecademylib3_seaborn
import matplotlib.pyplot as plt
months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
revenue = [52, 74, 79, 95, 115, 110, 129, 126, 147, 146, 156, 184]

#slope:
m = 12
#intercept:
b = 40
#1.Create a new list, y, that has every element in months, multiplied by m and added to b.
#A list comprehension is probably the easiest way to do this
y= [el*m+ b for el in months]

plt.plot(months, revenue, "o")
#2.Plot the y values against months as a line
plt.plot(months, y)

plt.show()

++++++++++++++++++++++++++++++++++=

LINEAR REGRESSION
Loss

/*When we think about how we can assign a slope and intercept to fit a set of points, 
we have to define what the best fit is.

For each data point, we calculate loss, a number that measures how bad the model's (in this case, the line's)
prediction was. You may have seen this being referred to as error.

We can think about loss as the squared distance from the point to the line. We do the squared distance (instead of just the distance) 
so that points above and below the line both contribute to total loss in the same way:
*/
x = [1, 2, 3]
y = [5, 1, 3]

#y = x
m1 = 1
b1 = 0

#y = 0.5x + 1
m2 = 0.5
b2 = 1

y_predicted1 = [m1*el + b1 for el in x]
y_predicted2 = [m2*el + b2 for el in x]

total_loss1 = 0

for i in range(len(y)):
  total_loss1 += (y[i] - y_predicted1[i])**2
 
total_loss2 = 0
for i in range(len(y)):
  total_loss2 += (y[i] - y_predicted2[i])**2
  
print(total_loss1)
print(total_loss2)

better_fit = 2

+++++++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Minimizing Loss

/*The goal of a linear regression model is to find the slope and intercept pair that minimizes loss on average 
across all of the data.

Do you first get the slope to where it produces lowest loss, and then move the intercept to where it produces lowest loss?
Do you create a rough idea in your mind where the line should be first, and then enter the parameters to match that image?*/

++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Gradient Descent for Intercept

/*As we try to minimize loss, we take each parameter we are changing, and move it as long as we are decreasing loss. 
It's like we are moving down a hill, and stop once we reach the bottom:

The process by which we do this is called gradient descent. We move in the direction that decreases our loss the most. Gradient refers to the slope of the curve at any point.

For example, let's say we are trying to find the intercept for a line.
 We currently have a guess of 10 for the intercept. At the point of 10 on the curve, the slope is downward.
  Therefore, if we increase the intercept, we should be lowering the loss. So we follow the gradient downwards.



We derive these gradients using calculus. It is not crucial to understand how we arrive at the gradient equation. 
To find the gradient of loss as intercept changes, the formula comes out to be:

N is the number of points we have in our dataset
m is the current gradient guess
b is the current intercept guess

Basically:

we find the sum of y_value - (m*x_value + b) for all the y_values and x_values we have
and then we multiply the sum by a factor of -2/N. N is the number of points we have.*/

def get_gradient_at_b(x,y,m,b):
  diff = 0
  for i in range(len(x)):
    diff += y[i] -(m*x[i] +b)
    
  b_gradient = (-2/len(x)) * diff  
  return b_gradient

++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Gradient Descent for Slope

/*We have a function to find the gradient of b at every point. 
To find the m gradient, or the way the loss changes as the slope of our line changes, we can use this formula:

Once more:

N is the number of points you have in your dataset
m is the current gradient guess
b is the current intercept guess
To find the m gradient:

we find the sum of x_value * (y_value - (m*x_value + b)) for all the y_values and x_values we have
and then we multiply the sum by a factor of -2/N. N is the number of points we have.

Once we have a way to calculate both the m gradient and the b gradient, 
we'll be able to follow both of those gradients downwards to the point of lowest loss for both the m value 
and the b value. 

Then, we'll have the best m and the best b to fit our data!  */

def get_gradient_at_b(x, y, m, b):
    diff = 0
    N = len(x)
    for i in range(N):
      y_val = y[i]
      x_val = x[i]
      diff += (y_val - ((m * x_val) + b))
    b_gradient = -2/N * diff
    return b_gradient
  
def get_gradient_at_m(x, y, m, b):
    diff = 0
    N = len(x)
    for i in range(N):
      y_val = y[i]
      x_val = x[i]
      diff += x_val*(y_val - (m*x_val+b))
    m_gradient = -2/N * diff
    return m_gradient


+++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Put it Together

/*Now that we know how to calculate the gradient, we want to take a "step" in that direction. 
However, it's important to think about whether that step is too big or too small. 
We don't want to overshoot the minimum error!

We can scale the size of the step by multiplying the gradient by a learning rate.

To find a new b value, we would say:

new_b = current_b - (learning_rate * b_gradient)
where current_b is our guess for what the b value is, b_gradient is the gradient of the loss curve 
at our current guess, and learning_rate is proportional to the size of the step we want to take.

In a few exercises, we'll talk about the implications of a large or small learning rate, 
but for now, let's use a fairly small value.
*/
def get_gradient_at_b(x, y, b, m):
  N = len(x)
  diff = 0
  for i in range(N):
    x_val = x[i]
    y_val = y[i]
    diff += (y_val - ((m * x_val) + b))
  b_gradient = -(2/N) * diff  
  return b_gradient

def get_gradient_at_m(x, y, b, m):
  N = len(x)
  diff = 0
  for i in range(N):
      x_val = x[i]
      y_val = y[i]
      diff += x_val * (y_val - ((m * x_val) + b))
  m_gradient = -(2/N) * diff  
  return m_gradient

#Your step_gradient function here
def step_gradient(x, y, b_current, m_current):
    b_gradient = get_gradient_at_b(x, y, b_current, m_current)
    m_gradient = get_gradient_at_m(x, y, b_current, m_current)
    b = b_current - (0.01 * b_gradient)
    m = m_current - (0.01 * m_gradient)
    return [b, m]

months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
revenue = [52, 74, 79, 95, 115, 110, 129, 126, 147, 146, 156, 184]

# current intercept guess:
b = 0
# current slope guess:
m = 0

b, m = step_gradient(months, revenue, b, m)
print(b, m)    

++++++++++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Convergence

/*How do we know when we should stop changing the parameters m and b? 
How will we know when our program has learned enough?

To answer this, we have to define convergence. 
Convergence is when the loss stops changing (or changes very slowly) when parameters are changed.

Hopefully, the algorithm will converge at the best values for the parameters m and b.*/

+++++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Learning Rate

/*We want our program to be able to iteratively learn what the best m and b values are. 
So for each m and b pair that we guess, we want to move them in the direction of the gradients we've calculated.
 But how far do we move in that direction?

We have to choose a learning rate, which will determine how far down the loss curve we go.

A small learning rate will take a long time to converge — you might run out of time or cycles 
before getting an answer. A large learning rate might skip over the best value. 
It might never converge! Oh no!

Finding the absolute best learning rate is not necessary for training a model. 
You just have to find a learning rate large enough that gradient 
descent converges with the efficiency you need, and not so large that convergence never happens.

*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
from data import bs, bs_000000001, bs_01

iterations = range(1400)
#iterations = range(100)

plt.plot(iterations, bs_000000001)
#plt.plot(iterations, bs_01)
plt.xlabel("Iterations")
plt.ylabel("b value")
plt.show()

++++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Put it Together II

/*At each step, we know how to calculate the gradient and move in that direction with 
a step size proportional to our learning rate. 
Now, we want to make these steps until we reach convergence.
*/
import codecademylib3_seaborn
import matplotlib.pyplot as plt

def get_gradient_at_b(x, y, b, m):
  N = len(x)
  diff = 0
  for i in range(N):
    x_val = x[i]
    y_val = y[i]
    diff += (y_val - ((m * x_val) + b))
  b_gradient = -(2/N) * diff  
  return b_gradient

def get_gradient_at_m(x, y, b, m):
  N = len(x)
  diff = 0
  for i in range(N):
      x_val = x[i]
      y_val = y[i]
      diff += x_val * (y_val - ((m * x_val) + b))
  m_gradient = -(2/N) * diff  
  return m_gradient

#Your step_gradient function here
def step_gradient(b_current, m_current, x, y, learning_rate):
    b_gradient = get_gradient_at_b(x, y, b_current, m_current)
    m_gradient = get_gradient_at_m(x, y, b_current, m_current)
    b = b_current - (learning_rate * b_gradient)
    m = m_current - (learning_rate * m_gradient)
    return [b, m]
  
#Your gradient_descent function here:  
def gradient_descent(x, y, learning_rate, num_iterations):
  b = 0
  m = 0
  for i in range(num_iterations):
    b, m = step_gradient(b, m, x, y, learning_rate)
  return [b,m]  

months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
revenue = [52, 74, 79, 95, 115, 110, 129, 126, 147, 146, 156, 184]

#Uncomment the line below to run your gradient_descent function
b, m = gradient_descent(months, revenue, 0.01, 1000)

#Uncomment the lines below to see the line you've settled upon!
y = [m*x + b for x in months]

plt.plot(months, revenue, "o")
plt.plot(months, y)

plt.show()

+++++++++++++++++++++++++++++++++++++++++++

LINEAR REGRESSION
Use Your Functions on Real Data

/*We have constructed a way to find the "best" b and m values using gradient descent! 
Let's try this on the set of baseball players' heights and weights that we saw at the beginning of the lesson.
*/
import codecademylib3_seaborn
from gradient_descent_funcs import gradient_descent
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("heights.csv")

X = df["height"]
y = df["weight"]

plt.plot(X, y, 'o')

b, m = gradient_descent(X, y, num_iterations=1000, learning_rate=0.0001)
y_predictions = [m*x + b for x in X]

plt.plot(X, y_predictions)

plt.show()

++++++++++++++++++++++++++++++++++++++++++
LINEAR REGRESSION
Scikit-Learn

/*Congratulations! You've now built a linear regression algorithm from scratch.

Luckily, we don't have to do this every time we want to use linear regression. 
We can use Python's scikit-learn library. Scikit-learn, or sklearn, is used specifically for Machine Learning. 
Inside the linear_model module, there is a LinearRegression() function we can use:

from sklearn.linear_model import LinearRegression

You can first create a LinearRegression model, and then fit it to your x and y data:

line_fitter = LinearRegression()
line_fitter.fit(X, y)
The .fit() method gives the model two variables that are useful to us:

the line_fitter.coef_, which contains the slope
the line_fitter.intercept_, which contains the intercept
We can also use the .predict() function to pass in x-values and receive the y-values that this line would predict:

y_predicted = line_fitter.predict(X)

Note: the num_iterations and the learning_rate that you learned about in your own implementation have default values 
within scikit-learn, so you don't need to worry about setting them specifically!
*/
import codecademylib3_seaborn
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
import numpy as np

temperature = np.array(range(60, 100, 2))
temperature = temperature.reshape(-1, 1)
sales = [65, 58, 46, 45, 44, 42, 40, 40, 36, 38, 38, 28, 30, 22, 27, 25, 25, 20, 15, 5]

plt.plot(temperature, sales, 'o')

#1.Create an sklearn linear regression model and call it line_fitter.
line_fitter = LinearRegression()

#2.Fit the line_fitter object to temperature and sales
line_fitter.fit(temperature, sales)

#3.Create a list called sales_predict that is the predicted sales values that line_fitter would generate from the temperature list.
sales_predict = line_fitter.predict(temperature)

#4.Plot sales_predict against temperature as a line, on the same plot as the scatterplot.
plt.plot(temperature, sales_predict)
plt.show()

----------------------------------------------------------

12/12/2018

DISTANCE FORMULA
Representing Points

/*In this lesson, you will learn three different ways to define the distance between two points:

Euclidean Distance
Manhattan Distance
Hamming Distance

Before diving into the distance formulas, it is first important to consider how to represent points in your code.
Note that we can only find the difference between two points if they have the same number of dimensions!
*/
two_d = [10, 2]
five_d = [30, -1, 50, 0, 2]

#1. Create a new point named four_d that has four dimensions
four_d =[1,3,5,3]

++++++++++++++++++++++++++++++++++

DISTANCE FORMULA
Euclidean Distance

/*Euclidean Distance is the most commonly used distance formula. 
To find the Euclidean distance between two points, we first calculate the squared distance between each dimension.
 If we add up all of these squared differences and take the square root, we've computed the Euclidean distance.

hinh tam vuong - tinh canh huyen

*/
#1. Create a function named auclidean_distance() that takes two lists as parameters named pt1 and pt2
def euclidean_distance(pt1, pt2):
  distance = 0
  
  #2Create a for loop to loop through the dimensions of each point. Add the squared difference between each dimension to distance.
  for i in range(len(pt1)):
    distance += (pt1[i] -pt2[i])**2
   
  #3. Outside of the for loop, take a square root of distance 
  distance = distance**0.5  
  return distance

#4.
print(euclidean_distance([1,2],[4,0]))
print(euclidean_distance([5,4,3],[1,7,9]))
#print(euclidean_distance([2,3,4],[1,2]))

++++++++++++++++++++++++++++++++

DISTANCE FORMULA
Manhattan Distance

M/*anhattan Distance is extremely similar to Euclidean distance. Rather than summing the squared difference between each dimension, 
we instead sum the absolute value of the difference between each dimension. 
It's called Manhattan distance because it's similar to how you might navigate when walking city blocks. 

If you've ever wondered 
"how many blocks will it take me to get from point A to point B", you've computed the Manhattan distance.

2 canh ben - tam giac vuong*/

#1. create a function called manhattan_distance() that takes 2 lists named pt1 and pt2 as parameters
def manhattan_distance(pt1, pt2):
  distance = 0
  
  #2. create a for loop to loop through the dimensions of each point. Add the absolute value of the difference between each dimention to distance
  for i in range(len(pt1)):
    distance += abs(pt1[i] -pt2[i])
    
  return distance

print(manhattan_distance([1,2], [4,0]))
print(manhattan_distance([5, 4, 3], [1, 7, 9]))

++++++++++++++++++++++++++++++++++++
DISTANCE FORMULA
Hamming Distance

/*Hamming Distance is another slightly different variation on the distance formula. 
Instead of finding the difference of each dimension, Hamming distance only cares about 
whether the dimensions are exactly equal. 
When finding the Hamming distance between two points, add one for every dimension that has different values.

Hamming distance is used in spell checking algorithms. 
For example, the Hamming distance between the word "there" and the typo "thete" is one. 
Each letter is a dimension, and each dimension has the same value except for one.
*/


def hamming_distance(pt1, pt2):
  distance = 0
  for i in range(len(pt1)):
    if pt1[i] != pt2[i]:
      distance +=1
  return distance

print(hamming_distance([1,2], [1,100]))
print(hamming_distance([5,4,9] , [1,7,9]))

+++++++++++++++++++++++++++++++++++++

DISTANCE FORMULA
SciPy Distances

N/*ow that you've written these three distance formulas yourself, 
let's look at how to use them using Python's SciPy library:

Euclidean Distance .euclidean()
Manhattan Distance .cityblock()
Hamming Distance .hamming()
There are a few noteworthy details to talk about:

First, the scipy implementation of Manhattan distance is called cityblock(). 
Remember, computing Manhattan distance is like asking how many blocks away you are from a point.

Second, the scipy implementation of Hamming distance will always return a number between 0 an 1. 
Rather than summing the number of differences in dimensions, 
this implementation sums those differences and then divides by the total number of dimensions. 
For example, in your implementation, the Hamming distance between [1, 2, 3] and [7, 2, -10] would be 2. 
In scipy's version, it would be 2/3.
*/
from scipy.spatial import distance

def euclidean_distance(pt1, pt2):
  distance = 0
  for i in range(len(pt1)):
    distance += (pt1[i] - pt2[i]) ** 2
  return distance ** 0.5

def manhattan_distance(pt1, pt2):
  distance = 0
  for i in range(len(pt1)):
    distance += abs(pt1[i] - pt2[i])
  return distance

def hamming_distance(pt1, pt2):
  distance = 0
  for i in range(len(pt1)):
    if pt1[i] != pt2[i]:
      distance += 1
  return distance

print(euclidean_distance([1, 2], [4, 0]))
print(manhattan_distance([1, 2], [4, 0]))
print(hamming_distance([5, 4, 9], [1, 7, 9]))

print(distance.euclidean([1,2], [4,0]))
print(distance.cityblock([1,2], [4,0]))
print(distance.hamming([5,4,9], [1,7,9]))

-------------------------------------------------------
12/12/2018

K-NEAREST NEIGHBORS
K-Nearest Neighbors Classifier

K-Nearest Neighbors (KNN) is a classification algorithm. 
The central idea is that data points with similar attributes tend to fall into similar categories.

The purpose of the algorithm is to classify these unknown points.

++++++++++++++++++++++++++
K-NEAREST NEIGHBORS
Introduction

/*Before diving into the K-Nearest Neighbors algorithm, let's first take a minute to think about an example.

Consider a dataset of movies. Let's brainstorm some features of a movie data point.
 A feature is a piece of information associated with a data point. 
 Here are some potential features of movie data points:

the length of the movie in minutes.
the budget of a movie in dollars.

There could also be some boolean features: features that are either true or false.
Directed by Stanley Kubrick. This feature would be False for almost every movie, 
but for the few movies that were directed by Kubrick, it would be True.
Finally, let's think about how we might want to classify a movie.*/

mean_girls = [97, 17000000, False]
the_shining = [146, 19000000, True]
gone_with_the_wind = [238, 3977000, False]

+++++++++++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Distance Between Points - 2D

/*In the first exercise, we were able to visualize the dataset and estimate the k nearest neighbors of an unknown point.
But a computer isn’t going to be able to do that!

We need to define what it means for two points to be close together or far apart. 
To do this, we’re going to use the Distance Formula.*/

star_wars = [125, 1977]
raiders = [115, 1981]
mean_girls = [97, 2004]

#1.Write a function named distance that takes 2 lists named movie1 and movie2 as parameters
def distance(movie1, movie2):
  distance = 0
  for i in range(len(movie1)):
    distance += (movie1[i] - movie2[i])**2
  return distance**0.5  

print(distance(star_wars, raiders))
print(distance(star_wars, mean_girls))

++++++++++++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Distance Between Points - 3D

/*Making a movie rating predictor based on just the length and release date of movies is pretty limited. 
There are so many more interesting pieces of data about movies that we could use! So let’s add another dimension.

Using this formula, we can find the K-Nearest Neighbors of a point in N-dimensional space! 
We now can use as much information about our movies as we want.

We will eventually use these distances to find the nearest neighbors to an unlabeled point.  
*/

star_wars = [125, 1977, 11000000]
raiders = [115, 1981, 18000000]
mean_girls = [97, 2004, 17000000]

def distance(movie1, movie2):
  distance = 0
  for i in range(len(movie1)):
    distance += (movie1[i] - movie2[i])**2
  return distance**0.5  
  
print(distance(star_wars, raiders))
print(distance(star_wars, mean_girls))  

++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Data with Different Scales: Normalization

/*In the next three lessons, we'll implement the three steps of the K-Nearest Neighbor Algorithm:

Normalize the data
Find the k nearest neighbors
Classify the new point based on those neighbors

The problem is that the distance formula treats all dimensions equally, regardless of their scale.
The solution to this problem is to normalize the data so every value is between 0 and 1.
In this lesson, we're going to be using min-max normalization.
*/
release_dates = [1897, 1998, 2000, 1948, 1962, 1950, 1975, 1960, 2017, 1937, 1968, 1996, 1944, 1891, 1995, 1948, 2011, 1965, 1891, 1978]

#1. Write a function named min_max_normalize that takes a list of numbers named lst as a parameter
#Begin by storing the minimum and maximum values of the list in variables named minimum and maximum
def min_max_normalize(lst):
  minimum = min(lst)
  maximum = max(lst)
  
#2. Create an empty list named normalized. Loop through each value in the original list
#Using min-max normalization, normalize the value and add the normalized the value to the new list
#After adding every normalized value to normalized, return normalize
  normalized = [(i-minimum)/(maximum-minimum) for i in lst]
  return normalized

#3. Call min_max_normalize using the given list release_dates. Print the resulting list. 
#What does the date 1897 get normalized to? Why is it closer to 0 than 1?
test = min_max_normalize(release_dates)
print(test)

+++++++++++++++++++++++++++++++++++++++++
K-NEAREST NEIGHBORS
Finding the Nearest Neighbors

# Now that our data has been normalized and we know how to find the distance between two points, 
# we can begin classifying unknown data!

# To do this, we want to find the k nearest neighbors of the unclassified point. 
# In a few exercises, we’ll learn how to properly choose k,
#  but for now, let’s choose a number that seems somewhat reasonable. Let’s choose 5.

from movies import movie_dataset, movie_labels

print(movie_dataset['Bruce Almighty'])
print(movie_labels['Bruce Almighty'])

def distance(movie1, movie2):
  squared_difference = 0
  for i in range(len(movie1)):
    squared_difference += (movie1[i] - movie2[i]) ** 2
  final_distance = squared_difference ** 0.5
  return final_distance

#Create a function called classify that has three parameters: the data point you want to classify named unknown,
#the dataset you are using to classify it named dataset, and k, the number of neighbors you are interested in. 
def classify(unknown, dataset, k):
   distances = []
  #Looping through all points in the dataset
  for title in dataset:
    movie = dataset[title]
    distance_to_point = distance(movie, unknown)
    #Adding the distance and point associated with that distance
    distances.append([distance_to_point, title])
  distances.sort()
  #Taking only the k closest points
  neighbors = distances[0:k]
  return neighbors
  
print(classify([.4, .2, .9], movie_dataset, 5))

"""
[[0.08273614694606074, 'Lady Vengeance'], 
[0.22989623153818367, 'Steamboy'], 
[0.23641372358159884, 'Fateless'], 
[0.26735445689589943, 'Princess Mononoke'], 
[0.3311022951533416, 'Godzilla 2000']]
"""

+++++++++++++++++++++++++
K-NEAREST NEIGHBORS
Count Neighbors

/*Classify the new point based on those neighbors

We've now found the k nearest neighbors, and have stored them in a list that looks like this:

[
  [0.083, 'Lady Vengeance'],
  [0.236, 'Steamboy'],
  ...
  ...
  [0.331, 'Godzilla 2000']
]

Our goal now is to count the number of good movies and bad movies in the list of neighbors. 
If more of the neighbors were good, then the algorithm will classify the unknown movie as good.
 Otherwise, it will classify it as bad.

In order to find the class of each of the labels, we'll need to look at our movie_labels dataset. 
For example, movie_labels['Akira'] would give us 1 because Akira is classified as a good movie.

You may be wondering what happens if there’s a tie. What if k = 8 
and four neighbors were good and four neighbors were bad? There are different strategies, 
but one way to break the tie would be to choose the class of the closest point.

*/

from movies import movie_dataset, movie_labels

def distance(movie1, movie2):
  squared_difference = 0
  for i in range(len(movie1)):
    squared_difference += (movie1[i] - movie2[i]) ** 2
  final_distance = squared_difference ** 0.5
  return final_distance

def classify(unknown, dataset, labels, k):
  distances = []
  #Looping through all points in the dataset
  for title in dataset:
    movie = dataset[title]
    distance_to_point = distance(movie, unknown)
    #Adding the distance and point associated with that distance
    distances.append([distance_to_point, title])
  distances.sort()
  #Taking only the k closest points
  neighbors = distances[0:k]
  num_good = 0
  num_bad = 0
  for neighbor in neighbors:
    title = neighbor[1]
    if labels[title] == 0:
      num_bad += 1
    elif labels[title] == 1:
      num_good += 1
  if num_good > num_bad:
    return 1
  else:
    return 0

print(classify([.4, .2, .9], movie_dataset, movie_labels, 5))

++++++++++++++++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Classify Your Favorite Movie

/*Nice work! Your classifier is now able to predict whether a movie will be good or bad. 
So far, we've only tested this on a completely random point [.4, .2, .9]. In this exercise we're going 
to pick a real movie, normalize it, and run it through our classifier to see what it predicts!

In the instructions below, we are going to be testing our classifier using the 2017 movie Call Me By Your Name. 
Feel free to pick your favorite movie instead!*/

from movies import movie_dataset, movie_labels, normalize_point

def distance(movie1, movie2):
  squared_difference = 0
  for i in range(len(movie1)):
    squared_difference += (movie1[i] - movie2[i]) ** 2
  final_distance = squared_difference ** 0.5
  return final_distance

def classify(unknown, dataset, labels, k):
  distances = []
  #Looping through all points in the dataset
  for title in dataset:
    movie = dataset[title]
    distance_to_point = distance(movie, unknown)
    #Adding the distance and point associated with that distance
    distances.append([distance_to_point, title])
  distances.sort()
  #Taking only the k closest points
  neighbors = distances[0:k]
  num_good = 0
  num_bad = 0
  for neighbor in neighbors:
    title = neighbor[1]
    if labels[title] == 0:
      num_bad += 1
    elif labels[title] == 1:
      num_good += 1
  if num_good > num_bad:
    return 1
  else:
    return 0

# 1.To begin, we want to make sure the movie that we want to classify isn't already in our database. This is important because we don't want one of the nearest neighbors to be itself!
#You can do this by using the in keyword.
#Begin by printing if the title of your movie is in movie_dataset. This should print False. 
print("Call Me By Your Name" in movie_dataset)

#2.Once you confirm your movie is not in your database, we need to make a datapoint for your movie. Create a variable named my_movie and set it equal to a list of three numbers.
my_movie = [3500000, 132, 2017]

#Next, we want to normalize this datapoint. We've included the function normalize_point which takes a datapoint as a parameter and returns the point normalized. Create a variable called normalized_my_movie and set it equal to the normalized value of my_movie. Print the result!
normalized_my_movie = normalize_point(my_movie)
print(normalized_my_movie)

#4.Finally, call classify with the following parameters:.Print the result? Did your classifier think your movie was good or bad?
print(classify(normalized_my_movie, movie_dataset, movie_labels, 5))

++++++++++++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Training and Validation Sets

/*You’ve now built your first K Nearest Neighbors algorithm capable of classification. 
You can feed your program a never-before-seen movie and it can predict whether its IMDb rating was above or below 7.0. However, we’re not done yet. 
We now need to report how effective our algorithm is. After all, it’s possible our predictions are totally wrong!

As with most machine learning algorithms, we have split our data into a training set and validation set.

Once these sets are created, we will want to use every point in the validation set as input to 
the K Nearest Neighbor algorithm. 
We will take a movie from the validation set, compare it to all the movies in the training set, 
find the K Nearest Neighbors, and make a prediction. After making that prediction, 
we can then peek at the real answer (found in the validation labels) to see if our classifier got the answer correct.

If we do this for every movie in the validation set, we can count the number of times the classifier got the answer right 
and the number of times it got it wrong. Using those two numbers, we can compute the validation accuracy.

Validation accuracy will change depending on what K we use. 
In the next exercise, we'll use the validation accuracy to pick the best possible K for our classifier.*/

from movies import training_set, training_labels, validation_set, validation_labels

def distance(movie1, movie2):
  squared_difference = 0
  for i in range(len(movie1)):
    squared_difference += (movie1[i] - movie2[i]) ** 2
  final_distance = squared_difference ** 0.5
  return final_distance

def classify(unknown, dataset, labels, k):
  distances = []
  #Looping through all points in the dataset
  for title in dataset:
    movie = dataset[title]
    distance_to_point = distance(movie, unknown)
    #Adding the distance and point associated with that distance
    distances.append([distance_to_point, title])
  distances.sort()
  #Taking only the k closest points
  neighbors = distances[0:k]
  num_good = 0
  num_bad = 0
  for neighbor in neighbors:
    title = neighbor[1]
    if labels[title] == 0:
      num_bad += 1
    elif labels[title] == 1:
      num_good += 1
  if num_good > num_bad:
    return 1
  else:
    return 0
  
#1.The movie "Bee Movie" is in validation_set. Print out the data associated with Bee Movie. Print Bee Movie 's label as well (which can be found in validation_labels).
print(validation_set["Bee Movie"])
print(validation_labels["Bee Movie"])

#2.Let's have our classifier predict whether Bee Movie is good or bad using k = 5. Call the classify function using the following parameters:
#Store the results in a variable named guess and print guess.
guess=classify(validation_set["Bee Movie"], training_set, training_labels, 5)
print(guess)

#3.Let's check to see if our classification got it right. If guess is equal to Bee Movie's real class (found in validation_labels), print "Correct!". Otherwise, print "Wrong!".
if guess == validation_labels["Bee Movie"]:
  print("Correct!")
else:
  print("Wrong!")


 /*[0.012279463360232739, 0.18430034129692832, 0.898876404494382]
0
0
Correct! */

++++++++++++++++++++++++++++++++++++++++++++++
K-NEAREST NEIGHBORS
Choosing K

/*In the previous exercise, we found that our classifier got one point in the training set correct.
 Now we can test every point to calculate the validation accuracy.

The validation accuracy changes as k changes. The first situation that will be useful to consider is 
when k is very small. Let's say k = 1. We would expect the validation accuracy to be fairly low due to overfitting.
 Overfitting is a concept that will appear almost any time you are writing a machine learning algorithm. 
 Overfitting occurs when you rely too heavily on your training data; 
 you assume that data in the real world will always behave exactly like your training data. 
 In the case of K-Nearest Neighbors, overfitting happens when you don't consider enough neighbors. 
 A single outlier could drastically determine the label of an unknown point. Consider the image below.

The dark blue point in the top left corner of the graph looks like a fairly significant outlier. 
When k = 1, all points in that general area will be classified as dark blue 
when it should probably be classified as green. 
Our classifier has relied too heavily on the small quirks in the training data.

On the other hand, if k is very large, our classifier will suffer from underfitting. 
Underfitting occurs when your classifier doesn't pay enough attention to the small quirks in the training set. 
Imagine you have 100 points in your training set and you set k = 100. 
Every single unknown point will be classified in the same exact way. 
The distances between the points don't matter at all! This is an extreme example, 
however, it demonstrates how the classifier can lose understanding of the training data if k is too big.
*/
from movies import training_set, training_labels, validation_set, validation_labels

def distance(movie1, movie2):
  squared_difference = 0
  for i in range(len(movie1)):
    squared_difference += (movie1[i] - movie2[i]) ** 2
  final_distance = squared_difference ** 0.5
  return final_distance

def classify(unknown, dataset, labels, k):
  distances = []
  #Looping through all points in the dataset
  for title in dataset:
    movie = dataset[title]
    distance_to_point = distance(movie, unknown)
    #Adding the distance and point associated with that distance
    distances.append([distance_to_point, title])
  distances.sort()
  #Taking only the k closest points
  neighbors = distances[0:k]
  num_good = 0
  num_bad = 0
  for neighbor in neighbors:
    title = neighbor[1]
    if labels[title] == 0:
      num_bad += 1
    elif labels[title] == 1:
      num_good += 1
  if num_good > num_bad:
    return 1
  else:
    return 0
  
#1.Begin by creating a function called find_validation_accuracy that takes five parameters. The parameters should be training_set, training_labels, validation_set, validation_labels, and k.
def find_validation_accuracy(training_set, training_labels, validation_set, validation_labels, k):
  
  #2.Create a variable called num_correct and have it begin at 0.0. Loop through the movies of validation_set, and call classify using each movie's data, the training_set, the training_labels, and k. Store the result in a variable called guess. For now, return guess outside of your loop.
#Remember, the movie's data can be found by using validation_set[title].  
  num_correct = 0.0
  for title in validation_set:
    guess = classify(validation_set[title], training_set, training_labels, k)
    
    #3.Inside the for loop, compare guess to the corresponding label in validation_labels. If they were equal, add 1 to num_correct. For now, outside of the for loop, return num_correct
    if guess == validation_labels[title]:
      num_correct += 1
      
  #4.Outside the for loop return the validation error. This should be num_correct divided by the total number of points in the validation set.    
  return num_correct / len(validation_set)


#5.Call find_validation_accuracy with k = 3. Print the results The code should take a couple of seconds to run.
print(find_validation_accuracy(training_set, training_labels, validation_set, validation_labels, 3))

+++++++++++++++++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Graph of K

The graph to the right shows the validation accuracy of our movie classifier as k increases. 
When k is small, overfitting occurs and the accuracy is relatively low. 
On the other hand, when k gets too large, underfitting occurs and accuracy starts to drop.

What seems to be the best k for this dataset?

+++++++++++++++++++++++++++++++++++++++++

K-NEAREST NEIGHBORS
Using sklearn

/*You've now written your own K-Nearest Neighbor classifier from scratch! 
However, rather than writing your own classifier every time, you can use Python's sklearn library. 
sklearn is a Python library specifically used for Machine Learning. It has an amazing number of features, 
but for now, we're only going to investigate its K-Nearest Neighbor classifier.

There are a couple of steps we'll need to go through in order to use the library. 
First, you need to create a KNeighborsClassifier object. This object takes one parameter - k. 
For example, the code below will create a classifier where k = 3

classifier = KNeighborsClassifier(n_neighbors = 3)
Next, we'll need to train our classifier. The .fit() method takes two parameters. 
The first is a list of points, and the second is the labels associated with those points. 
So for our movie example, we might have something like this

training_points = [
  [0.5, 0.2, 0.1],
  [0.9, 0.7, 0.3],
  [0.4, 0.5, 0.7]
]

training_labels = [0, 1, 1]
classifier.fit(training_points, training_labels)
Finally, after training the model, we can classify new points. 
The .predict() method takes a list of points that you want to classify. 
It returns a list of its guesses for those points.

unknown_points = [
  [0.2, 0.1, 0.7],
  [0.4, 0.7, 0.6],
  [0.5, 0.8, 0.1]
]

guesses = classifier.predict(unknown_points)*/

from movies import movie_dataset, labels
from sklearn.neighbors import KNeighborsClassifier

#1.We've imported sklearn for you. Create a KNeighborsClassifier named classifier that uses k=5.
classifier = KNeighborsClassifier(n_neighbors = 5)

#2.We've also imported some movie data. Train your classifier using movie_dataset as the training points and labels as the training labels.
classifier.fit(movie_dataset, labels)

#3.Let's classify some movies. Classify the following movies: [.45, .2, .5], [.25, .8, .9],[.1, .1, .9]. Print the classifications!
#Which movies were classified as good movies and which were classified as bad movies?
#Remember, those three numbers associated with a movie are the normalized budget, run time, and year of release
guess = classifier.predict([[.45, .2, .5], [.25, .8, .9],[.1, .1, .9]])
print(guess)

----------------------------------------------------------------------
15/12/2018

BAYES' THEOREM
Introduction to Bayes' Theorem

/*In this lesson, we'll learn about Bayes' Theorem. Bayes' Theorem is the basis of a branch of statistics 
called Bayesian Statistics, where we take prior knowledge into account before calculating new probabilities.

This allows us to find narrow solutions from a huge universe of possibilities. 
British mathematician Alan Turing used it to crack the German Enigma code during WWII. And now it is used in:

Machine Learning
Statistical Modeling
A/B Testing
Robotics
By the end of this lesson, you'll be able to solve simple problems involving prior knowledge.*/

+++++++++++++++++++++++++++++++++

#BAYES' THEOREM
Independent Events

/*The ability to determine whether two events are independent is an important skill for statistics.

If two events are independent, then the occurrence of one event does not affect the probability of the other event. 
Here are some examples of independent events:

I wear a blue shirt; my coworker wears a blue shirt
I take the subway to work; I eat sushi for lunch
The NY Giants win their football game; the NY Rangers win their hockey game
If two events are dependent, then when one event occurs, the probability of the other event occurring changes 
in a predictable way.

Here are some examples of dependent events:

It rains on Tuesday; I carry an umbrella on Tuesday
I eat spaghetti; I have a red stain on my shirt
I wear sunglasses; I go to the beach*/

++++++++++++++++++++++++++++++++++++

#BAYES' THEOREM
Conditional Probability

/*Conditional probability is the probability that two events happen. 
It's easiest to calculate conditional probability when the two events are independent.

Note: For the rest of this lesson, we'll be using the statistical convention that the probability 
of an event is written as P(event).

If the probability of event A is P(A) and the probability of event B is P(B) and the two events are independent, 
then the probability of both events occurring is the product of the probabilities:

P(A ∩ B) = P(A)×P(B)
The symbol ∩ just means "and", so P(A ∩ B) means the probability that both A and B happen.

*/

import numpy as np

#1.This week, there is a 30% probability that it will rain on any given day. At a certain high school, gym class is held on three days out of the five day school week.
#On a school day, what is the probability that it is raining and the students have gym class?
#Save your answer to the variable p_rain_and_gym.
p_rain_and_gym = 0.3*0.6


+++++++++++++++++++++++++++++++

#BAYES' THEOREM
Testing for a Rare Disease

/*Suppose you are a doctor and you need to test if a patient has a certain rare disease. 
The test is very accurate: it's correct 99% of the time. The disease is very rare: only 1 in 100,000 patients have it.

You administer the test and it comes back positive, so your patient must have the disease, right?

Not necessarily. If we just consider the test, there is only a 1% chance that it is wrong, 
but we actually have more information: we know how rare the disease is.

Given that the test came back positive, there are two possibilities:

The patient had the disease, and the test correctly diagnosed the disease.
The patient didn't have the disease and the test incorrectly diagnosed that they had the disease.*/

import numpy as np

#1.What is the probability that the patient had the disease and the test correctly diagnosed the disease?
#Save your answer to the variable p_disease_and_correct.
# P(test correct) = 1 - 0.01
# P(disease) = 1.0 / 100000
p_disease_and_correct = (1 - 0.01) * (1.0 / 100000)

print p_disease_and_correct

#2.What is the probability that the patient does not have the disease and the test incorrectly diagnosed the disease?
#Save your answer to the variable p_no_disease_and_incorrect.
# P(test incorrect) = 0.01
# P(no disease) = 1 - (1.0 / 100000)
p_no_disease_and_incorrect = 0.01 * (1 - (1.0 / 100000))

print p_no_disease_and_incorrect

+++++++++++++++++++++++++++++++++++++++++++++++

#BAYES' THEOREM
#Bayes' Theorem

/*In the previous exercise, we determined two probabilities:

The patient had the disease, and the test correctly diagnosed the disease ≈ 0.00001
The patient didn't have the disease and the test incorrectly diagnosed that they had the disease ≈ 0.01
Both events are rare, but we can see that it was about 1,000 times more likely that the test was incorrect 
than that the patient had this rare disease.

We're able to come to this conclusion because we had more information than just the accuracy of the test; 
we also knew the prevalence of this disease. That extra information about how we expect the world to work is called 
a prior.

When we only use the first piece of information (the result of the test), 
it's called a Frequentist Approach to statistics. When we incorporate our prior, it's called a Bayesian Approach.

In statistics, if we have two events (A and B), we write the probability that event A will happen, 
given that event B already happened as P(A|B). In our example, we want to find P(rare disease | positive result). 
In other words, we want to find the probability that the patient has the disease given the test came back positive.

We can calculate P(A|B) using Bayes' Theorem, which states:

P(A|B) = {P(B|A)*P(A)}/P(B)

It is important to note that on the right side of the equation, we have the term P(B|A). 
This is the probability that event B will happen given that event A has already happened. 
This is very different from P(A|B), which is the probability we are trying to solve for. The order matters!*/

import numpy as np

#1.Calculate P(positive result | rare disease), or the probability of a positive test result, given that a patient really has this rare disease.
#Save your answer (as a decimal) to p_positive_given_disease.
p_positive_given_disease = (0.99 * (.00001))/ (1./100000.)
print(p_positive_given_disease)

#2.What is P(rare disease), the probability that a randomly selected patient has the rare disease?
#Save your answer to p_disease.
p_disease = 1./100000.
print(p_disease)

#We now need to compute the denominator; we need to find P(positive result).
#As we discussed previously, there are two ways to get a positive result:
#The patient had the disease, and the test correctly diagnosed the disease.The patient didn't have the disease and the test incorrectly diagnosed that they had the disease.
#Using these two probabilities, calculate the total probability that a randomly selected patient receives a positive test result, P(positive result).
#Save your answer to the variable p_positive.
p_positive = (0.00001) + (0.01) 
print(p_positive)

#4.Substitute all three of these values into Bayes' Theorem and calculate P(rare disease | positive result).
#Save your result as p_disease_given_positive.
p_disease_given_positive = (p_positive_given_disease) * (p_disease) / (p_positive)

#5.Print p_disease_given_positive.
#Is it likely that your patient has this disease?
print(p_disease_given_positive)

"""
0.99
1e-05
0.01001
0.000989010989011"""

++++++++++++++++++++++++++++++++++++++++++++++++

/*BAYES' THEOREM
Spam Filters

Let's explore a different example. Email spam filters use Bayes' Theorem to determine if certain words 
indicate that an email is spam.

Let's a take word that often appears in spam: "enhancement".

With just 3 facts, we can make some preliminary steps towards a good spam filter:

"enhancement" appears in just 0.1% of non-spam emails
"enhancement" appears in 5% of spam emails
Spam emails make up about 20% of total emails
Given that an email contains "enhancement", what is the probability that the email is spam?*/

import numpy as np

a = 'spam'
b = 'enhancement'

p_spam = 0.2
p_enhancement_given_spam = 0.05
p_enhancement = 0.05 * 0.2 + 0.001 * (1 - 0.2)
p_spam_enhancement = p_enhancement_given_spam * p_spam / p_enhancement

print p_spam_enhancement #0.925925925926

----------------------------------------------------------------------------------------
16/12/2108

NAIVE BAYES CLASSIFIER
The Naive Bayes Classifier

/*A Naive Bayes classifier is a supervised machine learning algorithm that leverages Bayes' Theorem to make predictions
and classifications. Recall Bayes' Theorem:


This equation is finding the probability of A given B. This can be turned into a classifier if we replace B with 
a data point and A with a class. For example, let's say we're trying to classify an email as either spam or not spam.
 We could calculate P(spam | email) and P(not spam | email). Whichever probability is higher 
 will be the classifier's prediction. Naive Bayes classifiers are often used for text classification.

So why is this a supervised machine learning algorithm? In order to compute the probabilities used in Bayes' theorem, 
we need previous data points. For example, in the spam example, we'll need to compute P(spam). 
This can be found by looking at a tagged dataset of emails and finding the ratio of spam to non-spam emails.

*/

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

NAIVE BAYES CLASSIFIER
Investigate the Data

/*In this lesson, we are going to create a Naive Bayes classifier that can predict whether a review for 
a product is positive or negative. This type of classifier could be extremely helpful for a company 
that is curious about the public reaction to a new product. Rather than reading thousands of reviews or tweets 
about the product, you could feed those documents into the Naive Bayes classifier 
and instantly find out how many are positive and how many are negative.

The dataset we will be using for this lesson contains Amazon product reviews for baby products. 
The original dataset contained many different features including the reviewer's name, the date the review was made,
 and the overall score. We’ve removed many of those features; the only features that we’re interested in 
 are the text of the review and whether the review was "positive" or "negative". 
 We labeled all reviews with a score less than 4 as a negative review.

Note that in the next two lessons, we've only imported a small percentage of the data to help the code run faster. 
We'll import the full dataset later when we put everything together!*/

from reviews import neg_list, pos_list, neg_counter, pos_counter

#1. Let's look at the data given to us. Print pos_list[0]. Would you classify this review as positive or negative
print(pos_list[0])

#2. Take a look at the first review in neg_list as well. Doest that one look negative
print(neg_list[0])

#3. We've also created a Counter object for all of the positive reviews and one for all of the negative reviews. These couters are like Python dictionaries -you could find the number of times the word "baby" was used in the positve reviews by printing pos_counter['baby']
#Print the number of times the word "no" was used in the positive and negative reviews. In which set was it used more often?
print(pos_counter["baby"])
print(pos_counter["no"])
print(neg_counter["no"])

+++++++++++++++++++++++++++++++++++++++++++++++++++++
NAIVE BAYES CLASSIFIER
Bayes Theorem I

/*For the rest of this lesson, we’re going to write a classifier that can predict whether the review 
"This crib was amazing" is a positive or negative review. We want to compute both P(positive | review) 
and P(negative | review) and find which probability is larger. To do this, we’ll be using Bayes' Theorem. 

Let’s look at Bayes' Theorem for P(positive | review).
The first part of Bayes' Theorem that we are going to tackle is P(positive). 
This is the probability that any review is positive. To find this, we need to look at all of our reviews 
in our dataset - both positive and negative - and find the percentage of reviews that are positive.

We've bolded the part of Bayes' Theorem we're working on.
*/
from reviews import neg_list, pos_list, neg_counter, pos_counter

#1. Finding the total number of positive reviews by finding the length of pos_list. Do the same for neg_list
#Add those two numbers together and save the sum in a variable called total_reviews
total_reviews = len(pos_list) + len(neg_list)

#2. Create variables named percent_pos and percent_neg. percent_pos should be the number of positive reviews divided by total_reviews. Do the same for percent_neg
percent_pos = len(pos_list)/ total_reviews
percent_neg = len(neg_list)/ total_reviews

#3. Print percent_pos and percent_neg. they should add up to 1
print(percent_pos)
print(percent_neg)

+++++++++++++++++++++++++++++++++++++++++++++

NAIVE BAYES CLASSIFIER
Bayes Theorem II

/*Let's continue to try to classify the review "This crib was amazing".

The second part of Bayes' Theorem is a bit more extensive. We now want to compute P(review | positive).
	 
In other words, if we assume that the review is positive, what is the probability that the words 
"This", "crib", "was", and "amazing" are the only words in the review?

To find this, we have to assume that each word is conditionally independent. 
This means that one word appearing doesn't affect the probability of another word from showing up. 
This is a pretty big assumption!

We now have this equation. You can scroll to the right to see the full equation.

Let’s break this down even further by looking at one of these terms.
 P("crib"|positive) is the probability that the word "crib" appears in a positive review. 
 To find this, we need to count up the total number of times "crib" appeared in our dataset of positive reviews. 
 If we take that number and divide it by the total number of words in our positive review dataset, 
 we will end up with the probability of "crib" appearing in a positive review.

If we do this for every word in our review and multiply the results together, we have P(review | positive).*/

from reviews import neg_counter, pos_counter

review = "This crib was amazing"

percent_pos = 0.5
percent_neg = 0.5

#1. Let's first find the total number of words in all positive reviews and store that number in a variable named total_pos
#To do this, we can use the built-in Python sum() function. sum() takes a list as an parameter. The list that you want to sum is the values of the dictionary pos_counter, which you can get by using pos_couner.values()
#Do the same for total_neg
total_pos = sum(pos_counter.values())
total_neg = sum(neg_counter.values())

#2. Create two variables named pos_probability and neg_probability and. Each of these variables should start at 1. These are the varibales we are going to use to keep track of the probabilites
pos_probability  = 1
neg_probability = 1

#3. Create a list of the words in review and store it in a variable named review_words. You can do this by using Python's split function
review_words = review.split()

#4.Loop through every word in review_words. Find the number of times word appears in pos_counter and neg_counter. Store those values in variables named word_in_pos and word_in_neg
for word in review_words:
  word_in_pos = pos_counter[word]
  word_in_neg = neg_counter[word]
  
  #5. Inside the for loop, set pos_probability to be pos_probability multiplied by word_in_pos/total_pos
  pos_probability = pos_probability*word_in_pos/ total_pos
  neg_probability  *= word_in_neg / total_neg
  
#6
print(pos_probability)
print(neg_probability)
  
+++++++++++++++++++++++++++++++++++++++++
NAIVE BAYES CLASSIFIER
Smoothing

/*In the last exercise, one of the probabilities that we computed was the following:
	 
But what happens if "crib" was never in any of the positive reviews in our dataset? 
This fraction would then be 0, and since everything is multiplied together, the entire probability P(review | positive) would become 0.

This is especially problematic if there are typos in the review we are trying to classify. 
If the unclassified review has a typo in it, it is very unlikely that that same exact typo will be in the dataset, 
and the entire probability will be 0. To solve this problem, we will use a technique called smoothing.

In this case, we smooth by adding 1 to the numerator of each probability and N to the denominator of each probability. 
N is the number of unique words in our review dataset.  
*/

from reviews import neg_counter, pos_counter

review = "This cribb was amazing"

percent_pos = 0.5
percent_neg = 0.5

total_pos = sum(pos_counter.values())
total_neg = sum(neg_counter.values())

pos_probability = 1
neg_probability = 1

review_words = review.split()

for word in review_words:
  word_in_pos = pos_counter[word]
  word_in_neg = neg_counter[word]
  
  #2. Inside your for loop, when you multiply ...by a fraction, add 1 to the numerator
  #Make sure to include parentheses around the numberator 
  
  #3. In the denominator of those fractions, add the number of unique words in the appropriate dataset
  
  pos_probability *= (word_in_pos + 1) / (total_pos + len(pos_counter))
  neg_probability *= (word_in_neg + 1) / (total_neg + len(neg_counter))
  
print(pos_probability)
print(neg_probability)

#1. Let's demonstrate how these probabilites break if there's a word that never appears in the given datasets
#Change review to " This cribb was amazing". Notice the second b in cribb

++++++++++++++++++++++++++++++++++++

NAIVE BAYES CLASSIFIER
Classify

/*If we look back to Bayes' Theorem, we’ve now completed both parts of the numerator. 
We now need to multiply them together.

Let’s now consider the denominator P(review). In our small example, this is the probability that "This", "crib", 
"was", and "amazing" are the only words in the review. Notice that this is extremely similar to P(review | positive).
 The only difference is that we don’t assume that the review is positive.

However, before we start to compute the denominator, let’s think about what our ultimate question is. 
We want to predict whether the review "This crib was amazing" is a positive or negative review. 
In other words, we’re asking whether P(positive | review) is greater than P(negative | review). 
If we expand those two probabilities, we end up with the following equations.

	 
Notice that P(review) is in the denominator of each. That value will be the same in both cases! 
Since we’re only interested in comparing these two probabilities, there’s no reason why we need to 
divide them by the same value. We can completely ignore the denominator!

Let’s see if our review was more likely to be positive or negative!
*/
from reviews import neg_counter, pos_counter

review = "This crib was terrible"

percent_pos = 0.5
percent_neg = 0.5

total_pos = sum(pos_counter.values())
total_neg = sum(neg_counter.values())

pos_probability = 1
neg_probability = 1

review_words = review.split()

for word in review_words:
  word_in_pos = pos_counter[word]
  word_in_neg = neg_counter[word]
  
  pos_probability *= (word_in_pos + 1) / (total_pos + len(pos_counter))
  neg_probability *= (word_in_neg + 1) / (total_neg + len(neg_counter))
 
#1.After the for loop, multiply pos_probability by percent_pos and neg_probability by percent_neg. Store the two values in final_pos and final_neg and print both.
final_pos = pos_probability * percent_pos
final_neg = neg_probability * percent_neg

#2.Compare final_pos to final_neg:
#If final_pos was greater than final_neg, print "The review is positive".
#Otherwise print "The review is negative".
#Did our Naive Bayes Classifier get it right for the review "This crib was amazing"?
if final_pos > final_neg:
  print("The review is positive")
else:
  print("The review is negative")
  
 #3.Replace the review "This crib was amazing" with one that you think should be classified as negative. Run your program again.
#Did your classifier correctly classify the new review?  
    
++++++++++++++++++++++++++++++++++++++++++++++++++
NAIVE BAYES CLASSIFIER
Formatting the Data for scikit-learn

/*Congratulations! You've made your own Naive Bayes text classifier. 
If you have a dataset of text that has been tagged with different classes, you can give your classifier 
a brand new document and it will predict what class it belongs to.

We're now going to look at how Python's scikit-learn library can do all of that work for us!

In order to use scikit-learn's Naive Bayes classifier, we need to first transform our data into a format 
that scikit-learn can use. To do so, we're going to use scikit-learn's CountVectorizer object.

To begin, we need to create a CountVectorizer and teach it the vocabulary of the training set. 
This is done by calling the .fit() method.

For example, in the code below, we've created a CountVectorizer that has been trained on the vocabulary 
"Training", "review", "one", and "Second".

vectorizer = CountVectorizer()

vectorizer.fit(["Training review one", "Second review"])
After fitting the vectorizer, we can now call its .transform() method. The .transform() method takes 
a list of strings and will transform those strings into counts of the trained words. Take a look at the code below.

counts = vectorizer.transform(["one review two review"])
counts now stores the array [2, 1, 0, 0]. The word "review" appeared twice, the word "one" appeared once, 
and neither "Training" nor "Second" appeared at all.

But how did we know that the 2 corresponded to review? You can print vectorizer.vocabulary_ to see the index 
that each word corresponds to. It might look something like this:

{'one': 1, 'Training': 2, 'review': 0, 'Second': 3}
Finally, notice that even though the word "two" was in our new review, there wasn't an index for it in the vocabulary. 
This is because "two" wasn't in any of the strings used in the .fit() method.

We can now usecounts as input to our Naive Bayes Classifier.

Note that in the code in the editor, we've imported only a small percentage of our review dataset to make load times 
faster. We'll import the full dataset later when we put all of the pieces together!


*/

from reviews import neg_list, pos_list
from sklearn.feature_extraction.text import CountVectorizer

review = "This crib was amazing"

#1.Create a CountVectorizer and name it counter.
counter = CountVectorizer()

#2.Call counter's .fit() method. .fit() takes a list of strings and it will learn the vocabulary of those strings. We want our counter to learn the vocabulary from both neg_list and pos_list.
#Call .fit() using neg_list + pos_list as a parameter.
counter.fit(neg_list + pos_list)
print(counter.vocabulary_)

#3.Print counter.vocabulary_. This is the vocabulary that your counter just learned. The numbers associated with each word are the indices of each word when you transform a review.

#4.Let's transform our brand new review. Create a variable named review_counts and set it equal to counter's .transform() function. Remember, .transform() takes a list of strings to transform. So call .transform() using [review] as a parameter.
#Print review_counts.toarray(). If you don't include the toarray(), review_counts won't print in a readable format.
#It looks like this is an array of all 0s, but the indices that correspond to the words "this", "crib", "was", and "amazing" should all be 1.
review_counts = counter.transform([review])
print(review_counts.toarray())

#5.We'll use review_counts as the test point for our Naive Bayes Classifier, but we also need to transform our training set.
#Our training set is neg_list + pos_list. Call .transform() using that as a parameter. Store the results in a variable named training_counts. We'll use these variables in the next exercise.
training_counts = counter.transform(neg_list + pos_list)

--------------------------------------------------------------
17/12/2018

NAIVE BAYES CLASSIFIER
Review

/*In this lesson, you’ve learned how to leverage Bayes' Theorem to create a supervised machine learning algorithm. Here are some of the major takeaways from the lesson:

A tagged dataset is necessary to calculate the probabilities used in Bayes' Theorem.
In this example, the features of our dataset are the words used in a product review. In order to apply Bayes' Theorem, we assume that these features are independent.
Using Bayes' Theorem, we can find P(class|data point) for every possible class. In this example, there were two classes — positive and negative. The class with the highest probability will be the algorithm’s prediction.
Even though our algorithm is running smoothly, there’s always more that we can add to try to improve performance. The following techniques are focused on ways in which we process data before feeding it into the Naive Bayes classifier:

Remove punctuation from the training set. Right now in our dataset, there are 702 instances of "great!" and 2322 instances of "great.". We should probably combine those into 3024 instances of "great".
Lowercase every word in the training set. We do this for the same reason why we remove punctuation. We want "Great" and "great" to be the same.
Use a bigram or trigram model. Right now, the features of a review are individual words. For example, the features of the point "This crib is great" are "This", "crib", "is", and "great". If we used a bigram model, the features would be "This crib", "crib is", and "is great". Using a bigram model makes the assumption of independence more reasonable.
These three improvements would all be considered part of the field Natural Language Processing.

You can find the baby product review dataset, along with many others, on Dr. Julian McAuley's website.
*/
from reviews import baby_counter, baby_training, instant_video_counter, instant_video_training, video_game_counter, video_game_training
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB

review = "this game was violent"

baby_review_counts = baby_counter.transform([review])
instant_video_review_counts = instant_video_counter.transform([review])
video_game_review_counts = video_game_counter.transform([review])

baby_classifier = MultinomialNB()
instant_video_classifier = MultinomialNB()
video_game_classifier = MultinomialNB()

baby_labels = [0] * 1000 + [1] * 1000
instant_video_labels = [0] * 1000 + [1] * 1000
video_game_labels = [0] * 1000 + [1] * 1000


baby_classifier.fit(baby_training, baby_labels)
instant_video_classifier.fit(instant_video_training, instant_video_labels)
video_game_classifier.fit(video_game_training, video_game_labels)

print("Baby training set: " +str(baby_classifier.predict_proba(baby_review_counts)))
print("Amazon Instant Video training set: " + str(instant_video_classifier.predict_proba(instant_video_review_counts)))
print("Video Games training set: " + str(video_game_classifier.predict_proba(video_game_review_counts)))

/*Baby training set: [[0.4980342 0.5019658]]
Amazon Instant Video training set: [[0.77906497 0.22093503]]
Video Games training set: [[0.32653528 0.67346472]]"""
*/

---------------------------------------------------------------

K-MEANS CLUSTERING
Introduction to Clustering

/*Often, the data you encounter in the real world won't have flags attached and won't provide labeled answers 
to your question. Finding patterns in this type of data, unlabeled data, is a common theme 
in many machine learning applications. Unsupervised Learning is how we find patterns and structure in these data.

Clustering is the most well-known unsupervised learning technique. It finds structure in unlabeled data
 by identifying similar groups, or clusters. Examples of clustering applications are:

Recommendation engines: group products to personalize the user experience
Search engines: group news topics and search results
Market segmentation: group customers based on geography, demography, and behaviors
Image segmentation: medical imaging or road scene segmentation on self-driving cars
Let's get started!*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np 

from os.path import join, dirname, abspath
from mpl_toolkits.mplot3d import Axes3D

from sklearn.cluster import KMeans
from sklearn import datasets

iris = datasets.load_iris()

x = iris.data
y = iris.target

fignum = 1

# Plot the ground truthd

fig = plt.figure(fignum, figsize=(4, 3))

ax = Axes3D(fig, rect=[0, 0, .95, 1], elev=48, azim=134)

for name, label in [('Zombies', 0),
                    ('Programmers', 1),
                    ('Vampires', 2)]:
    ax.text3D(x[y == label, 3].mean(),
              x[y == label, 0].mean(),
              x[y == label, 2].mean() + 2, name,
              horizontalalignment='center',
              bbox=dict(alpha=.2, edgecolor='w', facecolor='w'))

# Reorder the labels to have colors matching the cluster results

y = np.choose(y, [1, 2, 0]).astype(np.float)
ax.scatter(x[:, 3], x[:, 0], x[:, 2], c=y, edgecolor='k')

ax.w_xaxis.set_ticklabels([])
ax.w_yaxis.set_ticklabels([])
ax.w_zaxis.set_ticklabels([])

ax.set_xlabel('hates sunlight')
ax.set_ylabel('likes garlic')
ax.set_zlabel('canine teeth (in)')

ax.set_title('')
ax.dist = 12

# Add code here:
plt.show()

+++++++++++++++++++++++++++++++++++++++++++++++++

K-MEANS CLUSTERING
K-Means Clustering

/*The goal of clustering is to separate data so that data similar to one another are in the same group, 
while data different from one another are in different groups. So two questions arise:

How many groups do we choose?
How do we define similarity?
K-Means is the most popular and well-known clustering algorithm, and it tries to address these two questions.

The "K" refers to the number of clusters (groups) we expect to find in a dataset.
The "Means" refers to the average distance of data to each cluster center, also known as the centroid,
 which we are trying to minimize.
It is an iterative approach:

Place k random centroids for the initial clusters.
Assign data samples to the nearest centroid.
Update centroids based on the above-assigned data samples.
Repeat Steps 2 and 3 until convergence (when points don't move between clusters and centroids stabilize).

Once we are happy with our clusters, we can take a new unlabeled datapoint and
 quickly assign it to the appropriate cluster.

Instructions
In this lesson, we will first implement K-Means the hard way (to help you understand the algorithm) 
and then the easy way using the sklearn library!*/

+++++++++++++++++++++++++++++++++

K-MEANS CLUSTERING
Iris Dataset

/*Before we implement the K-means algorithm, let's find a dataset. The sklearn package embeds some datasets 
and sample images. One of them is the Iris dataset.

The Iris dataset consists of measurements of sepals and petals of 3 different plant species:

Iris setosa
Iris versicolor
Iris virginica

The sepal is the part that encases and protects the flower when it is in the bud stage. 
A petal is a leaflike part that is often colorful.
We call each piece of data a sample. For example, each flower is one sample.

Each characteristic we are interested in is a feature. For example, petal length is a feature of this dataset.

The features of the dataset are:

Column 0: Sepal length
Column 1: Sepal width
Column 2: Petal length
Column 3: Petal width
The 3 species of Iris plants are what we are going to cluster later in this lesson.*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt

#1. Import the datasets module and load the Iris data
from sklearn import datasets
iris = datasets.load_iris()

#2.Every dataset from sklearn comes with a bunch of different information (not just the data) and is stored in a similar fashion. First, let's take a look at the most important thing, the sample data:
#First, let's take a look at the most important thing, the sample data:Each row is a plant!
print(iris.data)

#3.Since the datasets in sklearn datasets are used for practice, they come with the answers (target values) in the target key:
#Take a look at the target values:The iris.target values give the ground truth for the Iris dataset. Ground truth, in this case, is the number corresponding to the flower that we are trying to learn.
print(iris.target)

#4.It is always a good idea to read the descriptions of the data:Expand the terminal (right panel): When was the Iris dataset published? What is the unit of measurement?
print(iris.DESCR)

++++++++++++++++++++++++++++

K-MEANS CLUSTERING
Visualize Before K-Means

/*To get a better sense of the data in the iris.data matrix, let's visualize it!

With Matplotlib, we can create a 2D scatter plot of the Iris dataset using two of its features 
(sepal length vs. petal length). The sepal length measurements are stored in column 0 of the matrix,
 and the petal length measurements are stored in column 2 of the matrix.

But how do we get these values?

Suppose we only want to retrieve the values that are in column 0 of a matrix, we can use 
the NumPy/Pandas notation [:,0] like so:

matrix[:,0]
[:,0] can be translated to [all_rows , column_0]

Once you have the measurements we need, we can make a scatter plot by:

plt.scatter(x, y)
To show the plot:

plt.show()
Let's try this! But this time, plot the sepal length (column 0) vs. sepal width (column 1) instead.
*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt

from sklearn import datasets

iris = datasets.load_iris()

#1. Store iris.data in a variable named samples.
samples = iris.data

# 2.Create a list named x that contains the column 0 values of samples. Create a list named y that contains the column 1 values of samples.
x = samples[:,0]
y = samples[:,1]

# Use the .scatter() function to create a scatter plot of x and y. Because some of the data samples have the exact same features, let's add alpha=0.5:
plt.scatter(x, y, alpha = 0.5)
# Show the plot
plt.xlabel('sepal length (cm)')
plt.ylabel('petal length (cm)')
plt.show()

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
18/12/2018

K-MEANS CLUSTERING
Implementing K-Means: Step 1
The K-Means algorithm:

/*Place k random centroids for the initial clusters.
Assign data samples to the nearest centroid.
Update centroids based on the above-assigned data samples.
Repeat Steps 2 and 3 until convergence.

After looking at the scatter plot and having a better understanding of the Iris data, 
let's start implementing the K-Means algorithm.

In this exercise, we will implement Step 1.

Because we expect there to be three clusters (for the three species of flowers), 
let's implement K-Means where the k is 3.

Using the NumPy library, we will create 3 random initial centroids and plot them along with our samples.*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets

iris = datasets.load_iris()

samples = iris.data

x = samples[:,0]
y = samples[:,1]

# Number of clusters
#1. First, create a variable named k and set it to 3
k=3

#2. Then, use NumPy's random.uniform() function to generate random values in two lists: a centroids_x list that will have k random values between min(x) and max(x). The centroids_x will have the x-values for our initial random centroids.
# Create x coordinates of k random centroids
centroids_x = np.random.uniform(min(x),max(x),size=k)
# Create y coordinates of k random centroids
centroids_y = np.random.uniform(min(y),max(y),size=k)

# Create centroids array
#3. Create an array named centroids and use the zip() function to add centroids_x and centroids_y to it. The centroids list should now have all the initial centroids
centroids = np.array(list(zip(centroids_x, centroids_y)))
print(centroids)

#4. Make a scatter plot of y vs x. Make a scatter plot of centroids_y vs centroids_x. Show the lots to see your centroids!
plt.scatter(x,y)
plt.scatter(centroids_x, centroids_y)
plt.show()

+++++++++++++++++++++++++++++++++++++++++++++=
K-MEANS CLUSTERING
Implementing K-Means: Step 2
The K-Means algorithm:

/*Place k random centroids for the initial clusters.
Assign data samples to the nearest centroid.
Update centroids based on the above-assigned data samples.
Repeat Steps 2 and 3 until convergence.

In this exercise, we will implement Step 2.

Now we have the 3 random centroids. Let's assign data points to their nearest centroids.

To do this we're going to use the Distance Formula to write a distance() function. Then, we are going to iterate through our data samples and compute the distance from each data point to each of the 3 centroids.

Suppose we have a point and a list of three distances in distances and it looks like [15, 20, 5], then we would want to assign the data point to the 3rd centroid. The argmin(distances) would return the index of the lowest corresponding distance, 2, because the index 2 contains the minimum value.
*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets

iris = datasets.load_iris()

samples = iris.data

x = samples[:,0]
y = samples[:,1]

sepal_length_width = np.array(list(zip(x, y)))

# Step 1: Place K random centroids

k = 3

centroids_x = np.random.uniform(min(x), max(x), size=k)
centroids_y = np.random.uniform(min(y), max(y), size=k)

centroids = np.array(list(zip(centroids_x, centroids_y)))

# Step 2: Assign samples to nearest centroid

# Distance formula
#1. Write a distance() function. It should be able to take in a and b and return the distance between the two points
def distance(a,b):
  one =(a[0] -b[0])**2
  two =(a[1] -b[1])**2
  distance = (one + two)**0.5
  return distance 

#2. Create an array called labels that will hold the cluster labels for each data point. Its size should be the length of the data sample
#Create an array called distances that will hold the distances for each centroid. It should have the size of k
# Cluster labels for each point (either 0, 1, or 2)
labels = np.zeros(len(samples))
# Distances to each centroid
distances = np.zeros(k)

#4. To assign each data point to the closest centroi, we need to iterate through the whold data sample and calculate each data point's distance to each centroid. When we can get the index of the smallest distance of distances by doing. Then, assign the cluster to each index of the labels array
# Assign to the closest centroid

for i in range(len(samples)):
  distances[0] = distance(sepal_length_width[i], centroids[0])
  distances[1] = distance(sepal_length_width[i], centroids[1])
  distances[2] = distance(sepal_length_width[i], centroids[2])
  cluster = np.argmin(distances)
  labels[i] = cluster

  #5. Then, print labels (outside of the for loop). Awesome!, You have just finished Step 2 of the K-means algorithm
# Print labels
print(labels)

++++++++++++++++++++++++++++++++++++++++++
K-MEANS CLUSTERING
Implementing K-Means: Step 3
The K-Means algorithm:

/*Place k random centroids for the initial clusters.
Assign data samples to the nearest centroid.
Update centroids based on the above-assigned data samples.
Repeat Steps 2 and 3 until convergence.

In this exercise, we will implement Step 3.

Find new cluster centers by taking the average of the assigned points. To find the average of the assigned points,
 we can use the .mean() function*/

 import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets
from copy import deepcopy

iris = datasets.load_iris()

samples = iris.data
samples = iris.data

x = samples[:,0]
y = samples[:,1]

sepal_length_width = np.array(list(zip(x, y)))

# Step 1: Place K random centroids

k = 3

centroids_x = np.random.uniform(min(x), max(x), size=k)
centroids_y = np.random.uniform(min(y), max(y), size=k)

centroids = np.array(list(zip(centroids_x, centroids_y)))

# Step 2: Assign samples to nearest centroid

def distance(a, b):
  one = (a[0] - b[0]) **2
  two = (a[1] - b[1]) **2
  distance = (one+two) ** 0.5
  return distance

# Cluster labels for each point (either 0, 1, or 2)
labels = np.zeros(len(samples))

# Distances to each centroid
distances = np.zeros(k)

for i in range(len(samples)):
  distances[0] = distance(sepal_length_width[i], centroids[0])
  distances[1] = distance(sepal_length_width[i], centroids[1])
  distances[2] = distance(sepal_length_width[i], centroids[2])
  cluster = np.argmin(distances)
  labels[i] = cluster

# Step 3: Update centroids
#Save the old centroids value before updating. We have already imported deepcopy for you. Store centroids into centroids_old using deepcopy()
centroids_old = deepcopy(centroids)

#2. Then, create a for loop that iterates k times
#Sicne k =3, as we are iterating through the for loop each time, we can calculate mean of the points that have the same cluster label.
#Inside the for loop, create an array named points where we get all the data points that have the cluster label i. There are two ways to do this, check the hints to see both!
for i in range(k):
  points = [sepal_length_width[j] for j in range(len(sepal_length_width)) if labels[j] == i]

  /*points = []
  for j in range(len(sepal_length_width)):
    if labels[j] == i:
      points.append(sepal_length_width[j])*/
  
  #3.Then (still inside the for loop), calculate the mean of those points using .mean() to get the new centroid.Store the new centroid in centroids[i].
  centroids[i] = np.mean(points, axis=0)
  
#4.  Oustide of the for loop, print centroids_old and centroids to see how centroids changed.
print(centroids_old)
print(centroids)  
  
+++++++++++++++++++++++++++++++++++++++++++
K-MEANS CLUSTERING
Implementing K-Means: Step 4
The K-Means algorithm:

/*Place k random centroids for the initial clusters.
Assign data samples to the nearest centroid.
Update centroids based on the above-assigned data samples.
Repeat Steps 2 and 3 until convergence.

In this exercise, we will implement Step 4.

This is the part of the algorithm where we repeatedly execute Step 2 and 3 until the centroids stabilize (convergence).

We can do this using a while loop. And everything from Step 2 and 3 goes inside the loop.

For the condition of the while loop, we need to create an array named errors. In each error index, we calculate the difference between the updated centroid (centroids) and the old centroid (centroids_old).

The loop ends when all three values in errors are 0.*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets
from copy import deepcopy

iris = datasets.load_iris()

samples = iris.data

x = samples[:,0]
y = samples[:,1]

sepal_length_width = np.array(list(zip(x, y)))

# Step 1: Place K random centroids

k = 3

centroids_x = np.random.uniform(min(x), max(x), size=k)
centroids_y = np.random.uniform(min(y), max(y), size=k)

centroids = np.array(list(zip(centroids_x, centroids_y)))

def distance(a, b):
  one = (a[0] - b[0]) ** 2
  two = (a[1] - b[1]) ** 2
  distance = (one + two) ** 0.5
  return distance

# To store the value of centroids when it updates
centroids_old = np.zeros(centroids.shape)

# Cluster labeles (either 0, 1, or 2)
labels = np.zeros(len(samples))

distances = np.zeros(3)

# Initialize error:
#1. initialize error. Then, use the distance() function to calculate the distance between the updated centroid and the old centroid and put them in error
error = np.zeros(3)

error[0] = distance(centroids[0], centroids_old[0])
error[1] = distance(centroids[1], centroids_old[1])
error[2] = distance(centroids[2], centroids_old[2])

# Repeat Steps 2 and 3 until convergence:
#2.After that, add a while loop. And move everything below (from Step 2 and 3) inside. And recalculate error again at the end of each iteration of the while loop:
while error.all() != 0:

  # Step 2: Assign samples to nearest centroid

  for i in range(len(samples)):
    distances[0] = distance(sepal_length_width[i], centroids[0])
    distances[1] = distance(sepal_length_width[i], centroids[1])
    distances[2] = distance(sepal_length_width[i], centroids[2])
    cluster = np.argmin(distances)
    labels[i] = cluster

  # Step 3: Update centroids

  centroids_old = deepcopy(centroids)

  for i in range(3):
    points = [sepal_length_width[j] for j in range(len(sepal_length_width)) if labels[j] == i]
    centroids[i] = np.mean(points, axis=0)
  
  error[0] = distance(centroids[0], centroids_old[0])
  error[1] = distance(centroids[1],   centroids_old[1])
  error[2] = distance(centroids[2], centroids_old[2])
  
#3. Awesome, now you have everything, let's visualize it. After the while loop finishes, let's create an array of colors:Then, create a for loop that iterates k times.
#Inside the for loop (similar to what we did in the last exercise), create an array named points where we get all the data points that have the cluster label i.
#Then we are going to make a scatter plot of points[:, 0] vs points[:, 1] using the scatter() function:
colors = ['r', 'g', 'b']

for i in range(k):
  points = np.array([sepal_length_width[j] for j in range(len(samples)) if labels[j] == i])
  plt.scatter(points[:, 0], points[:, 1], c=colors[i], alpha=0.5)

  #4.Then, paste the following code at the very end. Here, we are visualizing all the points in each of the labels a different color.
plt.scatter(centroids[:, 0], centroids[:, 1], marker='D', s=150)

plt.xlabel('sepal length (cm)')
plt.ylabel('petal length (cm)')

plt.show()

+++++++++++++++++++++++++++++++++++++++++++++++++++

K-MEANS CLUSTERING
Implementing K-Means: Scikit-Learn

/*Awesome, you have implemented K-Means clustering from scratch!

Writing an algorithm whenever you need it can be very time-consuming and you might make mistakes 
and typos along the way. We will now show you how to implement K-Means more efficiently
 – using the scikit-learn library.

Instead of implementing K-Means from scratch, the sklearn.cluster module has many methods that can do this for you.

To import KMeans from sklearn.cluster:

from sklearn.cluster import KMeans
For Step 1, use the KMeans() method to build a model that finds k clusters. To specify the number of clusters (k),
 use the n_clusters keyword argument:

model = KMeans(n_clusters = k)
For Steps 2 and 3, use the .fit() method to compute K-Means clustering:

model.fit(X)
After K-Means, we can now predict the closest cluster each sample in X belongs to. Use the .predict() method 
to compute cluster centers and predict cluster index for each sample:

model.predict(X)*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
from sklearn import datasets

#1. From sklearn.cluster, import Kmeans class
from sklearn.cluster import KMeans
iris = datasets.load_iris()

samples = iris.data

#2.Somewhere after samples = iris.data, use KMeans() to create an instance called model to find 3 clusters.To specify the number of clusters, use the n_clusters keyword argument.
#Use KMeans() to create a model that finds 3 clusters
model = KMeans(n_clusters=3)

#3. Next, use the .fit() method of model to fit the model to the array of points samples:
#Use .fit() to fit the model to samples
model.fit(samples)

#4.After you have the "fitted" model, determine the cluster labels of samples.
# Use .predict() to determine the labels of samples 
labels = model.predict(samples)
# Print the labels
print(labels)

+++++++++++++++++++++++++++++++++++++++++

K-MEANS CLUSTERING
New Data?


/*You used K-Means and found three clusters of the samples data. But it gets cooler!
Since you have created a model that computed K-Means clustering, you can now feed new data samples into it 
and obtain the cluster labels using the .predict() method.

So, suppose we went to the florist and bought 3 more Irises with the measurements:

[[ 5.1  3.5  1.4  0.2 ]
 [ 3.4  3.1  1.6  0.3 ]
 [ 4.9  3.   1.4  0.2 ]]
We can feed this new data into the model and obtain the labels for them.*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets
from sklearn.cluster import KMeans

iris = datasets.load_iris()

samples = iris.data

model = KMeans(n_clusters=3)

model.fit(samples)

#1. First, store the 2D matrix:To test if it worked, print the new_samples.
# Store the new Iris measurements
new_samples = np.array([[5.7, 4.4, 1.5, 0.4],
   [6.5, 3. , 5.5, 0.4],
   [5.8, 2.7, 5.1, 1.9]])
print(new_samples)

#2.Use the model to predict labels for the new_samples, and print the predictions.Those are the predicted labels for our three new flowers. If you are seeing different labels, don't worry! Since the cluster centroids are randomly initialized, running the model repeatedly can produce different clusters with the same input data.
# Predict labels for the new_samples
new_labels = model.predict(new_samples)
print(new_labels)

++++++++++++++++++++++++++++++++++++++++++++

K-MEANS CLUSTERING
Visualize After K-Means

/*We have done the following using sklearn library:

Load the embedded dataset
Compute K-Means on the dataset (where k is 3)
Predict the labels of the data samples
And the labels resulted in either 0, 1, or 2.

Let's finish it by making a scatter plot of the data again!

This time, however, use the labels numbers as the colors.

To edit colors of the scatter plot, we can set c = labels:

*/
import codecademylib3_seaborn
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.cluster import KMeans

iris = datasets.load_iris()

samples = iris.data

model = KMeans(n_clusters=3)

model.fit(samples)

labels = model.predict(samples)

print(labels)

# Make a scatter plot of x and y and using labels to define the colors
#1.Create an array called x that contains the Column 0 of samples. Create an array called y that contains the Column 1 of samples.
x = samples[:,0]
y = samples[:,1]

#2.Make a scatter plot of x and y, using labels to define the colors.
plt.scatter(x,y, c=labels, alpha =0.5)
plt.xlabel('sepal length (cm)')
plt.ylabel('petal lenght (cm)')
plt.show()

++++++++++++++++++++++++++++++++++++++

K-MEANS CLUSTERING
Evaluation


/*At this point, we have clustered the Iris data into 3 different groups (implemented using Python and using scikit-learn). But do the clusters correspond to the actual species? Let's find out!

First, remember that the Iris dataset comes with target values:

target = iris.target
It looks like:

[ 0 0 0 0 0 ... 2 2 2]
According to the metadata:

All the 0's are Iris-setosa
All the 1's are Iris-versicolor
All the 2's are Iris-virginica
Let's change these values into the corresponding species using the following code:

species = np.chararray(target.shape, itemsize=150)

for i in range(len(samples)):
  if target[i] == 0:
    species[i] = 'setosa'
  elif target[i] == 1:
    species[i] = 'versicolor'
  elif target[i] == 2: 
    species[i] = 'virginica'
Then we are going to use the Pandas library to perform a cross-tabulation.

Cross-tabulations enable you to examine relationships within the data that might not be readily apparent when analyzing total survey responses.

The result should look something like:

labels    setosa    versicolor    virginica
0             50             0            0
1              0             2           36
2              0            48           14
(You might need to expand this narrative panel in order to the read the table better.)

The first column has the cluster labels. The second to fourth columns have the Iris species that are clustered into each of the labels.

By looking at this, you can conclude that:

Iris-setosa was clustered with 100% accuracy.
Iris-versicolor was clustered with 96% accuracy.
Iris-virginica didn't do so well.
Follow the instructions below to learn how to do a cross-tabulation.*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets
from sklearn.cluster import KMeans
import pandas as pd

iris = datasets.load_iris()

samples = iris.data

target = iris.target

model = KMeans(n_clusters=3)

model.fit(samples)

labels = model.predict(samples)

# Code starts here:
#pandas is already imported for you:Add the code from the narrative to get the species array:
species = np.chararray(target.shape, itemsize=150)

for i in range(len(samples)):
  if target[i] == 0:
    species[i] = 'setosa'
  elif target[i] == 1:
    species[i] = 'veriscolor'
  elif target[i] == 2: 
    species[i] = 'virginica'

    #2.Then, create
df = pd.DataFrame({'labels': labels, 'species': species})

#3.Next, use the the crosstab() method to perform cross-tabulation:Expand the right panel (output terminal). How accurate are the clusters?
ct = pd.crosstab(df['labels'], df['species'])

print(ct)

++++++++++++++++++++++++++++++++++++++++++++++++++
K-MEANS CLUSTERING
The Number of Clusters

/*At this point, we have grouped the Iris plants into 3 clusters. But suppose we didn't know 
there are three species of Iris in the dataset, what is the best number of clusters? And how do we determine that?

Before we answer that, we need to define what is a good cluster?

Good clustering results in tight clusters, meaning that the samples in each cluster are bunched together.
 How spread out the clusters are is measured by inertia. Inertia is the distance from each sample to
  the centroid of its cluster. The lower the inertia is, the better our model has done.

You can check the inertia of a model by:

print(model.inertia_)
For the Iris dataset, if we graph all the ks (number of clusters) with their inertias:

Optimal Number of Clusters

Notice how the graph keeps decreasing.

Ultimately, this will always be a trade-off. The goal is to have low inertia and the least number of clusters.

One of the ways to interpret this graph is to use the elbow method: choose an "elbow" in the inertia plot
 - when inertia begins to decrease more slowly.

In the graph above, 3 is the optimal number of clusters.*/

import codecademylib3_seaborn
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn import datasets
from sklearn.cluster import KMeans

iris = datasets.load_iris()

samples = iris.data

# Code Start here:
#1. First, create two lists. num_cluster that has values from 1 to 8. inertias that is empty
num_clusters = range(1, 8)
inertias = []

#2.Then, iterate through num_clusters and calculate K-means for each number of clusters. Add each of their inertias into the inertias list
for k in num_clusters:
  model = KMeans(n_clusters=k)
  model.fit(samples)
  inertias.append(model.inertia_)
  
#3. Plot the inertias vs num_clusters  
plt.plot(num_clusters, inertias, '-o')

plt.xlabel('number of clusters (k)')
plt.ylabel('inertia')

plt.show()
