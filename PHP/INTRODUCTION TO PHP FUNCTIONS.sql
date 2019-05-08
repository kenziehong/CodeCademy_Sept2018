INTRODUCTION TO PHP FUNCTIONS
Introduction

We can think of programs as series of instructions to be performed by the computer. So far in each of our PHP programs, each step has been explicitly laid out in the order we it to happen.

Sometimes we’ll have a group of actions we want to repeat in a program. In these situations, we could copy and paste the lines of code we want to run again, but this isn’t very efficient. Instead, we should use functions.

A function is a set of instructions we package as a unit, often with a name, so that we can reuse it. We define a function by writing out the series of steps that should happen whenever we use the function. To use the function we call or invoke it.

In this lesson, we’re going to start learning the syntax for defining and invoking PHP functions. We’ll start with simpler functions and work our way to more complex ones. If this is your first time working with functions, it can feel like a big jump. Take your time and be patient with yourself.

Instructions
Take a look at the video—it shows how much simpler we can make a recipe by providing a single word to represent a set of instructions, eg. “chop”.

-------------------------------------
INTRODUCTION TO PHP FUNCTIONS
Defining Functions


/*Let’s get right to it and create our first function:

function greetLearner()
{
  echo "Hello, Learner!\n!";
  echo "I hope you're enjoying PHP!\n";
  echo "Love, Codecademy";
}
Let’s walk through the code above:

We used the function keyword to start our function definition.
We named the function greetLearner. Function names must start with a letter or underscore, followed by any number of letters, numbers, or underscores.
We created a code block with curly brackets ({ }). This code block will contain all the code that should execute when our function is invoked.
Within that block we wrote a three instructions: echo "Hello, Learner!\n!";, echo "I hope you're enjoying PHP!\n";, and echo "Love, Codecademy";
When we name variables in our PHP code, we follow a naming convention of using snake case (words in the name are separated with underscores). We’re using a different convention in naming our functions so that we’ll be able to easily tell the difference between variables and functions in our code. With function names we’re going to start with a lowercase letter and then capitalize the first letter of every new word; this is called camel case. Another good practice is to name functions in a way that describes what they do—typically we’ll start function names with a verb.

With our greetLearner() function defined, we’ll be able to invoke the function multiple times and print those strings without having to copy or retype the three echo statements again and again.

In the next exercise, we’ll show you how to invoke a function. For now, let’s get some practice defining them!

Instructions
1.
Define a function named praisePHP. You can leave the function body blank for now.

2.
Add at least one echo statement inside your function body which prints a string praising the PHP language.

3.
Now that your function is fully defined, run your program. Notice what happens… or really what doesn’t happen.*/

-------------------------------------------
INTRODUCTION TO PHP FUNCTIONS
Invoking Functions


/*In our last exercise, we saw that when we define a function, the instructions within the code block aren’t executed. Defining a function only tells the computer to associate a name with a set of instructions. To actually execute this code we’ll need in invoke, or call, the function. Invoking a function is the process of using a function that’s been defined. Let’s look at an example:

function greetLearner()
{
  echo "Hello, Learner!\n!";
  echo "I hope you're enjoying PHP!\n";
  echo "Love, Codecademy";
}

greetLearner(); 
/*
Prints:
Hello, Learner!
I hope you're enjoying PHP!
Love, Codecademy
*/
Below the definition of our greetLearner function, we invoked the function by writing its name followed by an opening and closing parenthesis (( )). This tells the computer to grab the instructions specified in the function definition and execute them.

When referring to functions outside of code or in comments, it’s conventional to refer to them by their name followed by parentheses (eg. greetLearner()), so we’ll be doing this from now on.

Let’s define and invoke some functions!

Instructions
1.
Define the function inflateEgo() which prints a compliment.

2.
Invoke your function!

3.
Just for kicks, edit your code so your function is invoked twice!*/

---------------------------------------------------
INTRODUCTION TO PHP FUNCTIONS
Return Statements


/*As we build more complicated functions, we’ll often be using them to process data. In order for the data to be useful, functions have the ability to return a value in addition to performing instructions. Let’s look at an example:

function countdown() 
{
  echo "4, 3, 2, 1, ";
  return "blastoff!";
}
When the countdown() function is invoked it will print 4, 3, 2, 1,, but what about the string "blastoff!"? This value will be returned. We have a lot of options for what to do with a returned value. For example, we could capture it in a variable:

$return_value = countdown(); // Prints: 4, 3, 2, 1, 
echo $return_value; // Prints: blastoff!
This example is a little silly, since we could have just printed the string within the function, but, as we continue to create more complicated functions, the ability to return a value will become extremely useful.

Let’s get some practice returning a value from a function!

Instructions
1.
Write a function printStringReturnNumber() which prints a string and returns a number value.

2.
Capture your function’s return value in a variable named $my_num.

3.
Use echo to print your $my_num variable.*/

<?php

// Write your code below:
 function  printStringReturnNumber(){
  echo "ABC";
  return 12;
}
  
$my_num = printStringReturnNumber();
echo $my_num;

ABC12 

-----------------------------------------------
INTRODUCTION TO PHP FUNCTIONS
More on Return Statements


/*The return keyword immediately stops a function. This means that any code after a return won’t run.

Let’s compare two different functions: “announceRunning()” and “announceRunning2()”. The first of these is defined as follows:

function announceRunning()
{
  echo "The first function is running!\n";
  return "This is the return value of the first function.";
}

$first_result = announceRunning();
echo $first_result;
Let’s walk through the code above:

We defined the function announceRunning().
Next, we defined the variable $first_result and assigned as its value the result of invoking the announceRunning() function. This actually did two things. It executed the function causing "The first function is running!/n" to be printed. It also assigned "This is the return value of the first function." to $first_result.
Finally, we printed $first_result.
That seemed to work as expected. In our terminal we saw:

The first function is running!
This is the return value of the first function.
Let’s contrast that to the following example:

function announceRunning2()
{
  return "This is the return value of the second function.";
  echo "P.S., I love you";
}

$second_result = announceRunning2();
echo $second_result;
In this example, the string "P.S., I love you" will never be printed! As soon as the return statement is reached, the function will end. So in the terminal, we’d see this output:

This is the return value of the second function.
Let’s use this new knowledge to fix some broken code!

Instructions
1.
Run the code to see its current output.

2.
The notFound() function should print the string "ERROR: Page not found!\n" and return 404. Fix the notFound() function so that it works as intended.

3.
Great work! The greetLearner() function also isn’t quite right… We’d like all three of those echo statements to execute and the function to return "<3". Help!*/

/*<?php

function notFound()
{
  echo "ERROR: Page not found!\n";
  return 404;
}

function greetLearner()
{
  echo "Hello, Learner!\n";
  echo "I hope you're (still) enjoying PHP!\n";
  echo "Love, Codecademy\n";
  return "<3";
}

// Don't change the code below:

$error = notFound(); 
$heart = greetLearner();

echo "I received a $error, but it's ok because I also received $heart.";
*/
============================
ERROR: Page not found!
Hello, Learner!
I hope you're (still) enjoying PHP!
Love, Codecademy
I received a 404, but it's ok because I also received <3. 

---------------------------------------------------

INTRODUCTION TO PHP FUNCTIONS
Return Values


/*The value returned from a function is just that—a value. This means it can be used in any manner we would normally use a value of that type. This can take some getting used to. Take a look at the following code:

function returnFive() 
{
  return 5;
}

echo returnFive(); // Prints: 5
In the code above we defined a silly function, returnFive(); all it does it return the number 5. Then we used echo to print the invoked function. The way that the computer executes functions and handles their returns can take getting used to, but it’s very similar to what we experienced with numbers and variables:

echo 5 + 3; // Prints: 8

$num = 5;

echo $num + 3; // Prints: 8

echo returnFive() + 3; // Prints: 8
A computer evaluates 5 + 3 to 8. In the same manner, when a computer encounters a function invocation, it will execute the code in the function’s body and then evaluate to the function’s returned value. We need to think of functions as both what they do (the instructions in their code block) and what they return.

Let’s invoke more functions!

Instructions
1.
Use echo to print the return values of each of the three provided functions in order. The challenge: you may not use more than one line of code or more than a single statement (use only one semicolon).

Note: You can add space, new line, or other characters in between the return values.*/

------------------------------------------

INTRODUCTION TO PHP FUNCTIONS
Returning NULL


/*What about functions without return statements? Any function without a return returns a special value NULL. NULL is a special data type that stands for the absence of a value.

function returnNothing() 
{
  echo "I'm running! I'm running!\n";
}

$result = returnNothing(); // Prints: I'm running! I'm running!

echo $result; // Nothing is printed
Let’s walk through the code above:

We defined a function returnNothing()— the returnNothing() function prints "I'm running! I'm running!\n" but has no return statement.
We defined the variable $result and assigned it the value returned when we invoke return_nothing().
Since we invoked the function, I'm running! I'm running! is printed.
Because the function does not have a return statement, the value assigned to $result is NULL
Finally, we print the $result variable, but, since its value is NULL, nothing is printed.
Let’s play around with NULL!

Instructions
1.
Write a function createVacuum() which returns nothing.

2.
NULL can be really quirky. You don’t need to worry about the details now. But, just for fun, uncomment the line we provided at the bottom of the code. Predict what it will output to the terminal. When you have a guess, run the code to see.*/

<?php

// Write your code below:
  function createVacuum(){
  } 
  
echo createVacuum() * 10;

=====
0
---------------------------------------------
INTRODUCTION TO PHP FUNCTIONS
Parameters


/*Functions that do exactly the same thing every time they run can save us from having to repeat code in our programs, but functions can do more.

In the beginning of this lesson, we wrote a greetLearner() function that printed the same friendly greeting every time it was invoked. That’s ok… we guess… But what we’d really like is to print a customized greeting. We can accomplish this by using parameters!

When we define a function, we can also define parameters. A parameter is a variable which serves as a placeholder throughout the function’s code block. When the function is invoked, it’s invoked with a specific value. As the computer executes the function, it replaces each occurrence of the parameter with the value that was passed in. The actual value passed in is known as an argument.

Let’s look at an example:

function sayCustomHello($name)
{
echo "Hello, $name!";
};

sayCustomHello("Aisle Nevertell"); // Prints: Hello, Aisle Nevertell!

sayCustomHello("Codecademy learner"); // Prints: Hello, Codecademy Learner!
In the code above, we defined the sayCustomHello() function. It has a $name parameter. We invoked the function twice:

The first time, we passed in "Aisle Nevertell" as the argument. During that invocation, the function assigned "Aisle Nevertell" to $name so Hello, Aisle Nevertell! was printed.
The second time we invoked the function with the argument "Codecademy learner" so $name was assigned that value and Hello, Codecademy Learner! was printed.
Let’s get some parameter practice!

Instructions
1.
Write a function increaseEnthusiasm() which takes in a string parameter and returns that string appended with an exclamation mark.

2.
Use echo to print the result of invoking your increaseEnthusiasm() function with a string of your choice.

3.
Write a function repeatThreeTimes() which takes in a string parameter and returns that string repeated three times (without introducing characters which didn’t appear in the original string).

4.
Use echo to print the result of invoking your repeatThreeTimes() function with a string of your choice.

5.
Ready for a little trickiness? Use echo to print the result of invoking your increaseEnthusiasm() with the result of invoking repeatThreeTimes() as the argument passed into increaseEnthusiasm(). You can choose any string you like for the argument to repeatThreeTimes().
*/

<?php
// Write your code below:
function increaseEnthusiasm($abc){
  return $abc."!";
}
echo increaseEnthusiasm("hi");

function repeatThreeTimes($abc1){
  return "$abc1$abc1$abc1";
}
echo repeatThreeTimes("hi");
echo increaseEnthusiasm(repeatThreeTimes("Hong"));

=================
hi!hihihiHongHongHong! 

------------------------------------------------------------
INTRODUCTION TO PHP FUNCTIONS
Multiple Parameters


/*We can also define functions with multiple parameters.

function divide($num_one, $num_two)
{
  return $num_one / $num_two;
};
In the function above, we defined the divide() function. It takes in two number arguments and returns the result of dividing the first parameter by the second. Let’s look at how we invoke this function:

echo divide(12, 3); // Prints: 4

echo divide(3, 12); // Prints: 0.25
In the code above:

First, we printed the value returned from invoking our divide() function with 12 and 3 as arguments.
Next, we we printed the value returned from invoking our divide() function with 3 and 12.
Notice that the order we pass in the arguments decides which parameters they correspond to—the first argument we pass into divide() will be assigned to $num_one and the second argument to $num_two.

Invoking a function with fewer arguments than expected will result in an error:

function expectTwo($first, $second)
{
  return "whatever";
}

echo expectTwo("test"); // Will result in an error
Ok! Let’s make functions with multiple parameters!

Instructions
1.
Write a function calculateArea() that takes in two number arguments—representing the height and width of a rectangle—and returns the area of that rectangle.

2.
Use echo to print the result of invoking your calculateArea() function with two number arguments.

3.
Write a function calculateVolume() that takes in two number arguments—representing the height, width, and depth of a box—and returns the volume of that box.

4.
Use echo to print the result of invoking your calculateVolume() function with three number arguments.*/

<?php
// Write your code below:
 function calculateArea($height, $width){
  return $height*$width;
} 
echo calculateArea(4,5);

function calculateVolume($height, $width, $depth){
  return $height*$width*$depth;
}

echo calculateVolume(3,4,5);

==========
2060
-----------------------------------------------------

INTRODUCTION TO PHP FUNCTIONS
Default Parameters


/*Earlier we wrote a sayCustomHello() function which took in a $name and printed a custom greeting. If we tried to invoke this function without an argument, it would cause an error; the function is designed to run with one argument, and it won’t accept fewer.

function sayCustomHello($name)
{
echo "Hello, $name!";
};

sayCustomHello(); // Causes an error!
We can be more flexible about parameters when defining our functions. We want to print "Hello, [name passed in]!" if an argument is provided, and "Hello, old chum!" only if no argument is passed in.

We can accomplish this by providing a default value for the $name parameter:

function greetFriend($name = "old chum")
{
echo "Hello, $name!";
};

greetFriend("Marvin"); // Prints: Hello, Marvin!

greetFriend(); // Prints: Hello, old chum!
In the code above, we defined the greetFriend() function. It has a parameter $name with a default value of “old chum”. We invoked the function twice:

The first time, we passed in "Marvin" as the argument. During that invocation, the function assigned "Marvin" to $name so Hello, Marvin! was printed.
The second time we invoked the function with no argument. Therefore, the default value of "old chum" was assigned to $name and Hello, old chum! was printed.
Let’s practice defining functions with default parameters.

Instructions
1.
Write a function calculateTip() which takes a number representing the total cost of a meal as its first argument. It should also take a second, optional argument—an integer representing the percent tip desired (eg. 25 will indicate a 25% tip should be calculated). If no second argument is passed in, the function should default to a 20% tip. The function should return the new total—the previous total plus the calculated tip.

For example:

calculateTip(100, 25) should return 125
calculateTip(100) should return 120
calculateTip(88.77, 15) should return 102.35
2.
Use echo to test your function with one and two arguments to make sure it works as expected in each case.
*/

<?php
// Write your code below:
function calculateTip($cost, $tip=20){
  return $cost*(1+$tip/100); 
}

echo calculateTip(100, 25)."\n";
echo calculateTip(100)."\n";
echo calculateTip(88.77, 15);

============
125
120
102.0855 

------------------------------------------

INTRODUCTION TO PHP FUNCTIONS
Pass By Reference

/*
We can invoke functions with variables or with values directly. When we invoke a function with a variable as its argument, it’s as if we’re assigning the value held by that variable to the function’s parameter. We assign a copy of the value held by the argument variable. The variable argument and the parameter are distinct entities; changes made inside the function to the parameter will not affect the variable that was passed in:

function addX ($param)
{
  $param = $param . "X";
  echo $param;
};
$word = "Hello";
addX($word); // Prints: HelloX
echo $word; // Prints: Hello
Let’s walk through the code above:

We defined a function addX() which reassigns $param to its previous value appended with "X".
We defined the variable $word and assigned it the value "Hello".
We invoked addX() with $word as its argument.
During the function invocation, $param was reassigned and the function printed "HelloX".
When we printed $word after the function was invoked, it remained its original value: "Hello".
If we do want to make permanent changes to a variable within a function, we can prepend the parameter name with the reference sign (&). In this way, we assign the parameter to be an alias for the argument variable. Both will refer to the same spot in memory, and changes to the parameter within the function will permanently affect the argument variable.

function addXPermanently (&$param)
{
  $param = $param . "X";
  echo $param;
};
$word = "Hello";
addX($word); // Prints: HelloX
echo $word; // Prints: HelloX
In the addXPermanently() function we made $param a reference to the argument. When we invoked the function with $word the changes made to $param permanently affected the $word variable. Let’s practice!

Instructions
1.
Create a function convertToQuestion(). It should take a reference to a string variable as its argument. The function should prepend the string with "Do you think " and it should add a question mark (?) and new line character (\n) to the end of the string. So the string "no" would become "Do you think no?\n"

$example = "I'm nice";

convertToQuestion($example);

echo $example; // Should print: Do you think I'm nice?
2.
Great job! Let’s test your function to make sure it’s working properly. We’ve provided you with three variables $string_one, $string_two, and $string_three. Invoke your function three times—once with each of the three variables.

3.
At the bottom of your code, use echo to print each of the string variables to confirm that their value has been permanently changed.


*/
<?php

$string_one = "you have teeth";
$string_two = "toads are nice";
$string_three = "brown is my favorite color";

// Write your code below:
function convertToQuestion(&$param){
  $param = "Do you think $param?\n";
  echo $param;
}
convertToQuestion($string_one);
echo $string_one;
convertToQuestion($string_two);
echo $string_two;
convertToQuestion($string_three);
echo $string_three;

==============================
Do you think you have teeth?
Do you think you have teeth?
Do you think toads are nice?
Do you think toads are nice?
Do you think brown is my favorite color?
Do you think brown is my favorite color?

-----------------------------------------------



