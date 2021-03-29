# The Point of Pointers and Addresses
__Go is a pass-by-value language.__ In other words, we’re passing functions the value of an argument. In a technical sense, when we’re calling a function with an argument, the Go compiler is strictly using the value of the argument rather than the argument itself. Because of this feature (pass-by-value), the changes that take place in our function, stay within that function.

Picture a teacher with a classroom of students and the teacher needs the students to complete a worksheet. The teacher will have the original copy of the worksheet and make copies for his/her students to write on, but the students are not directly writing on the teacher’s copy.

But, we do have the ability to change values from different scopes. To do so, we need to make use of:

addresses
pointers
dereferencing
Now that we know what topics we need to reference, let’s quickly address this situation and get to the point!

Instructions
Read through the code provided and think about what is supposed to be printed out. Does the value of x change? In the next couple of exercises, we’ll explore the why.

-------------------

# Addresses

Picture being in class and taking part in a lesson. When we hear an important detail, we write it down in our notebook for reference later. This same idea of storing important information somewhere is the reason why we declare variables in Go. __But instead of writing information down in a notebook, a computer sets aside some space in its memory to store the value. The space that the computer allocates is called an address. Each address is marked as a unique numerical value.__

Every time we use a variable, what we’re doing is retrieving the value stored at the variable’s address. Here’s a simple visualization:

Go diagram showing memory addresses with corresponding hexadecimal values for the addresses

To find a variable’s address we use the & operator followed by the variable name, like so:

x := "My very first address"
fmt.Println(&x) // Prints 0x414020
__When we see the 0x prefix, this means that the number is in formatted in hexadecimal, which is a way of representing 16 digit numbers.__ Thus, the 0x414020 is actually the address of x in hexadecimal format.

Let’s print out the address of a variable for ourselves.

http://prntscr.com/slgs5b

----------------------

# Pointers
In the previous exercise we went over addresses, now let’s learn how to store them. __In Go, pointers do that job for us. Pointers are variables that specifically store addresses.__

We even set the data type of the addresses’ value for the pointer. For instance:

var pointerForInt *int
In the example above pointerForInt will store the address of a variable that has an int data type. To break it down further, the * operator signifies that this variable will store an address and the int portion means that the address contains an integer value.

With pointerForInt initialized, we can assign it value like so:

var pointerForInt *int

minutes := 525600

pointerForInt = &minutes

fmt.Println(pointerForInt) // Prints 0xc000018038
Notice in our example that minutes has a value of 525600, an integer type. Since we’ve initialized pointerForInt as a pointer that will hold the address of an integer value, we can then assign the address of minutes (&minutes) to pointerForInt. Printing out pointerForInt, we get another hexadecimal number: 0xc000018038.

We can also declare a pointer implicitly like other variables:

minutes := 55

pointerForInt := &minutes
Let’s see how we would create a pointer for a string instead!

Instructions
1.
Given the string star, create a pointer called starAddress that holds the address of star.


Stuck? Get a hint
2.
Print out the string "The address of star is" followed by the value of starAddress.

-------------------

# Dereferencing
__We know that addresses are where values are stored and pointers allow us to keep track of addresses. But what if we want the address to store a different value? Well, we can actually use our pointer to access the address and change its value! This action is called dereferencing or indirecting.__

We’ll need to use the * operator again on a pointer and then assign a new value like so:

lyrics := "Moments so dear"
pointerForStr := &lyrics

*pointerForStr = "Journeys to plan"

fmt.Println(lyrics) // Prints: Journeys to plan
In our example, we have our variables: lyrics that has the value of "Moments so dear" and pointerForStr which is a pointer for lyrics. Then we use the * operator on pointerForStr to dereference it and assign a new value of "Journeys to plan". When we check the value of lyrics it’s now "Journeys to plan"!

-------------------

# Changing Values in Different Scopes
__Using our knowledge of addresses, pointers, and dereferencing, let’s return to our initial problem: How can we change the value of a variable when we’re in a different scope? Let’s take a look at the code again:__

func addHundred(num int) {
  num += 100
}

func main() {
  x := 1
  addHundred(x)
  fmt.Println(x) // Prints 1
}
Even though we call addHundred(x), the value of x doesn’t change! Why is that?

Remember, Go is a pass-by-value language. When we call addHundred(x) we’re providing addHundred() with a value of 1. We’re not actually providing the address of x for addHundred() to go in and change the value stored there.

If we want to change the value of x using a function, we’re going to need to first change our function:

func addHundred (numPtr *int) {
  *numPtr += 100
}
Our new function now has a parameter of a pointer for an integer. By passing the value of a pointer (which is an address) to addHundred(), we can also dereference the address and add 100 to its value. But now that addHundred() expects a pointer for an argument, we’re also going to need to change our main()! The complete code is as follows:

func addHundred (numPtr *int) {
  *numPtr += 100
}

func main() {
  x := 1
  addHundred(&x)
  fmt.Println(x) // Prints 101
}
Since addHundred() expects a pointer (and pointers are variables that store an address) the final touch was to provide addHundred() the address of x. With that, x is now 101!

--------------------

# Review
Congrats! You can now change variable values even when the variables are out of scope!

The following concepts were covered in this lesson:

Go is a pass-by-value language.
An address is where a value is stored.
To find an address of a variable, use the & operator before a variable.
Pointers are variables that store an address.
A pointer is specific to what type of address it can store.
The * operator can be used to assign a pointer the type of the value its address holds.
The * operator can also be used to dereference a pointer and assign a new value.
Instructions
If you want to practice more with pointers and addresses:

Create a function that changes a boolean value from a different scope.
Create a function that changes a float value from a different scope.
Find the zero value of a pointer that is initialized but hasn’t been assigned a value.