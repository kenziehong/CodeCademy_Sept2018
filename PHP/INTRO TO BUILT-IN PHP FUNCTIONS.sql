INTRO TO BUILT-IN PHP FUNCTIONS
Introduction

/*If you’ve been paying attention so far, you might have picked up a theme in programming—shortcuts. Defining our own functions gives us an easier way to repeat similar code throughout a program. But some tasks are so common that the language comes with them by default.

PHP comes with a number of built-in functions. These functions—also known as internal functions— can be invoked without writing them ourselves. In this lesson, we’ll explore some useful built-in functions and empower you to discover new built-in functions yourself. This will quickly become an essential part of your developer toolkit!

Let’s get started.

Instructions
We’ve been using echo to print information to the console. echo is NOT a function (it’s a “language construct”). But, one little PHP quirk is that we can use it in a way that looks a lot like invoking a function—we can wrap an argument for echo in parentheses.

echo can also be used to print multiple string arguments, but unlike a function, for this feature to work we must NOT wrap them in parentheses. Take a look at the code editor; we’ve provided some examples of using echo with and without parentheses. If you’d like, uncomment the broken code to see the error it causes.*/

<?php
echo("This works!\n");

echo "This also works!\n";

#echo("This would NOT work", "\n");

echo "Buuuut!", " ", "This", " ", "does!", "\n";

-------------------------

INTRO TO BUILT-IN PHP FUNCTIONS
Working with Variables


/*PHP includes useful built-in functions for getting information about variables. The gettype() function takes a variable as its argument and returns a string value representing the data type of the argument.

$name = "Aisle Nevertell";
$age = 1000000;

echo gettype($name); // Prints: string

echo gettype($age); // Prints: integer
Notice that we didn’t write a definition for the gettype() function ourselves—it’s built into PHP. Since the function is included within the language itself, we can just call it anywhere within our PHP code.

Let’s take a look at another built-in function! The var_dump() function also takes a variable argument. It prints details about the argument it receives.

var_dump($name); // Prints: string(15) "Aisle Nevertell"

var_dump($age); // Prints: int(1000000)
In the code above, we first used var_dump() to print information about the variable $name. string(15)—the variable’s type and length—were printed followed by the value held by the variable.

Next, we used var_dump() to print information about the variable $age. Here, the integer is printed within the parentheses.

As we learn more data types—especially increasingly complex data types—we’ll see how useful these two functions can be. For now, let’s practice using them with the types of data we know!

Instructions
1.
Using echo and the gettype() function, print the data types of the $first and $second variables.

2.
Let’s compare that to what var_dump() outputs. Use var_dump() to display information about the $first and $second variable.*/

<?php
namespace Codecademy;

$first = "Welcome to the magical world of built-in functions.";
  
$second = 82137012983; 

//Write your code below:
echo gettype($first)."\n";
echo gettype($second)."\n";
var_dump($first)."\n";
var_dump($second)."\n";

========================
string
integer
string(51) "Welcome to the magical world of built-in functions."
int(82137012983)

------------------------------------------
INTRO TO BUILT-IN PHP FUNCTIONS
String Functions


/*We can find PHP built-in functions to accomplish common tasks. Need to reverse a string? There’s a built-in function for that!

The strrev() function takes in a string as its argument and returns a string with all of the characters of the original string in reverse order.

Let’s see it in action:

echo strrev("Hello, World!"); // Prints: !dlroW ,olleH
Remember that we can use the values returned from functions directly (rather than saving them into variables). In the code above, we used echo to print the value returned from invoking the strrev() function with the string "Hello, World!" as its argument.

PHP also comes with built-in functions to change the capitalization of a string. We can use the strtolower() function to transform an argument string into all lowercase letters:

echo strtolower("HeLLo"); // Prints: hello
Built-in functions often have multiple parameters. The str_repeat() function takes a string as its first argument and a number as its second. It returns a string containing the argument string repeated the argument number of times.

echo str_repeat("hi", 10); // Prints: hihihihihihihihihihi 
In the above code we used echo to print the value returned from invoking str_repeat() with "hi" and 10 as its arguments—"hihihihihihihihihihi" .

Let’s practice!

Instructions
1.
Use echo and the strrev() function to print the following string reversed: ".pu ti peeK .taerg gniod er'uoY"

2.
Use echo and the strtolower() function to print the following string with all lowercase letters: "SOON, tHiS WILL Look NoRmAL."

3.
Use echo and the str_repeat() function to print the string "\nThere's no place like home.\n" three times.*/

<?php
namespace Codecademy;

// Write your code below:
echo strrev(".pu ti peeK .taerg gniod er'uoY");
echo strtolower("SOON, tHiS WILL Look NoRmAL.");
echo str_repeat("\nThere's no place like home.\n",3);

=====================

You're doing great. Keep it up.soon, this will look normal.
There's no place like home.

There's no place like home.

There's no place like home.
-----------------------------------------------------

INTRO TO BUILT-IN PHP FUNCTIONS
Working with Substrings


/*A substring is a portion of a string. For example, "hello" is a substring of the string "Oh hello, how are you?" and "el" is a substring of the string "hello". Manipulating strings is very common in programming, and working with substrings is often necessary.

The substr_count() function returns the number of instances of a substring within a string. It takes two arguments, the string to search through—sometimes called the haystack— and the string to search for—sometimes called the needle.

$story = "I was like, \"Dude, like just tell me what you like think because like everyone else is like being totally honest, and like I just want to know what you like think.\" So like I don't know...";

echo substr_count($story, "like"); // Prints: 8
In the code above, we invoked the substr_count() function, passing in $story as the haystack and "like" as the needle. We used echo to print the returned result—8, which is the number of times the substring "like" appears in the $story string.

Let’s practice!

Instructions
1.
Use echo and the substr_count() function to print the number of times the word “really” appears in $essay_one.

2.
Use echo and the substr_count() function to print the number of times the word “obvious” appears in $essay_two.

Notice that substr_count() is not concerned with which characters come before or after the string it’s searching for—it will count both “obvious” and “obviously”.*/

<?php
namespace Codecademy;

$essay_one = "I really enjoyed the book. I thought the characters were really interesting. The plot of the novel was really engaging. I really felt the characters' emotions. They were really well-written. I really wish the ending had been different though.";
  
$essay_two = "Obviously this is a really good book. You obviously would not have made us read it if it wasn't. I felt like the ending was too obvious though. It was so obvious who did it right away. I think the thing with the light was obviously a metaphor for life. It would have been better if the characters were less obvious about their secrets.";  

// Write your code below:
echo substr_count($essay_one, "really");
echo substr_count($essay_two, "obvious");

====================
65 

-----------------------------------------
INTRO TO BUILT-IN PHP FUNCTIONS
Number Functions

/*
Another common task in programming is working with numbers, so it shouldn’t surprise us that PHP comes with some handy built-in functions for working with numbers.

The abs() function returns the absolute value of its number argument:

echo abs(-10.99); // Prints: 10.99

echo abs(127); // Prints: 127
Another useful function is the round() function which returns the nearest integer to its number argument:

echo round(1.2); // Prints 1

echo round(1.5); //Prints 2

echo round(1298736.821763876); // Prints: 1298737
Let’s practice!

Instructions
1.
You’re going to write a function which uses the abs() built-in function within its definition.

Write a function called calculateDistance() that calculates the distance between two numbers. The function should return the same result for two arguments no matter what order they’re passed into the function.

Here are some examples of how the function should work:

calculateDistance(-1, 4) should return 5
calculateDistance(4, -1) should return 5
calculateDistance(3, 7) should return 4
calculateDistance(7, 3) should return 4
Once you’ve finished writing your function, you should run it to make sure it’s working how it should.

Check out the hint if you want some help on the strategy or a reminder about how to define your own functions.

2.
Awesome! This time you’re going to write a function which uses the round() function.

Write a function calculateTip() which takes a number representing the total cost of a meal as its argument.

Your function should calculate a new total with an 18% tip added and return that value rounded to the nearest integer.

You’re function must invoke the built-in round() function. For example:

calculateTip(100) should return 118
calculateTip(35) should return 41
calculateTip(88.77) should return 105*/

<?php
namespace Codecademy;

// Write your code below:
function calculateDistance($num_one, $num_two){
  return abs($num_one -$num_two);
}

function calculateTip($cost){
  return round($cost*1.18);
}

-------------------------------------------
INTRO TO BUILT-IN PHP FUNCTIONS
Generating Random Numbers


/*Generating random numbers may not seem obviously useful, but, as your programs become increasingly complicated, you’ll see this is actually a common task—for example to randomize data for testing.

The rand() function returns a random integer. We have some flexibility with how we invoke it. Invoking rand() with no arguments will return a number between 0 and the largest number our current environment will allow; this is a quirk of PHP. We can find out what this number is by invoking a different built-in function, getrandmax():

$max = getrandmax(); 

echo $max;

echo rand(); // Prints a number between 0 and $max
In the code above, we assigned the largest possible random integer to the $max variable by invoking the getrandmax() function.

Next, we used echo to print a random integer. This integer will be a number between 0 and $max.

Functions often have a strict definition which dictates exactly which arguments it expects to be called with and results in an error otherwise. The rand() function, however is somewhat flexible.

If we’d like more control over the random number we generate, we can invoke the rand() function with two integer arguments representing the smallest allowable random number and the largest allowable random number. Fun fact: the second argument provided can be larger than getrandmax(). These numbers are inclusive meaning the arguments we pass in could be generated by the function.

echo rand(1, 2); // Prints either 1 or 2

echo rand(5, 10); // Prints a number between 5 and 10 (inclusive!)

echo rand(1, 100); // Prints a number between 1 and 100 (inclusive!)
Ok let’s get random!

Instructions
1.
Use echo and getrandmax() to find out what the maximum random number is in this environment.

2.
Now that we know its bounds. Let’s see what we get when we invoke the rand() function.

Use echo to print an invocation of the rand() function.

It’s totally optional, but you might consider adding this line of code between your other echo statements so you can read the output more easily:

echo "\n";
3.
Ok! Let’s call rand() again. This time use echo and rand() to print a random number between 1 and 52 (both inclusive).*/

<?php
namespace Codecademy;

// Write your code below:
$max = getrandmax();
echo $max;
echo "\n";
echo rand();
echo "\n";
echo rand(1,52);

==================
2147483647
2086526626
19 
-------------------------------------------------------

INTRO TO BUILT-IN PHP FUNCTIONS
Documentation


/*In order to understand built-in functions we’ve never used before, we’ll want to get comfortable understanding how they are represented in the documentation. Documentation typically includes:

The name of the function.
The versions of the PHP language the function is available in.
An overview of how the function works.
Additional details on the parameters and return value.
Examples of the function in use.
User comments further explaining features of the function.
The description section can be confusing, so we’ll break that down.

Here’s the description for the abs() function:

abs ( mixed $number ) : number

Here we see the function name followed by parentheses. The parentheses contain information about the function’s parameter(s)—first the parameter’s type followed by its name. The parameter for abs() has the type mixed because there are multiple data types the function will accept (an integer or a float). The parameter for abs() is named $number. After the parentheses is a colon (:) followed by number; this is the data type the function will return.

A function that prints something but doesn’t return a value will have :void instead of a return type. Similarly, a function that doesn’t accept parameters will have void within its parentheses.

Let’s look at a more complicated example. Here’s the description for the substr_count() function:

substr_count ( string $haystack , string $needle [, int $offset = 0 [, int $length ]] ) : int

Earlier in this lesson, we invoked substr_count() with only the two string parameters ($haystack and $needle). But functions can have optional parameters. This means they’ll work with or without them. These parameters are wrapped in square brackets ([ ]) in the function’s description. An optional parameter may have a default value, this is the value that will be used if no argument is passed into the function. The default value is indicated with an equal sign (=).

The substr_count() function accepts two additional integer arguments—$offset and $length. $offset has a default value of 0. Take a look at the documentation and see if you can figure out what they do.

Let’s practice reading some function descriptions!

Instructions
1.
Here’s the description for the str_pad() built-in function:

str_pad ( string $input , int $pad_length [, string $pad_string = " " [, int $pad_type = STR_PAD_RIGHT ]] ) : string

In the code editor, we’ve provided four variables: $a, $b, $c, and $d. Your task is to invoke str_pad() with these four variables as its arguments so that it returns the string: *~**~**~*You did it!*~**~**~*. You’ll need to figure out which order to pass them in.

Use echo to print the result of invoking the function.

This task is designed to be a little challenging. Check out the documentation for more information, and take a look at the hint for more guidance.

Note: One of the arguments (and its corresponding variable) is a PHP type we haven’t taught yet: pre-defined constants. You can solve this challenge without understanding them deeply. Predefined constants are similar to variables—they’re names which hold values. Unlike variables, predefined constants are defined by the language, not by us, and they’re constant, they can’t change value.

Let’s look at this description in more detail:

str_pad ( string $input , int $pad_length [, string $pad_string = " " [, int $pad_type = STR_PAD_RIGHT ]] ) : string

The : string tells us that the str_pad() returns a string.

Now let’s take a closer look at the parameters:

string $input , int $pad_length [, string $pad_string = " " [, int $pad_type = STR_PAD_RIGHT ]]

str_pad() has four paramteters: two required and two optional. The first is a string they call $input. This is our original string. The function will add “padding” to this string. This corresponds to our "You did it!" string.

The second parameter is an integer they call $pad_length. This is the length we’d like the final string to be once it has been padded. This correponds to the integer variable we provided (29).

The third parameter is a string they call $pad_string. This parameter has a default value of " ". The str_pad() function will add the $pad_string to the $input string until it’s the correct length ($pad_length). If no argument is passed in, the function will pad with space characters. We’d like our string to be padded with "*~*".

The final parameter is an integer they call $pad_type. This parameter dictates the way the string is padded: only on the left, only on the right, or on both sides. This is a bit of a strange one. The parameter’s type is an integer, but the default value for $pad_type is a predefined constant—STR_PAD_RIGHT. The parameter must be the values 0, 1, or 2. 0 means only pad to the left, 1 means only pad to the right, and 2 means pad on both sides. To save us from having to remember which was which and prevent people from using invalid numbers, PHP comes with predefined constants STR_PAD_LEFT, STR_PAD_RIGHT, and STR_PAD_BOTH equal to 0, 1, and 2, respectively. These constants are available from anywhere. We want padding on both sides, so $str_pad() should be passed STR_PAD_BOTH as its fourth parameter.*/

<?php
namespace Codecademy;

$a = 29;
$b = "You did it!";
$c = STR_PAD_BOTH;
$d = "*~*";

// Write your code below:
echo str_pad($b, $a, $d, $c);

*~**~**~*You did it!*~**~**~*

-----------------------------------