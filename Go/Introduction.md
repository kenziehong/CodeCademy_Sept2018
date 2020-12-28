## LEARN GO: INTRODUCTION

# From the Get Go

Go, or Golang, is an open sourced programming language designed by three Google employees: Robert Griesemer, Rob Pike, and Ken Thompson. At the start of developing Go, developers at Google had to maintain millions of lines of code that were constantly being updated. The time needed to convert their code into working programs was taking a substantial amount of time, from minutes to even hours! This problem was even compounded by the fact that each developer needed to undergo the same process. To address the problems, the designers of Go aimed to __“eliminate the slowness and clumsiness of software development at Google, and thereby to make the process more productive and scalable”.__

In other words, the purpose of Go was to make it faster and easier for developers to develop. It has modern features like garbage collection and it also takes advantage of powerful multi-core computer capabilities with built-in concurrency support. The appeal of Go’s features and speed has drawn interest by many different types of developers including: application developers and infrastructure teams. As Go’s adoption grows, it’s likely that we’ll see an even larger expansion of its utilization in apps, web development, command-line interfaces and many other implementations!

Before we can make full use of Go, we first have to go over the basics of how to read and run a Go program. Once you’ve finished the entire lesson, read our guide for developing Go locally to set up your computer and create Go programs on your own computer!

-----------

# Compiling
When we write Go code, we’re writing it to be readable for ourselves and other developers. We’re able to make sense of the code and its intentions. Computers, on the other hand, do NOT understand Go code and thus have no direct idea what our code means/does. What computers do understand are a series of 0’s and 1’s (or binary). To translate Go code to binary, Go has a compiler, a piece of software that converts Go code into a program that the computer understands. This translated code is called an executable or a binary file. We can then run the executable which will do what our Go program was written to do.

__To tell the compiler to compile a Go program, we first navigate to our Terminal (on Mac), or Command Prompt (on Windows). Then, type in go build followed by the name of our file and press Enter. If we wanted to run a file called greet.go, the command will look like:__

go build greet.go
While nothing obvious is shown after we run our command, if we type in the command ls, we’ll see our original Go program and executable file.

ls
greet     greet.go
To execute the file, we call ./greet

./greet
Note: If the Go compiler finds that our Go code isn’t written correctly, then it will throw an error and our Go program won’t compile. We’ll need to fix the error before the compiler can properly do its job.

Now let’s go one step further and actually do it!

-------------

# Running Files
Great, we were able to compile our program into an executable file that will always print out “Hello World”. If we want our program to run again, we don’t have to compile the program again, we simply run the executable file. Therefore, if we want fast code that users interact with, we’d compile a program once and use the executable file.

But what happens if we ever wanted to change our program? We would have to compile another executable file and then run that file. Imagine having to do that every single time just to check a small change or fix an error! 😱

Thankfully, we have the go run command followed by the name of the Go program. __The go run command combines both the compilation and execution of code for us. This allows us to quickly check the output of our code (and for any errors). Unlike go build, go run will NOT create executable file in our current folder.__

-------------

# Basic Go Structure: Packages
Now that we understand how to compile and run Go programs, let’s take a detailed look at the structure of Go’s program, specifically its packages:

package main

import "fmt"

func main () {
  fmt.Println("Hello World")
}
Go programs are read from top to down, left to right, so let’s focus on the first line package main. This line is called a package declaration and every Go program starts with one. __The package declaration informs the compiler whether to create an executable or library. In contrast to an executable, a library doesn’t outright run/execute code — it is a collection of code that can be used in other programs. Programs that have the package declaration package main (like ours) will create an executable file.__

Next is a blank line. Go generally ignores these blank lines, they’re considered whitespace (new lines, spaces, and tabs). While our program doesn’t need the line break, it makes our code easier to read, or increases the program’s readability.

Then we have an import statement, import "fmt". The import keyword allows us to bring in and use code from other packages. We should also note that the package name is enclosed with double quotes ", otherwise our program will get an error and not compile/run.

Packages serve important roles in Go. They group related code together, allow code to be reusable, and make it easier to maintain. We only import the packages we need. In turn, our programs run faster because it’s not bogged down by extra code/packages!

Now that we have a general idea of how a Go program is written. Let’s start to write our own from scratch!

---------------

# Basic Go Structure: main
Continuing on with our program, we have:

func main () {
    fmt.Println("Hello World")
}
There are a few things happening in our main function. We’re introduced to how functions (reusable blocks of code) are defined/created in Go. The basic syntax being:

The func keyword denotes the start of a function declaration.
func is followed by the name of the function.
After name is a pair of parentheses () and a set of curly braces {}.
Inside the function block {}, we indent the code inside using a tab. Then we access the fmt package and call its Println (stands for print line) function to print the message "Hello World" to the terminal.

Now let’s take a second and realize that while we defined our main function, we never explicitly told main to run its block of code. In other programming languages, functions have to be called, i.e. told to run its code. __However, a main function is special, a file that has a package main declaration will automatically run the main function!__

This nuance becomes more important as we build more complex programs. In the meanwhile, let’s finish up our program!

--------------

# Importing Multiple Packages
Previously, we imported a single package, fmt. But, we can import so many more! Go has an extensive list of packages that we can take advantage of. Here’s a list of Go’s standard packages

To import multiple packages we can add multiple import statements, like so:

import "package1"
import "package2"
Or we can use a single import with a pair of parentheses that contain our packages:

import (
  "package1"
  "package2"
)
__Notice, when using an import with parentheses, we’re not separating each package with a comma. Instead, each package is on a different line.__

We can also provide an alias to a package by including the alias name before the file. Including an alias will make it easier to refer to the package without typing out the full package name:

import (
  p1 "package1"
  "package2"
)
In the example above we’ve aliased package1 as p1 and now we can call functions from package1 by using p1 like:

p1.SampleFunc()

----------------

# Go Resources
Learning a new language like Go involves learning the accompanying rules and syntax. But, we don’t have to commit everything to memory! It’s ok to search things up, in fact, that’s what all good programmers do!

If you’re ever stuck on something, check out:

Codecademy’s Forums
View questions and answers from learners on this site!
Stack Overflow’s Go questions
A forum of programmers answering programming questions.
Go’s official site
Go to the official site for documentation.
Google
Roll up your sleeves and search it up!
It may help to search Golang instead of Go in certain cases.
In addition to online resources, Go also has it’s own built-in documentation system. To use it, in the command line, use the command go doc followed by a package name. For instance, to find out more information on the fmt package, you can use the command:

__go doc fmt__
In the terminal, you’ll see at the top:

package fmt // import "fmt"

Package fmt implements formatted I/O with functions analogous to C's printf
and scanf. The format 'verbs' are derived from C's but are simpler.
...
The information returned actually spans quite a few lines, the example above is truncated. To get more specific information about a function in a package (like fmt‘s Println function) append .Println (or .println, the capitalization of the function doesn’t matter to go doc) to the command:

go doc fmt.Println
The go doc command is also very helpful when you’re interacting with new libraries and packages. Try it out yourself!

---------------------------------

# Review
Great job! You’ve just finished your first Go lesson! In this lesson you learned about:

What Go/Golang is.
What Go is used for.
Go’s compiler.
How to compile Go files into an executable.
Running an executable file.
Running a Go file without outright compiling it.
What a Go package is.
How to import a Go package.
How to import multiple Go packages.
The uniqueness of the main function in a main package.
How to find help and information.
This first step into a new and fantastical language is the start of a wonderful journey. It’s up to you to decide how far to Go.

If you’re interested in setting up your computer to create Go programs on your own computer, use our guide for developing Go locally!

-------------------
