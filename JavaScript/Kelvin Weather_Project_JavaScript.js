//Current temperature in kelvin degrees
const kelvin = 230;
//Converting kelvin to celsius
const celsius = kelvin - 273;
//Converting celsius to fahrenheit
let fahrenheit = celsius*(9/5)+32;
//Round down fahrenheit variable
fahrenheit = Math.floor(fahrenheit);
console.log(`The temperature is ${fahrenheit} degrees Fahrenheit.`);


------------------------------------------------

1.
The forecast today is 293 Kelvin. To start, create a variable named kelvin, and set it equal to 293.

The value saved to kelvin will stay constant. Choose the variable type with this in mind.

2.
Write a comment above that explains this line of code.

Add single line comments with //.

3.
Celsius is similar to Kelvin — the only difference is that Celsius is 273 degrees less than Kelvin.

Let's convert Kelvin to Celsius by subtracting 273 from the kelvin variable. Store the result in another variable, named celsius.

const celsius = kelvin - 273;
4.
Write a comment above that explains this line of code.

5.
Use this equation to calculate Fahrenheit, then store the answer in a variable named fahrenheit.

Fahrenheit = Celsius * (9/5) + 32

In the next step we will round the number saved to fahrenheit. Choose the variable type that allows you to change its value.

let fahrenheit = celsius * (9 / 5) + 32;
6.
Write a comment above that explains this line of code.

7.
When you convert from Celsius to Fahrenheit, you often get a decimal number.

Use the .floor() method from the Math library to round down the Fahrenheit temperature. Save the result to the fahrenheit variable.

fahrenheit = Math.floor(fahrenheit);
8.
Write a comment above that explains this line of code.

9.
Use console.log and string interpolation to log the temperature in fahrenheit to the console as follows:

The temperature is TEMPERATURE degrees Fahrenheit.
Use string interpolation to replace TEMPERATURE with the value saved to fahrenheit.

10.
Run your program to see your results!

If you want to check your work, open the hint.

11.
By using variables, your program should work for any Kelvin temperature — just change the value of kelvin and run the program again.

What's 0 Kelvin in Fahrenheit?