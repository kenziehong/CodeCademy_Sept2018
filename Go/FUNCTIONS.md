# Returning Values from Functions
While variables and their values are scoped to their functions, we do have built-in ways of passing information out of their native functions and into another namespace. Let’s describe the way that information can be sent from within a function to the call site, the place where the function is called. This is done by returning a value — when we return a value, we pass the value to another place in our code. A function can be given a return type, the type of a value that will be returned by the function. At the call site, the return value can be stored within a variable of the same type as the function’s return.

func getLengthOfCentralPark() int32 {
  var lengthInBlocks int32
  lengthInBlocks = 51
  return lengthInBlocks
}
Above, we wrote the function getLengthOfCentralPark(), we can also decide the return type by adding a type after the set of parentheses. In this case, our function has a return type of int32. Then, inside the function, we declare a variable lengthInBlocks with a value of 51. In our last line, we have our return statement. __A return statement tells the function to pass back a value (or multiple values) and stops the function from executing any more code, i.e. if we put more code after our return statement, it would not run! Our function is all set up, we need to now call it in main():__

func main() {
  var centralParkLength int32
  centralParkLength = getLengthOfCentralPark()
  fmt.Println(centralParkLength) // Prints: 51
}
Inside main() we were able to create a variable centralParkLength with type int32 and store the result (the returned value) from getLengthOfCentralPark() into centralParkLength. Then we can check the value of centralParkLength by printing it, which confirms what we said about return by printing the number 51. Even though we can’t access lengthInBlocks from getLengthOfCentralPark() directly, __we can access the information we need through the return keyword!__

--------------------

# Deferring Resolution
We can delay a function call to the end of the current scope by using the defer keyword. __defer tells Go to run a function, but at the end of the current function. This is useful for logging, file writing, and other utilities.__

func calculateTaxes(revenue, deductions, credits float64) float64 {
  defer fmt.Println("Taxes Calculated!")
  taxRate := .06143
  fmt.Println("Calculating Taxes")

  if deductions == 0 || credits == 0 {
    return revenue * taxRate
  }


  taxValue := (revenue - (deductions * credits)) * taxRate
  if taxValue >= 0 {
    return taxValue
  } else {
    return 0
  }
}
In the above example, when we call calculateTaxes() we immediately defer a message, "Taxes Calculated!". This does not print until the end of the function (after the taxes have been calculated and are about to be returned). Normally, we would consider adding fmt.Println("Taxes Calculated!") at the end of calculateTaxes(). But, we have multiple return statements in our code, instead of adding a print statement right before each return, we use defer and it prints regardless of when our function ends. The output would read:

Calculating Taxes
Taxes Calculated!

---------------------
# Review
Congrats! This lesson covered how to:

Define a function.
Understand scope rules.
Return a value from a function.
Add parameters to our function.
Reuse code with functions.
Return multiple values from a function.
Defer events until the conclusion of a function.
Functions are one of the most valuable patterns in code writing and reusability. Being comfortable writing and calling them will serve you well as you go on to build more complex software.

Instructions
If you want to challenge yourself:

Create a function that returns the area of any square.
Create a function that returns both the area of a square and its perimeter.
Create a function that contains a conditional statement and returns at different points of the conditional.