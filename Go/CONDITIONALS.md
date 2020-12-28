# Scoped Short Declaration Statement
We can also include a short variable declaration before we provide a condition in either if or switch statments. Here’s the syntax:

x := 8
y := 9
if product := x * y; product > 60 {
  fmt.Println(product, "  is greater than 60")
}
In our if statement, we first declare product. Notice that product is separated from the condition using a semi-colon ;. We can also have a short variable declaration inside a switch statement:

switch season := "summer" ; season {
case "summer"
  fmt.Println("Go out and enjoy the sun!")
}
__One thing to keep in mind when using the short variable declaration in if or switch statements is that the declared variable is scoped to the statement blocks. In programming, scope refers to where variables can be accessed. Having the variable scoped to the if… else if… else statement or switch statement means that variable is only accessible within the blocks of those statements and not anywhere else.__

x := 8
y := 9
if product := x * y; product > 60 {
  fmt.Println(product, "  is greater than 60")
}
fmt.Println(product)
The code above will throw the error:

./main.go:11:13: undefined: product
Even though we defined product in our code snippet, we can only access product inside of the if block. Therefore, when we try to access it outside of the block, the compiler throws an error. We say that product is out-of-scope outside the if statement.

Let’s use this handy shortcut in our code.

--------------------------

# Randomizing
Previously, we used hard coded values (values that don’t change) and then created conditionals that checked on these values. For example:

alarmRinging := true
if alarmRinging {
    fmt.Println("Turn off the alarm!!")
}
We knew that our condition would be true and the print statement would execute. This level of certainty is usually NOT the reason why we would use a conditional. Instead, we create conditionals to account for different conditions and different possible outcomes.

So let’s introduce some uncertainty to our code by generating a random number. Go has a math/rand library that helps us generate a random integer:

import (
  "math/rand"
  "fmt"
)

func main() {
  fmt.Println(rand.Intn(100))
}
In our main function, we’re printing out a random number using rand and the Intn() method. The argument, 100, is the maximum value that the method will return. Looking at the entire line fmt.Println(rand.Intn(100)), it should print a random integer from 0 to 100. However, if we run our program multiple times, we’ll find that it always prints 81.

We’ll figure out why this happens in the next exercise, for now let’s see rand.Intn() in action.

----------------------
# Seeding
Previously, we saw how our random numbers weren’t entirely random. __The reason for this behavior is due to how Go seeds or chooses a number as a starting point for generating random numbers. By default, the seed value is 1. We can provide a new seed value using the method rand.Seed() and passing in an integer.__

However, we encounter the same problem if we pass in a constant, i.e. pass in 5. Each time we run our program, we’ll always print the same set of numbers. Therefore, each time we run our program, we also need a unique number as a seed. One way to get this unique number each time we run our program is to use time. The reason why we can use time to be our unique number is because it’s always a different time when our program is run! Take for example:

package main

import (
  "fmt"
  "math/rand"
  "time"
)

func main() {
  rand.Seed(time.Now().UnixNano())
  fmt.Println(rand.Intn(100))
}
In the example above, we import the time library. We then use the time library and call .Now() with the .UnixNano() method chained to it. This results in the difference in time (in nanoseconds) since Janurary 1st, 1970 UTC. (Check out the UnixNano documentation for more details). __The number that we get from time.Now().UnixNano() is passed as an argument to rand.Seed() resulting in a different seed value each time we run our program. Since each run has a unique seed value, each run will also print out a random number from 0 to 100.__

Let’s see this change in our own code.

Instructions
1.
Generate a new seed value at the top of the main function using the line:

rand.Seed(time.Now().UnixNano())
After you pass this checkpoint, run your code again to see amountLeft change during each run!


-------------------
# Review
If you’ve made it to this exercise, then you’ve finished Go’s conditionals lesson, great job!

Here are the topics covered In this lesson:

How to create an if statement that checks a condition and executes code if the condition is true
How to add an else if statement to check for additional conditions.
The use of an else statement that runs by default if none of the previous conditional statements evaluated to true.
Comparison operators check between two operands and evaluate to a boolean.
Logical operators check between two boolean values and return a single boolean.
switch statements can be used to check between multiple conditions much like an if… else if… else statement.
Short variable declarations can be used prior to providing a condition for either if or switch statements. Declared variables are scoped to the statement blocks.
The math/rand library’s .Intn() method is used to generate random numbers.
Go uses a seed value to as a starting point for generating random numbers.
Unique seed values can be created using time, namely rand.seed(time.Now().UnixNano())
Including conditionals in allows you to add a layer of logic to your code to address many different scenarios. It’s an important foundational skill to have under your belt as a developer.

Instructions
If you want to challenge yourself, try writing an if… else if… else and/or switch statement from scratch. Here are a few ideas to write the statements for:

Use comparison operators in a switch statement.
Create a numeric grade to letter grade conditional (or vice versa).
Create conditionals for a flow chart, e.g. what to do/check if your computer won’t power on.
Create a conditional that prints the price of an item when a condition is matched.