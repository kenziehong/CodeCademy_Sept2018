# Values and Variables

Programs, like the ones we write in Go, are excellent at processing and performing operations on data. But in programming, “data” can be so many different things. Data can be numbers, boolean values (true/false), strings (blocks of text), or combinations thereof.

In this lesson, we’ll be covering how to store “data” by creating and using variables in Go.

We’re going to look into the different ways we can interact with these values (like adding two numbers together, or creating a longer message from two strings). We’re also going to discuss data types, the specific divisions that Go uses to “expect” certain qualities from variables. By creating and assigning values to our variables, we’ll understand the limitations and benefits of using different data types.

We’ll also cover how to read Go error messages — creating and using variables adds a new level of complexity to our programs to make these errors much more likely. This will be a good learning process, life as a programmer involves reading and interpreting these error messages quite often!

---------------

# Literals
In Go, values can be many things. Just to name a few, values can be numbers (like 109), or text wrapped in quotes (like "Hello world"). These values can be written into code as is, and are called literals. __They are literally what they say they are.__

We can perform arithmetic in Go with literals (or named values, covered in the next exercise) using the following operators:

+ to add
- to subtract
* to multiply
/ to divide
% to take the remainder (the modulus operator) between two numbers.
fmt.Println(20 * 3) // Prints: 60
fmt.Println(55.21 / 5) // Prints: 11.042
fmt.Println(9 % 2) // Prints: 1
Imagine the code above as appearing inside the main function body of a Go program. In this snippet, we used the Go programming language as a calculator. We printed out the product of multiplying 20 and 3 (60). We next printed out the quotient of dividing 55.21 by 5 (11.042). We lastly printed out the remainder left over after dividing 9 by 2 (9 divided by 2 has a remainder of 1).

--------------

# Constants
In addition to literal (aka unnamed) values, there are also named values. Naming a value in Go means creating a word that will represent that value. One example of named values are constants, which cannot be updated while the program is running. Another example of named values are variables which we can update their value. We’ll focus on constants in this exercise and discuss variables at length in later exercises.

We use the const keyword to create a constant. We immediately assign a value to the constant using a literal. Throughout the rest of the program, we can use the constant’s name instead of the literal.

const funFact = "Hummingbirds' wings can beat up to 200 times a second."

fmt.Println("Did you know?")
fmt.Println(funFact)
Which prints:

Did you know?
Hummingbirds' wings can beat up to 200 times a second.
Above, we created a constant named funFact, which contains the text "Hummingbirds' wings can beat up to 200 times a second.". We were then able to print out this value using the names we applied. This is useful if a value doesn’t change throughout a program and it also helps to convey the developer’s intention of keeping a consistent value.

Let’s also take a second to examine the peculiar name, funFact. __Constants have names without spaces: spaces aren’t allowed!__ This means that for us to have descriptive names (and it is important to have descriptive names so that we can read the code we’ve written) we need to use camelCase or PascalCase, capitalizing each subsequent word instead of adding spaces.

----------------------

# What is a Data Type?
Programming languages need to process and organize data. That data is stored as binary numbers (numbers consisting of 0’s and 1’s) in the memory of your computer. In this way, binary numbers are used to represent many different things. Data types are designations by a programming language about what information is being stored. Go comes with a number of basic types, data types built into the programming language. It’s also possible to create your own types that combine these basic types into something more complex, but let’s first cover the data that you can store by default in Go.

Go has three basic categories for numbers:

Integers, or ints, are whole/counting numbers. You would use an int to count the number of books on a shelf, the number of products in a warehouse, the number of people on a website, etc…

Floating-point numbers, or floats, can include fractional data. You would use a float to store distances, percentages, and other quantities that required division or precision.

Complex numbers, complex, are pairs of floating-point numbers where the second part of the pair is marked with the “imaginary” unit i. Complex numbers are particularly useful when reasoning in 2-dimensional space and have other utilizations that make them relevant for involved calculations, but we won’t be discussing them at length in this course.

-------------------

# Basic Numeric Types in Go
Go has 15 different numeric types that fall into the three categories: int, float, and complex. That means there are fifteen different ways to describe a number in Go. This includes 11 different integer types, 2 different floating-point types, and 2 different complex number types. These types all recognize different sets of numbers as valid. An integer can’t store the number 8.6132, for instance.

Beyond being broken down into the three categories, types also indicate how many bits (binary digits) will be used to represent the data. Fewer bits means fewer different possible values for the data, enforced as a strict minimum and maximum value for integers and less precision for floats and complex numbers. Fewer bits also means less data to save, so it will use less of a computer’s memory to hold onto that data. So, while it may be tempting to use types that can take a larger range of values, it can slow down a computer’s performance or cause the computer to run out of memory.

Integers are further broken down into two categories: signed and unsigned. Signed integers can be negative, but unsigned integers can only be positive. This means that the minimum value for an unsigned integer is always 0. Since it can ignore the possibility of a negative value, an unsigned integer’s maximum value is much higher than a signed integer with the same number of bits.

Go also has a boolean type. Booleans are either false or true. Go only needs one bit to store a boolean value: 0 represents false and 1 represents true.

http://prntscr.com/sl54m6
https://golang.org/ref/spec#Numeric_types

-----------------

# What is a Variable?
Now that we have some background on what types are, we can talk about what variables are and how we make and use them. A variable is a named value (like a constant) with the added feature that it can change during the running of a program. If we’re working with a value in various places in our program, we can store that value in a variable to easily access it later.

__Variables are defined with the var keyword and two pieces of information: the name that we will use to refer to them and the type of data stored in the variable.__ Since variables can be updated we don’t even need to assign a value initially. Here’s a couple of variable definitions:

var lengthOfSong uint16
var isMusicOver bool
var songRating float32
Above, we created three variables:

An unsigned 16-bit integer called lengthOfSong.
A boolean value called isMusicOver.
A 32-bit float called songRating.
Notice that our variable names also follow the same naming convention of constants, using camelCase with a descriptive name.

-------------------

# Reading Go Errors
There is no shame in having your code fail to run. Programming errors and exceptions happen all the time and learning to read and understand them is an indispensable tool in a programmer’s toolbox.

When the Go compiler raises an error the program’s binary cannot get created and without the binary, our computer cannot execute the program’s code. Go tries to tell you what the issue is by offering you the following pieces of information: the name of the file where something went wrong, the line number in that file where Go noticed an issue, and the column number (the number of characters from the left) on that line where the error occurred. One common error occurs when Go language’s compiler recognizes that there is a defined variable that isn’t used in the program. Take for example:

package main

func main() {
  var numberWheels int8
}
When we attempt to run main.go and on line 4 of our file we define the variable numberWheels that we don’t use anywhere else in the program we will see the following message:

./main.go:4:7: numberWheels declared and not used
__Notice that the error message contains the file name (main.go), the line that causes the error to be raised (line 4) and specifically the location (7 characters to the right of the line break). If we remove the variable from our program or use it somewhere we appease Go’s compiler and can run our program.__

This may seem like a downside to a language, something that keeps you from expressing your freedom and personality as a programmer, but it is designed to discover possible errors in your program sooner rather than later. An unused variable is a waste of memory, but it can also be a typo or an unintended omission. In this case, Go’s somewhat hardline stance is to keep programmers from wondering why their code isn’t working the way they expect by refusing to run until some action is taken on this unused definition.

--------------------

# Zero Values
Even before we assign anything to our variables they hold a value. __Go’s designers attempted to make these “sensible defaults” that we can anticipate based on the variable’s types. All numeric variables have a value of 0 before assignment. String variables have a default value of "", which is also known as the empty string because it contains no characters. Boolean variables have a default value of false.__ For example:

var classTime uint32
var averageGrade float32
var teacherName string
var isPassFail bool

fmt.Println(classTime) // Prints 0
fmt.Println(averageGrade) // Prints 0
fmt.Println(teacherName) // Doesn't print anything
fmt.Println(isPassFail) // Prints false
Above we declared four variables, an unsigned 32-bit int, a 32-bit floating point number, a string, and a boolean. Without assigning any of the variables to a value we print them out to see their default value. The two numbers print the same result, 0, a valid value for both types. The empty string, when printed, displays nothing. The boolean value prints false.

---------------

# Inferring Type
There is a way to declare a variable without explicitly stating its type using the short declaration := operator. We might use the := operator if we know what value we want our variable to store when creating it. For instance:

nuclearMeltdownOccurring := true
radiumInGroundWater := 4.521
daysSinceLastWorkplaceCatastrophe := 0
externalMessage := "Everything is normal. Keep calm and carry on."
Above, we were able to define a bool, a float, an int, and a string without specifying the type. __We used the := to create a variable and infer its type based on the value provided. Floats created in this way are of type float64. Integers created in this way are either int32 or int64 (we’ll discuss how this is in the next exercise).__

Go also offers a separate syntax to declare a variable and infer its type. We could’ve written the same code from above as:

var nuclearMeltdownOccurring = true
var radiumInGroundWater = 4.521
var daysSinceLastWorkplaceCatastrophe = 0
var externalMessage = "Everything is normal. Keep calm and carry on."
Notice, in the second example, that we used the var keyword and the = operator. In both examples, we’ve declared and initialized variables while leaving the Go compiler to infer the type of the value assigned.

------------------
# Default int Type

__There is one more common way to define an int in Go. Computers actually have a default length for the data in their Read-Only Memory (ROM). Some newer comps may have more processing power and can store/handle bigger chunks of data. These computers might be using a 64-bit architecture, but other computers still run on 32-bit architecture and work just fine. By providing the type int or uint, Go will check to see if the computer architecture is running on is 32-bit or 64-bit. Then it will either provide a 32-bit int (or uint) or a 64-bit one depending on the computer itself.__

It’s recommended to use int unless there’s a reason to specify the size of the int (like knowing that value will be larger than the default type, or needing to optimize the amount of space used).

var timesWeWereFooled int
var foolishGamesPlayed uint
Above, we declared two variables, timesWeWereFooled an integer of either 32 or 64 bits. foolishGamesPlayed, an unsigned integer of either 32 or 64 bits.

consolationPrizes := 2
When a variable is declared and assigned a value using the := operator, it will be the same type as if it were declared as an int. In the example above, consolationPrize has the type int.

-----------------

# Updating Variables
Variables are different from constants because we can update them. This update feature becomes incredibly important when we need to use the original value of a variable for a calculation (or any general manipulation) and then update the variable to store the newly calculated value. Let’s say we were keeping track the cost of items in our grocery basket:

var basketTotal float64
carrotPrice := 0.75

basketTotal = basketTotal + carrotPrice
fmt.Println(basketTotal) // Prints: 0.75
Notice that we used the original value of basketTotal which wasn’t assigned a value, so it has a default value of 0.0, added carrotPrice (0.75) and then assigned the computed value to basketTotal.

If we add another item:

spinachPrice := 1.50
basketTotal = spinachPrice + basketTotal
fmt.Println(basketTotal) // Prints: 2.25
This time, we added spinachPrice to basketTotal and stored the new value again in basketTotal, thereby updating our running total! Updating a variable by adding another number to itself and saving the new value is so common that Go has a shorthand for it, the += operator. We could have done the same operation using the following syntax:

spinachPrice := 1.50
basketTotal += spinachPrice
fmt.Println(basketTotal) // Prints: 2.25
Notice that basketTotal = spinachPrice + basketTotal and basketTotal += spinachPrice do the same thing! We can also do the same for strings (i.e. concatenating strings together):

command := "Hold my "
beverage := "soda"

command += beverage
fmt.Println(command) // Prints: Hold my soda
See how we were able to update command using += to store the value of both strings together?

In addition to += (yes, pun intended), Go has other arithmetic operations that perform calculations and update the variable’s value:

-= to subtract from the variable.
*= to multiply the variable by a factor.
/= to divide the variable by a dividend.
Let’s get some practice using these shorthand operators.

---------------

# Multiple Variable Declaration
So far we’ve been declaring variables one by one, each on their own separate line. But Go actually allows us to declare multiple variables on a single line, in fact, there’s a few different syntaxes!

Let’s start with declaring without assigning a value:

var part1, part2 string
part1 = "To be..."
part2 = "Not to be..."
Above, we declared both part1 and part2 on the same line both with the same type. If we’re using this syntax, both variables must be the same type.

If we already know what values we want to assign our variables we can use := like so:

quote, fact := "Bears, Beets, Battlestar Galactica", true
fmt.Println(quote) // Prints: Bears, Beets, Battlestar Galactica
fmt.Println(fact) // Prints: true
In the example above, we declare both quote and fact in the same line with one operator (:=). These variables are then assigned their respective values based on the ordering of variables and value. Since quote is the first variable, and the string "Bears, Beets, Battlestar Galactica" is the first value, quote has a value of "Bears, Beets, Battlestar Galactica". Similarly, fact then is assigned the value true.


--------------------------

# Review
In this lesson you learned:

How to use literals in a Go program.
How to create constants that give names to values.
The basic types in Go: ints, floats, complexs, and strings.
The different numeric types and what values they accept.
How to create variables in Go with a specific type.
How to read an error in Go.
How to assign values to variables using =.
How to create variables in Go with inferred type.
How to declare multiple variables on a single line.
The “zero” values for variables that haven’t been assigned a value yet.
How Go decides the type for “default” int types depending on the architecture of the computer it’s running on.
How to update values in variables using = and other related operators.
What a lot of concepts! These tools will be very valuable to you along your journey as a programmer. Congratulations!

Instructions
If you want to challenge yourself more:

Use Go’s -=, *=, /= operators to do some mathematical calculations.
Using variables to customize a greeting message for yourself and other users.
Edit how the current variables are declared and initialized (but keep the same functionality).