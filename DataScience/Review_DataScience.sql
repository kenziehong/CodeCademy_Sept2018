QUERIES
Review
Congratulations!

We just learned how to query data from a database using SQL. We also learned how to filter queries to make the information more specific and useful.

Let's summarize:

SELECT is the clause we use every time we want to query information from a database.
AS renames a column or table.
DISTINCT return unique values.
WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
LIKE and BETWEEN are special operators.
AND and OR combines multiple conditions.
ORDER BY sorts the result.
LIMIT specifies the maximum number of rows that the query will return.
CASE creates different outputs.

----------------------------------------------

AGGREGATE FUNCTIONS
Review
Congratulations!

You just learned how to use aggregate functions to perform calculations on your data. What can we generalize so far?

COUNT(): count the number of rows
SUM(): the sum of the values in a column
MAX()/MIN(): the largest/smallest value
AVG(): the average of the values in a column
ROUND(): round the values in the column
Aggregate functions combine multiple rows together to form a single value of more meaningful information.

GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
HAVING limit the results of a query based on an aggregate property

----------------------------------------------------------

WORKING WITH MULTIPLE DATAFRAMES
Review
This lesson introduced some methods for combining multiple DataFrames:

Creating a DataFrame made by matching the common columns of two DataFrames is called a merge
We can specify which columns should be matches by using the keyword arguments left_on and right_on
We can combine DataFrames whose rows don't all match using left, right, and outer merges and the how keyword argument
We can stack or concatenate DataFrames with the same columns using pd.concat

------------------------------------------------

MULTIPLE TABLES
Review
In this lesson, we learned about relationships between tables in relational databases and how to query information from multiple tables using SQL.

Let's summarize what we've learned so far:

JOIN will combine rows from different tables if the join condition is true.

LEFT JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.

Primary key is a column that serves a unique identifier for the rows in the table.

Foreign key is a column that contains the primary key to another table.

CROSS JOIN lets us combine all rows of one table with all rows of another table.

UNION stacks one dataset on top of another.

WITH allows us to define one or more temporary tables that can be used in the final query.

----------------------------------------------------
23/11/2018

INTRODUCTION TO NUMPY
Review
Let's take a second and review. In this lesson, you learned the basics of the NumPy package. Here are some key points:

Arrays are a special type of list that allows us to store values in an organized manner.
An array can be created by either defining it directly using np.array() or by importing a CSV using np.genfromtxt('file.csv', delimiter=',').
An operation (such as addition) can be performed on every element in an array by simply performing it on the array itself.
Elements can be selected from arrays using their index and array locations, both of which start at 0.
Logical operations can be used to create new, more focused arrays out of larger arrays.
The next lesson will explore how to analyze these arrays and use means, medians, and standard deviations to tell a story. But first, practice what you've learned by working through the following checkpoints.

--------------------------------------------------
24/11/2018

INTRODUCTION TO STATISTICS WITH NUMPY
Review
Let's review! In this lesson, you learned how to use NumPy to analyze single-variable datasets. Here's what we covered:

Using the np.sort method to locate outliers.
Calculating central positions of a dataset using np.mean and np.median.
Understanding the spread of our data using percentiles and the interquartile range.
Finding the standard deviation of a dataset using np.std

--------------------------------------------------

STATISTICAL DISTRIBUTIONS WITH NUMPY
Review
Let's review! In this lesson, you learned how to use NumPy to analyze different distributions and generate random numbers to produce datasets. Here's what we covered:

What is a histogram and how to map one using Matplotlib
How to identify different dataset shapes, depending on peaks or distribution of data
The definition of a normal distribution and how to use NumPy to generate one using NumPy's random number functions
The relationships between normal distributions and standard deviations
The definition of a binomial distribution

--------------------------------------------

HYPOTHESIS TESTING
Types of Hypothesis Test

For numerical data, we will cover:
One Sample T-Tests
Two Sample T-Tests
ANOVA
Tukey Tests

For categorical data, we will cover:
Binomial Tests
Chi Square

---------------------------------------------------
27/11/2018

CREATING, LOADING, AND SELECTING DATA WITH PANDAS
Review
You've completed the lesson! You've just learned the basics of working with a single table in Pandas, including:

Create a table from scratch
Loading data from another file
Selecting certain rows or columns of a table
Let's practice what you've learned.

-------------------------------------------

MODIFYING DATAFRAMES
Review
Great job! In this lesson, you learned how to modify an existing DataFrame. Some of the skills you've learned include:

Adding columns to a DataFrame
Using lambda functions to calculate complex quantities
Renaming columns

------------------------------------------
AGGREGATES IN PANDAS
Review
This lesson introduced you to aggregates in Pandas. You learned:

How to perform aggregate statistics over individual rows with the same value using groupby.
How to rearrange a DataFrame into a pivot table, a great way to compare data across two dimensions.

------------------------------------------------------
5/12/2018

LINE GRAPHS IN MATPLOTLIB
Review
Now you’ve played around with several two-dimensional line plots in Matplotlib. You’ve seen how you can create simple, readable plots with few commands. You’ve also learned some commands to style and label your plots better. These are the concepts you’ve seen in Matplotlib so far:

Creating a line graph from data
Changing the appearance of the line
Zooming in on different parts of the axis
Putting labels on titles and axes
Creating a more complex figure layout
Adding legends to graphs
Changing tick labels and positions
Saving what you've made
Moving on, we’ll learn how to make different kinds of plots (beyond line graphs!) in Matplotlib and how to choose between those plots when displaying data.

Let’s do a final round of practice with all of the cool plotting concepts you’ve learned so far!

-------------------------------------------------------------------
7/12/2018

DIFFERENT PLOT TYPES
Review
In helping MatplotSip visualize their data, you’ve learned a bunch of new plot types that you can use in Matplotlib. Congratulations on adding these new plotting abilities to your repertoire:

How to compare categories of data with bar graphs
Add error bars to graphs
Use fill_between to display shaded error on line graphs
Create stacked bar graphs for easier comparisons
Create side-by-side bar graphs
Create and format pie charts to compare proportional datasets
Analyze frequency data using histograms, including multiple histograms on the same plot
Normalize histograms
In the upcoming project, you will experiment with these different plot types and how to best use them to find patterns or trends in a new data set.

-----------------------------------------------------------
8/12/2018

LEARN SEABORN INTRODUCTION
Review
In this lesson you learned how to extend Matplotlib with Seaborn to create meaningful visualizations from data in DataFrames.

You've also learned how Seaborn creates aggregated charts and how to change the way aggregates and error bars are calculated.

Finally, you learned how to aggregate by multiple columns, and how the hue parameter adds a nested categorical variable to a visualization.

To review the seaborn workflow:
1. Ingest data from a CSV file to Pandas DataFrame.
df = pd.read_csv('file_name.csv')
2. Set sns.barplot() with desired values for x, y, and set data equal to your DataFrame.
sns.barplot(data=df, x='X-Values', y='Y-Values')
3. Set desired values for estimator and hue parameters.
sns.barplot(data=df, x='X-Values', y='Y-Values', estimator=len, hue='Value')
4. Render the plot using plt.show().
plt.show()

-----------------------------------------------------------

9/12/2018

LEARN SEABORN: DISTRIBUTIONS
Review
In this lesson, we examined how Seaborn has several plots that can visualize distributions. While bar plots can display basic aggregates, KDE plots, dist plots, box plots, and violin plots can show us distributions and other information.

KDE plot - Kernel density estimator; shows a smoothed version of dataset. Use sns.kdeplot().
Box plot - A classic statistical model that shows the median, interquartile range, and outliers. Use sns.boxplot().
Violin plot - A combination of a KDE and a box plot. Good for showing multiple distributions at a time. Use sns.violinplot().

-
-------------------------------------------------------
WHY USE MACHINE LEARNING?

Summary
We have gone over the difference between supervised and unsupervised learning:

Supervised Learning: data is labeled and the program learns to predict the output from the input data
Unsupervised Learning: data is unlabeled and the program learns to recognize the inherent structure in the input data


--------------------------------------------------------

LINEAR REGRESSION
Review
We have seen how to implement a linear regression algorithm in Python, and how to use the linear regression model from scikit-learn. We learned:

We can measure how well a line fits by measuring loss.
The goal of linear regression is to minimize loss.
To find the line of best fit, we try to find the b value (intercept) and the m value (slope) that minimize loss.
Convergence refers to when the parameters stop changing with each iteration.
Learning rate refers to how much the parameters are changed on each iteration.
We can use Scikit-learn's LinearRegression() model to perform linear regression on a set of points.
These are important tools to have in your toolkit as you continue your exploration of data science.