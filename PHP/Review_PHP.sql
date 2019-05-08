https://php.net/manual/en/langref.php
https://php.net/manual/en/language.types.string.php
https://www.php.net/manual/en/function.str-pad.php
https://www.php.net/manual/en/langref.php
https://www.php.net/manual/en/indexes.functions.php
https://www.php.net/manual/en/ref.strings.php
https://www.php.net/manual/en/ref.math.php
https://www.php.net/manual/en/function.abs.php

INTRODUCTION TO PHP
Review

In the next lesson, you’ll start creating your own PHP code. Take a second and review what you already know about PHP:

Despite its age, PHP is still a commonly used technology in web development.
PHP is designed to interact with HTML to generate dynamic websites.
Embedding PHP in HTML is done by placing PHP code between <?php and ?> tags.
Every statement in PHP must be terminated with a semicolon ;.
PHP files have a .php extension and the file always starts with the opening PHP tag <?php. The closing tag is implied and left out by convention.
Whitespace is generally ignored when executing PHP code.
Keywords are not case sensitive in PHP. As a convention, use the standard casing.
Single line comments are made in PHP using # or //. Multi-line comments are placed between /* and */.

---------------------------------------------------

PHP STRINGS AND VARIABLES
Review


Awesome work! We’ve covered a lot of material in this lesson, so let’s review:

Strings are collections of text that the computer treats as a single piece of data.
A string can be any length and contain any letters, numbers, symbols, or spaces surrounded by quotation marks.
In order to include certain characters inside strings we have to use escape sequences.
An operator is a character that performs a task in our code.
We can use the concatenation operator (.) to combine two strings into one.
Variables are a fundamental programming concept which allow us to easily reuse data in our code.
We declare a variable using the dollar sign ($) followed by the variable name and then use the assignment operator (=) to give it a value.
PHP has variable parsing which allows us to include variables directly in our strings.
Once a variable has been assigned, we can change its value. This is called reassignment.
We can create an alias for a variable, instead of just a copy, using the reference assignment operator (=&).
Operations to the right of the assignment operator will be evaluated before assignment takes place.
The concatenating assignment operator (.=) is a shorthand notation for reassigning a string variable to its current value appended with another string value.
If that was a lot to take in, don’t worry about memorizing everything right away. Remember that when you want to explore more about the language, the documentation is a great place to get comfortable exploring.


<?php
	echo "Hello, Learner!";

	echo "\nWe hope you enjoyed this lesson.";
    
  echo "\nAre you excited?" . "\nTo learn more?";
    
  $favorite_language = "PHP";

  $message = "$favorite_language is by far our favorite language.";

  $message .= " It's yours now too, right?";
    
  echo "\n" . $message . " Right?!";  

Hello, Learner!
We hope you enjoyed this lesson.
Are you excited?
To learn more?
PHP is by far our favorite language. It's yours now too, right? Right?!

----------------------------------------------  

PHP NUMBERS
Review


Great job! In this lesson, we learned all about using numbers in PHP. Let’s review what we covered:

PHP has two number data types: integers and floating point numbers
We can use arithmetic operators for performing math operations:
Operation:		Example:
Addition	+	echo 1 + 4.5; // Prints: 5.5
Subtraction	-	echo 9 - 1; // Prints: 8
Multiplication	*	echo -1.9 * 2.9; // Prints: -5.51
Division	/	echo 9 / 1; // Prints: 9
Modulo	%	echo 11 % 3; // Prints: 2
Exponentiation	**	echo 8**2; // Prints: 64

Operations have an order of precedence meaning that certain types of operations in a chain will be evaluated before others: first evaluated will be any operation wrapped in parenthesis (()), next exponents (**), then multiplication (*) and division (/), and finally addition (+) and subtraction (-). The acronym PEMDAS can be a helpful way of remembering the order.
We can assign number values to variables and then perform numerical operations with them.
We can use mathematical assignment operators as a shorthand when reassigning number variables:
Operation:	Long Syntax:	Short Syntax:
Add	$x = $x + $y	$x += $y
Subtract	$x = $x - $y	$x -= $y
Multiply	$x = $x * $y	$x *= $y
Divide	$x = $x / $y	$x /= $y
Mod	$x = $x % $y	$x %= $y

---------------------------------------------------

INTRODUCTION TO PHP FUNCTIONS
Review


Great job! Let’s review what we covered in this lesson:

We can package a set of instructions within a named function to reuse whenever we’d like.
When we invoke a function, the computer will execute the function body, specified by the code block following the parameters list.
Functions can return a value by using the return keyword otherwise they return NULL which means no value.
We can store the return value of a function in a variable or use it any other way we’d use a value.
We can define functions with parameters which are variables we can refer to throughout our function’s body.
When invoking functions, the values that we give them are called arguments.
Functions can have multiple parameters.
The order in which the arguments are passed in decides which parameters they correspond to.
You can make an argument optional, by providing its corresponding parameter with a default value.
If you preprend a parameter with the reference sign (&) that argument will be passed by reference.
Instructions
Take a look at this diagram of the syntax for defining and calling functions.