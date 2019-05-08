PHP STRINGS AND VARIABLES
Strings


/*illustration of string

In everyday conversation, we use the word data to refer to any sort of information. This information is often a list of numbers, like a company’s monthly expenses or statistics about an athlete’s performance. However, in programming, data means something very specific. It’s still information, but that information takes the form of a few specific types.

The PHP language has different ways of handling different types of data. Which actions the computer can perform and how the computer stores the data in memory will vary based on the type. In this lesson, we’ll be learning about the string data type.

Strings are words or pieces of text that the computer treats as a single item. A string is a sequence of characters. It can be any length and contain any letters, numbers, symbols, or spaces surrounded by quotation marks.

echo "My first string"; // Prints: My first string
It’s important to distinguish between strings and the rest of the code in a PHP program. Every part of a program is text, but strings are the parts we intend to keep as data—not as instructions to be executed by computer. In this lesson we’re going to focus on strings wrapped in double quotation marks (if you’re curious, you can check out the official PHP documentation to see other types of PHP strings).

In later lessons, we’ll be using PHP to create custom HTML documents enabling dynamic web pages. As we learn the basics, however, we’ll be writing simple PHP only programs that run in the terminal.

Let’s make some strings!

Instructions
1.
Let’s start with the classic. Use the echo keyword to print Hello, World!.

You should always end a PHP statement with a semicolon.


*/

-------------------------------------------
PHP STRINGS AND VARIABLES
Escape Sequences


/*We use quotation marks to indicate the start and end of a string. The quotation marks tell the computer that we want everything inside them to be treated as a single piece of data. But how do we include quotation marks inside a string?

Consider the following string: "She said "hi" to the dog."

In the code above, the quotes around “hi” are intended to be part of the string, but the computer will actually see two strings "She said " and " to the dog." with hi in between. Since hi won’t be recognized as valid PHP it will result in an error:

echo "She said "hi" to the dog."; //syntax error, unexpected 'hi' (T_STRING)
In order to indicate which quotation marks the computer should view as instructions vs which it should view as simply characters, PHP allows for escape sequences. An escape sequence usually consists of a backslash (\) immediately followed by another character.

echo "She said \"hi\" to the dog."; // Prints: She said "hi" to the dog.
Quotation marks aren’t the only symbol requiring an escape sequence. When we print multiple strings, PHP will print them to the same line by default:

echo "1. Go to gym";
echo "2. Cook dinner"; 
The code above will output 1. Go to gym2. Cook dinner. To print the second string on a new line, we can use the newline escape sequence (\n):

echo "1. Go to gym";
echo "\n2. Cook dinner"; 
/* Prints
1. Go to gym
2. Cook dinner
*/
/*You don’t need to worry about other escape sequences yet, but if you’d like to see the full list you can find one in the PHP documentation.

Let’s practice!

Instructions
1.
Let’s make a to-do list for you. Use echo to print a string to the console in the following format: 1. [thing you have to do]. For example, here’s ours: 1. Teach PHP.

2.
Let’s create a new echo statement for the next item on our to-do list.

By default, this second statement would print on the same line as the first… Start this second string with the escape sequence for a new line character. Next, continue the string in the same format as before: 2. [Another thing to do].

3.
Let’s throw a third thing on the list. This time, let’s mix it up. Include something inside your string wrapped in double quotes. For example, here’s ours 3. Learn to have "fun".*/

<?php
// Write your code below:
  echo "1. Teach PHP";
  echo "\n2. Teach PHP";
  echo "\n3. Learn to have \"fun\"";

------------------------------------------------  

PHP STRINGS AND VARIABLES
String Concatenation


/*It can be useful to combine two strings together. This process is called string concatenation, and we can use the concatenation operator (.) to do this.

An operator is a character that performs a task in our code. The computer will take the string to the left of the concatenation operator, combine it with the string to the right, and return the resulting single string. Let’s see an example of string concatenation:

echo "one" . "two"; // Prints: onetwo
Notice how the string “onetwo” was printed. The computer won’t make any assumptions for us—it will combine the strings exactly as they are without adding any spaces or line-breaks. If we want spaces, we’ll have to add any spaces we want ourselves. Here we added a space to the string "one ":

echo "one " . "two"; // Prints: one two
We can also combine, or chain, our operations to get a final result:

echo "one" . " " . "two" . " " . "three"; // Prints: one two three
The concatenation operator takes two strings (the operands) and produces a string as a result (the return value). As we delve deeper into PHP, we’ll learn about other kinds of operators. Most will take one or two operands, but there’s even one that takes three.

Let’s join some strings together!

Instructions
1.
Use echo to print the string "Code" concatenated to the string "cademy".

2.
We want to learn a little more about you. Uncomment the line of code that starts with echo "\nMy name is:" and concatenate the given string with a string containing your name. Include a space after the colon without editing the string we provided.

3.
Use echo to print a final portmanteau by concatenating these four strings "\n", "tur", "duck", and "en". Make sure to include a semicolon after the statement.

*/

<?php
// Write your code below: 
  echo "Code"."cademy";
  echo "\nMy name is:"." Hong";
  echo "\n"."tur"."duck"."en";

Codecademy
My name is: Hong
turducken  
  
-----------------------------------------
PHP STRINGS AND VARIABLES
Variables


/*Let’s say I have a really long string in my program, and I’m going to need to use it multiple times. Do I have to type the string out every time I need to use it? The answer is “no”. Variables are a fundamental programming concept designed to address this concern. With variables, we store values so that we can easily reuse them throughout a program.

Before we can use variables in our code, we need to declare and assign them.

Declaring a variable is the process of reserving a word, the variable name, which we’ll be able to refer to in our code. It’s good practice to name the variable in a way that describes the data it holds.

Assignment is the process of associating that variable name with a specific value so that everytime we use the variable’s name the computer will grab that value.
 
*/  

----------------------------------------------
PHP STRINGS AND VARIABLES
Creating Variables


/*Let’s look at an example of creating a variable:

$my_name = "Aisle Nevertell";
In the code above, we’re actually doing two things with a single statement: we’re declaring a new variable by giving it the name my_name. We’re also assigning it the value "Aisle Nevertell". The variable $my_name now holds the value "Aisle Nevertell".

To declare a variable we use the dollar sign character ($) followed by our chosen variable name. The dollar sign is known as a sigil; it’s a character that allows the computer to see quickly that something is a variable.

To assign it a value we use another operator: the assignment operator (=) followed by the value we’re assigning to the variable.

Though it can occasionally be useful to separate these actions, we’ll most often be declaring and assigning variables at the same time.

syntax diagram

In PHP, variables names can contain numbers, letters, and underscores (_), but they have to start with either a letter or an underscore. Variable names are case sensitive, meaning that PHP will treat the variables $my_example and $My_example as two different variables.

One common convention when naming PHP variables is to use an underscore between words on variable names with more than one word in their name. This is known as snake case:

$mood = ":)";
$favorite_food = "Red curry with eggplant";
Let’s create some variables!

Instructions
1.
Create a variable and assign to it a string value. You can give the variable any valid name you’d like and assign a string containing anything you want. End the statement with a semicolon.

2.
Declare a variable $biography and assign to it a string that starts with a new line character and contains a sentence or two about you.

3.
Create a variable $favorite_food and assign to it the string "\n", "tur", "duck", and "en" concatenated together.  
*/

<?php
// Write your code below:
  $name = "Hong";
  $biography = "\nClever and Cute";
  $favorite_food = "\n"."tur"."duck"."en";
  
---------------------------------------------------------------
PHP STRINGS AND VARIABLES
Using Variables


/*Once we’ve declared a variable and assigned a value to it, we can use it as many times as we want. We refer to a variable by using the dollar sign followed by the variable’s name.

$favorite_food = "Red curry with eggplant, green beans, and peanuts";
echo $favorite_food; 
// Prints: Red curry with eggplant, green beans, and peanuts
Except during assignment, whenever the computer sees a variable in your code, it replaces the variable with the value assigned to that variable.

$dog_name = "Tadpole";
echo $dog_name; 
// Prints: Tadpole
Since the computer treats a variable just as if it were the value it holds, this means we can do operations on variables just as we would with any value of that type.

$dog_name = "Tadpole";
echo "My dog is named " . $dog_name; 
// Prints: My dog is named Tadpole
In the code above, we concatenated the string "My dog is named " to the value held by the $dog_name variable ("Tadpole"). Let’s look at another example that uses multiple variables:

$dog_name = "Tadpole";
$favorite_food = "salmon";
$color = "brown";

echo "I have a " . $color . " dog named " . $dog_name . " and her favorite food is " . $favorite_food . ".";
// Prints: I have a brown dog named Tadpole and her favorite food is salmon.
Let’s use some variables!

Instructions
1.
You’re going to create a couple variables. The variable, $name, should be assigned your name as a string. The second,$language, should be assigned a string value representing a language you’re learning.

2.
Use echo to print any string you’d like with the $name variable concatenated to it.

3.
Use echo to print a string starting with a newline (\n) with $language variable concatenated to it.  
  
*/

<?php
// Write your code below:
$name = "Hong";
$language = "PHP";
echo "My name is: ".$name;
echo "\n".$language;

-------------------------------------------------
PHP STRINGS AND VARIABLES
Variable Parsing


/*In the last exercise, we saw how concatenating a number of strings and string variables got annoying. There’s an easier way!

PHP strings allow us to place variables directly into double quoted strings. These variables will be parsed which means the computer will read the variables as the value they hold rather than see them as just a sequence of characters.

$dog_name = "Tadpole";
$favorite_food = "salmon";
$color = "brown";

echo "I have a $color dog named $dog_name and her favorite food is $favorite_food.";
// Prints: I have a brown dog named Tadpole and her favorite food is salmon.
PHP string parsing is incredibly useful. Whenever PHP sees a dollar sign ($) inside a string it will assume all the characters next to it (until it reaches a character that couldn’t be included in a variable name) are a part of the variable name.

Sometimes this can get complicated. Consider the following example:

$toy = "frisbee";
echo "Alex likes playing with $toys";
The code above will cause an error. Why? The computer was looking for a variable $toys and couldn’t find one.

Fear not! PHP allows us to specifically indicate the variable name by wrapping it in curly braces to avoid any confusion. We’ll include the dollar sign followed by the variable name wrapped in curly braces:

$dog_name = "Tadpole";
$favorite_food = "treat";
$color = "brown";

echo "I have a ${color}ish dog named $dog_name and her favorite food is ${favorite_food}s.";
// Prints: I have a brownish dog named Tadpole and her favorite food is treats.
Let’s have PHP do some variable parsing for us!

Instructions
1.
We’re going to write a silly sentence PHP program. There are a number of variables assigned the string ‘___’. Replace each of them with words of the designated type.

2.
Beneath the three variables, there’s an echo statement with three blanks (___) in it. Replace those blanks with the three variables (in the order they were declared).

3.
At the end of the program, there’s a commented out line of code. We commented it out because it wasn’t working properly. Fix the line of code and uncomment it.  
  
*/

<?php
// Fill in the blanks in the code below:
  $noun = "Hong";
  $adjective = "cute";
  $verb = "is";

  echo "The world's most beloved $noun was very $adjective and loved to $verb every single day.";


//Fix the code below and uncomment it:

 echo "\nI have always been obsessed with ${noun}s. I'm ${adjective}ish. I'm always ${verb}ing.";

---------------------------------------------------------

PHP STRINGS AND VARIABLES
Variable Reassignment


/*The word variable comes from the latin variāre which means “to make changeable.” This is an apt name because the value assigned to a variable can change.

gif of reassignment

The process of assigning a new value to a variable is called reassignment. We reassign a variable using the assignment operator on a variable that’s already been declared:

$favorite_food = "Red curry with eggplant";
echo $favorite_food; // Prints: Red curry with eggplant

// Reassign the value of $favorite_food to a new string
$favorite_food = "Pizza"; 
echo $favorite_food; // Prints: Pizza
It’s often useful to create new variables assigned to the same value as an existing variable:

$first_player_rank = "Beginner";
$second_player_rank = $first_player_rank; 
In the code above, we declared the variable $first_player_rank and assigned to it the string "Beginner". Next, we declared $second_player_rank and assigned it to $first_player_rank.

This created a new variable ($second_player_rank) assigned the value "Beginner". Notice how variables can be treated different depending on where they appear in code. During variable assignment or reassignment, the variable on the left of the assignment operator is treated as a variable (named storage for holding a value) while a variable on the right of the operator is treated as the value it stores. 

Instructions
1.
We declared a variable $movie and assigned the string "___" to it. But that’s no fun! Beneath that declaration, reassign $movie so that it’s assigned a string containing your favorite movie from when you were a little kid.

2.
Below your reassignment of the $movie variable, declare and assign a new variable, $old_favorite. The $old_favorite variable should have $movie assigned to it.

3.
Between the first and second echo statements, reassign the value of $movie to a new string.

4.
Finally, at the end of the program add one last echo statement which uses PHP string parsing to print a string containing the $old_favorite variable.

*/  

<?php
  $movie = "Apple in my eyes";
// Add your code here:
  $movie = "Tom and Jerry";
  echo "I'm a fickle person, my favorite movie used to be $movie.";
  
// Add a statement here:
  $old_favorite = $movie;
  $movie = "I love you";   
  echo "\nBut now my favorite is $movie.";
  
// Add a statement below:
  echo "\n$old_favorite";

/*I'm a fickle person, my favorite movie used to be Tom and Jerry.
But now my favorite is I love you.
Tom and Jerry*/

---------------------------------------------------
PHP STRINGS AND VARIABLES
Concatenating Assignment Operator


/*We can assign and reassign variables to the values that result from operations:

$full_name = "Aisle" . " Nevertell";
echo $full_name; // Prints: Aisle Nevertell
During assignment, the computer will first evaluate everything to the right of the assignment operator and return a single value.

In the code above, the computer will concatenate the strings "Aisle" and " Nevertell" into the value "Aisle Nevertell". It will then assign this string as the value to the $full_name variable.

This is true even for more complex operations:

$full_name = "Aisle" . " " . "Nevertell" . " " . "Nomaderwat";
echo $full_name; // Prints: Aisle Nevertell Nomaderwat
One theme you may notice as you learn a programming language’s syntax is that common actions that programmers need to do a lot often have a shortcut. Consider the following:

$full_name = "Aisle";
$full_name = $full_name . " Nevertell";
echo $full_name; // Prints: Aisle Nevertell
In the code above, we have the variable $full_name assigned the value "Aisle". We want to reassign $full_name to its current value appended with the string " Nevertell".

Believe it or not, this is such a common task that PHP offers a shorthand notation, the concatenating assignment operator (.=). Let’s compare the same action but using this alternate operator:

$full_name = "Aisle";
$full_name .= " Nevertell";
echo $full_name; // Prints: Aisle Nevertell
It may seem funny to provide a shortcut to save just a few characters of typing, but when operations are performed often enough, those keystrokes can really add up. This syntax is also faster and easier to read which makes code easier to maintain.

One important thing to note is that even though PHP is often flexible about whitespace, it is inflexible with the concatenating assignment operator—the . and = characters must not have any spaces or other whitespace characters between them.

Let’s practice!

Instructions
1.
We’re going on a picnic. We started you off with the $sentence variable holding the value "\nI'm going on a picnic, and I'm taking apples".

Use the concatenating assignment operator (.=) to add another item to our list. The string you append should start with a comma(,) and a space followed by a word which starts with the letter “b”.

Next use echo to print the new value of $sentence.

2.
That was fun. Let’s keep playing.
This time use the concatenating assignment operator (.=) to append a string which starts with a comma(,) and a space followed by a word which starts with the letter “c”.

Use echo to print the newest value of $sentence.  
*/

<?php
  echo "I'm going on a picnic!";

  $sentence = "\nI'm going on a picnic, and I'm taking apples";
  echo $sentence;

// Write your code below:
 $sentence .= ", b";
 echo $sentence;
 $sentence .= ", c";
 echo $sentence;

/*I'm going on a picnic!
I'm going on a picnic, and I'm taking apples
I'm going on a picnic, and I'm taking apples, b
I'm going on a picnic, and I'm taking apples, b, c
*/

--------------------------------------------------
PHP STRINGS AND VARIABLES
Assign by Reference


/*When we create a variable assigned to another variable, the computer finds a new space in memory which it associates with the left operand, and it stores a copy of the right operand’s value there.

GIF of assigning by value

This new variable holds a copy of the value held by the original variable, but it’s an independent entity; changes made to either variable won’t affect the other:

$first_player_rank = "Beginner"; 
$second_player_rank = $first_player_rank; 
echo $second_player_rank; // Prints: Beginner

$first_player_rank = "Intermediate"; // Reassign the value of $first_player_rank
echo $second_player_rank; // Still Prints: Beginner
We can also create an alias, or nickname, for a variable. Instead of a copy of the original variable’s value, we create a new name which points to the same spot in memory.

GIF of assigning by reference

We use a different operator for this—the reference assignment operator (=&).

When we assign by reference we’re saying that the variable on the left of the operator should point, or refer, to the exact same data as the variable on the right. With assignment by reference, changes made to one variable will affect the other:

$first_player_rank = "Beginner";
$second_player_rank =& $first_player_rank; 
echo $second_player_rank; // Prints: Beginner

$first_player_rank = "Intermediate"; // Reassign the value of $first_player_rank
echo $second_player_rank; // Prints: Intermediate
Ok, let’s get some practice!

Instructions
1.
You’ve inherited some code from another developer. You can’t change their code, but you need to add some additional functionality. Instead of using the $very_bad_unclear_name variable as is in your part of the code. Declare a new variable, $order, as a reference to the $very_bad_unclear_name variable.

2.
Use the concatenation assignment operator to append more things to $order.

Awesome! Notice how when we echo the $very_bad_unclear_name variable at the end of the programs, the changes you made are reflected in the output!


*/
<?php
/* Imagine a lot of code here */  
  $very_bad_unclear_name = "15 chicken wings";

// Write your code here:
  $order =& $very_bad_unclear_name;
	$order .= " Hong";
    
  // Don't change the line below
  echo "\nYour order is: $very_bad_unclear_name.";


Your order is: 15 chicken wings Hong.

------------------------------------------------








  
  


