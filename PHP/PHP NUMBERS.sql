PHP NUMBERS
Numbers


/*Numbers and arithmetic operations are a fundamental part of programming. In this lesson, we’ll learn how to use and manipulate numbers in PHP.

PHP has two number data types. The integer data type includes positive and negative whole numbers (such as 3, 4599, -98, and 0). The floating point data type is used to represent decimal numbers (such as 4.98273, 2.1, -9.7, -182736.8).

echo 5; // Prints: 5
echo -22.8; // Prints: -22.8
We can also declare variables and assign numbers as their values:

$my_int = 78;
$my_float = -897.21;

echo $my_int; // Prints: 78
echo $my_float; // Prints: -897.21
In the code above, we created the $my_int variable and assigned the integer value of 78 to it. Next, we created the $my_float variable and assigned the floating point value of -897.21 to it.

Let’s practice making number variables!

Instructions
1.
Declare a variable with any name you’d like and assign an integer value to it. Use echo to print your variable to the terminal.

2.
We’re going to make and print another number variable, but we don’t want it to print on the same line. Use echo to print the string "\n".

Next, declare a variable with any name you’d like and assign a floating point value to it. Use echo to print this new variable to the terminal.
*/

<?php
// Write your code below:
  $my_int = -3;
  echo $my_int;
  echo "\n";
  $my_float = -3.6;
  echo $my_float;

-3
-3.6
-------------------------------------------
PHP NUMBERS
Addition and Subtraction


/*PHP provides several operators we can use on numbers. Let’s start with two that are likely familiar: the addition (+) and subtraction (-) operators:

echo 5 + 1; // Prints: 6
echo 6.6 + 1.2; // Prints: 7.8
echo 198263 - 263;  // Prints: 198000
echo -22.8 - 19.1; // Prints: -41.9
Most of the time, we don’t have to worry about which type of number we’re using. We can add a float to an integer, subtract an integer from a float, and so on.

One quirk is that operators will return integers whenever the result of the operation evaluates to a whole number. So 8.9 + 1.1 will return 10, an integer, and not 10.0 even though both of the operands in the calculation were floating point numbers.

Let’s do some adding and subtracting!

Instructions
1.
Use echo to print the number 12 to the terminal. The trick: use addition or subtraction to print a statement that evaluates to 12, and the number 12 can’t appear anywhere in your code!  
  
*/  
  
-------------------------------------------------

PHP NUMBERS
Using Number Variables


/*We can use number operators on variables that hold number values:

$tadpole_age = 7;
$lily_age = 6; 
$age_difference = $tadpole_age - $lily_age;
echo $age_difference; // Prints 1
Let’s look at another example of performing operations with number variables:

$favorite_num = 22;
echo $favorite_num + 1; // Prints 23
echo $favorite_num; //Prints 22
In the code above, we created the variable $favorite_num then we used echo to print that value plus 1. Note that we didn’t reassign the value of the $favorite_num variable, so it still had the value 22 when we printed it on the last line.

We reassign number variables using the assignment operator:

$age = 82;
echo $age; // Prints: 82

$age = $age + 2;
echo $age; // Prints: 84
Let’s do some addition and subtraction with variables!

Instructions
1.
Can you help? I’m trying to figure out how much more I spent last month than this month. Last month I spent 1187.23 and this month I spent 1089.98. Create the variables $last_month and $this_month and assign them the corresponding numeric values.

2.
Use echo to print the difference between last month’s spending and this month’s.  


*/

-------------------------------------------------------

PHP NUMBERS
Multiplication and Division


/*PHP also gives us operators for performing multiplication (*) and division (/).

echo 2 * 3; // Prints: 6
echo -21 / 7; // Prints: -3
Like with addition and subtraction, when we perform multiplication or division, the computer will return an integer whenever the operation evaluates to a whole number.

The reverse is also true:

$num_cookies = 24;
$num_friends = 7;
$cookies_per_friend = $num_cookies / $num_friends;
echo $cookies_per_friend; // Prints: 3.4285714285714
In the code above, we performed an operation on two integers that didn’t divide into each other evenly, so the computer returned a floating point number.

Let’s multiply and divide!

Instructions
1.
Meg is trying to figure out how long, on average it takes her to learn a programming language. So far, she knows Ruby, Python, JavaScript, and C++. Create a variable, $num_languages, and assign to it the number of programming languages she has learned. Create a second variable, $months and assign 11 to it, which is the number of months she’s spent learning how to code.

2.
Let’s get more precise. Meg realizes that she hasn’t quite studied every day. Create a variable $days and assign as its value the result of multiplying $months by the number of days per month she thinks she actually spent studying, which is 16 days each month.

3.
Let’s figure out, on average, how many days it took her to learn each language. Assign the result of of this operation to a variable $days_per_language.

4.
Print your $days_per_language variable to the terminal.*/

<?php
// Write your code below:
$num_languages = 4;
$months = 11;
$days = 16*$months;
$days_per_language = $days/$num_languages;
echo $days_per_language;

44
--------------------------------------------
PHP NUMBERS
Exponentiation


/*PHP give us an operator for raising a number to the power of another number: the exponentiation operator (**).

For example, we can square a number by raising it to the power of 2:

echo 4 ** 2; // Prints: 16
We can also use this operator on floats and negative numbers:

echo 2.89 ** 3.2;  // Prints: 29.845104015297
echo 10 ** -1; // Prints: 0.1
For PHP to interpret this operator correctly it can’t have any spaces between the two * characters:

echo 2 * * 3; // Will result in an error
Let’s do some more math!

Instructions
1.
Use echo and the exponent operator to print the value of 8 squared to the terminal.
*/

---------------------------------------
PHP NUMBERS
Modulo

/*PHP also provides an operator that might be less familiar: modulo (%). The modulo operator returns the remainder after the left operand is divided by the right operand.

echo 7 % 3; // Prints: 1
In the code above, 7 % 3 returns 1. Why? We’re trying to fit 3 into 7 as many times as we can. 3 fits into 7 at most twice. What’s left over—the remainder—is 1, since 7 minus 6 is 1.

gif of modulo operation

The modulo operator will convert its operands to integers before performing the operation. This means 7.9 % 3.8 will perform the same calculation as 7 % 3—both operations will return 1.

Let’s look at another example of the modulo operator in action:

$num_cookies = 27;
$cookies_per_serving = 4;
$leftover_cookies = $num_cookies % $cookies_per_serving;
echo $leftover_cookies; // Prints: 3
Let’s practice using modulo!

Instructions
1.
We have 82 students going on a class trip. We want to divide the students into groups of 6. Use the modulo operator to echo how many students will be left without groups.
*/

--------------------------------------------
PHP NUMBERS
Order of Operations


/*We can chain multiple operations together to get a single result:

echo 2 + 3 + 4 + 5 - 1.1; // Prints: 12.9
echo 2 * 9 / 6; // Prints: 3
You might have learned about operations having an order of precedence in a math class. This means that operations in a chain aren’t simply performed from left to right; rather each operator is given a special rank.

Operations will be evaluated in the following order:

Any operation wrapped in parentheses (())
Exponents (**)
Multiplication (*) and division (/)
Addition (+) and subtraction (-).
The acronym PEMDAS can be helpful for remembering the order of precedence for these arithmetic operations.

echo 1 + 3 * 9; // Prints: 28
In the example above, 3 * 9 (27) is calculated first and then is added to 1 to yield a final result of 28. We can change what this expression returns by using parentheses:

echo (1 + 3) * 9; // Prints: 36
Here, 1 + 3 (4) is calculated first and then that value is multiplied by 9 to which returns 36.

Let’s practice writing some chained operations!

Instructions
1.
Heya! Can you help me out. Use echo to print the answer to the terminal.

I’m trying to figure out how much money I should have. At the start of the day I had $94.

I spent $4.25 on coffee
A friend gave me $7 that he owed me
I went out for a meal. The bill was $23.50, but I also gave a 20% tip.
Some friends and I found $20 on the ground and split it four ways
I think that’s everything.

Use a single chained operation to get your result!*/

<?php
// Write your code below:
  echo 94-4.25+7-23.5*1.2+20/4;
  
73.55 

-------------------------------------------
PHP NUMBERS
Mathematical Assignment Operators


/*One common task when manipulating number variables is to reassign them to their old value with some operation performed on it.

$savings = 800;
$bike_cost = 75;
$savings = $savings - $bike_cost;
echo $savings; // Prints: 725
This is such a common task that PHP provides a shorter syntax using arithmetic assignment operators:

Operation:	Long Syntax:	Short Syntax:
Add	$x = $x + $y	$x += $y
Subtract	$x = $x - $y	$x -= $y
Multiply	$x = $x * $y	$x *= $y
Divide	$x = $x / $y	$x /= $y
Mod	$x = $x % $y	$x %= $y

We could use this shorter syntax to rewrite the above code:

$savings = 800;
$bike_cost = 75;
$savings -= $bike_cost;
echo $savings; // Prints: 725
With mathematical assignment operators, PHP doesn’t allow spaces between the two characters.

Those keystrokes can add up, so let’s practice using arithmetic assignment operators on variables!

Instructions
1.
We’re going to do a mathematical “magic” trick. Create a variable, $my_num and assign as its value any number.

Next, create a second variable, $answer and assign $my_num as its value.

2.
Use the addition assignment operator to add 2 to $answer.

3.
Use the multiplication assignment operator to multiply $answer by 2.

4.
Use the subtraction assignment operator to subtract 2 from $answer.

5.
Use the division assignment operator to divide $answer by 2.

6.
Almost there. Use the subtraction assignment operator to subtract your original number ($my_num) from $answer. Finally, use echo to print $answer to the terminal.

If everything went as it should, $answer should be 1. No matter what your original number was! Don’t belive us? Go ahead try it with a different number for the value of $my_num.  
  
  
*/

<?php
// Write your code below:
$my_num = 123;
$answer = $my_num;
$answer += 2;
$answer *= 2;
$answer -= 2;
$answer /=2;
$answer -= $my_num;
echo $answer;

1

--------------------------------------------

  
  
  
  
  
  
  
  
  
  
  
  


