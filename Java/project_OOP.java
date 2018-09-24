Basic Calculator
1.
Create a public class called Calculator.

2.
Inside of the class, create a Calculator constructor. You can leave the contents of the constructor empty.

3.
Next, create a public method that returns an int and call it add.

4.
The add method should accept two int parameters. For example: int a, int b.

5.
The add method should add the two integer parameters that a user will specify. Inside of the add method, return the sum of a and b.

6.
Next, create another similar method called subtract. The subtract method should accept two int parameters, just like the add method.

7.
Inside of the subtract method, return the difference of a and b.

8.
Create another method called multiply. The multiply method should accept two int parameters.

9.
Inside of the multiply method, return the product of a and b.

10.
Create another method called divide. It should accept two int parameters.

11.
The divide method is special because we have to make sure that the calculator does not allow division by 0. Create an if statement that checks if the value of b is equal to 0.

12.
Inside of the if statement, print out a helpful error message to the user. For example, you can print out: Error! Dividing by zero is not allowed..

13.
The divide method must still return an int. On the next line, return 0.

14.
Complete the if statement by adding an else block. Inside of the else block, return a divided by b.

15.
Create another method called modulo. It should accept two int parameters.

16.
The modulo method is another special method because we have to make sure that the calculator does not allow division by 0. Create an if statement that checks if the value of b is equal to 0.

17.
Inside of the if statement, print out a helpful error message to the user. For example, you can print out: Error! Dividing by zero is not allowed..

18.
The method must still return an int. On the next line, return 0.

19.
Complete the if statement by adding an else block. Inside of the else block, return a modulo b.

20.
Next, create a main method. Note: the main method must be defined exactly the same way every time it is created. Refer back to the lesson if you need to review the main method.

21.
Inside of main, create a Calculator object called myCalculator.

22.
Print out the value of calling the add method on myCalculator. Pass in 5 and 7 as parameters.

Hint: System.out.println(myCalculator.add(5, 7));

23.
On the next line, print out the value of calling the subtract method on myCalculator. Pass in 45 and 11 as parameters.

24.
If you completed this project correctly, the output should be 12 and 34. Feel free to explore more with the program. What are some ways in which the program could be improved?

25.
Add comments near the top of the program that describe what the program does.

26.
Click here for a video walkthrough from our experts to help you check your work!


---------------------------------->
//Basic Calculator
public class Calculator{
  
   
  public int add(int a, int b){  
    return a + b;
  }
  
  public int subtract(int a, int b){
    return a - b;
  }
  
  public int multiply(int a, int b){
    return a * b;
  }
  
  public int divide(int a, int b){
    if(b==0){
      System.out.println("Error!Dividing by zero is not allowed");
      return 0;
    }else{
      return a/b;
    }
  }
  
  public int modulo(int a, int b){
    if(b==0){
      System.out.println("Error!Dividing by zero is not allowed");
      return 0;
    }else{
      return a%b;
    }
  }
  
  public Calculator(){
    
  }
  
   
  public static void main(String[] args){
    Calculator myCalculator = new Calculator();
    System.out.println(myCalculator.add(5,7));
    System.out.println(myCalculator.subtract(45,11));
    
  }
  
}

