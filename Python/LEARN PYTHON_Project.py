Mad Libs Project

"""
This program generates passages that are generated in mad-lib format
Author: Katherin 
"""

# The template for the story

STORY = "This morning %s woke up feeling %s. 'It is going to be a %s day!' Outside, a bunch of %ss were protesting to keep %s in stores. They began to %s to the rhythm of the %s, which made all the %ss very %s. Concerned, %s texted %s, who flew %s to %s and dropped %s in a puddle of frozen %s. %s woke up in the year %s, in a world where %ss ruled the world."

print "Mad Libs is starting!"

name = raw_input("Enter a name: ")
adj1 = raw_input("Enter an adjective: ")
adj2 = raw_input("Enter a second adjective: ")
adj3 = raw_input("Enter one more adjective: ")
verb = raw_input("Enter a verb: ")
animal = raw_input("Enter an animal: ")
food = raw_input("Enter a food: ")
fruit = raw_input("Enter a fruit: ")
superhero = raw_input("Enter a superhero: ")
country = raw_input("Enter a country: ")
dessert = raw_input("Enter a dessert: ")
year = raw_input("Enter a year: ")
noun1 = raw_input("Enter a noun: ")
noun2 = raw_input("Enter a second noun: ")

print STORY % (name, adj1, adj2, animal, food, verb, noun1, fruit, adj3, name, superhero, name, country, name, dessert, name, year, noun2)


----------------------------------------------

#Area Calculator Project

#Area Calculator
print("The calculator is starting up...")

#3.store their input into a variable called option
option = raw_input("Enter C for Circle or T for Triangle: ")
if option == "C":
  
  #5.prompt the user to input the radius, convert strings to numbers
  radius = float(raw_input("Enter radius: "))
  pi = 3.14159
  area = pi * (radius**2)
  print("A quarter with radius %s is %s") % (radius, area)
elif option == "T":
  base = float(raw_input("Enter the base: "))
  height = float(raw_input("Enter the height: "))
  area = (0.5) * base * height
  print("A quater with base %s and height %s is %f") % (base, height, area)
else:
  print("Enter an invalid shape")

print("The program is exiting!!!")    

-------------------------------------------------
TAKING A VACATION Project
Plan Your Trip!

def hotel_cost(nights):
  return 140*nights

def plane_ride_cost(city):
  if city == "Charlotte":
    return 183
  elif city == "Tampa":
    return 220
  elif city == "Pittsburgh":
    return 222
  elif city =="Los Angeles":
    return 475
  
def rental_car_cost(days):
  cost = 40
  if days >=7:
    return days*cost - 50
  elif days >=3:
    return days*cost - 20
  else:
    return days*cost

def trip_cost(city, days, spending_money):
  return hotel_cost(days-1) + plane_ride_cost(city) + rental_car_cost(days) + spending_money

print(trip_cost("Los Angeles", 5, 600))

---------------------------------------------------------------

#Number Guess Project

"""
Number Guess Project

The program should do the following:

Roll a pair of dice.
Add the values of the roll.
Ask the user to guess a number.
Compare the user's guess to the total value.
Determine the winner (user or computer).

"""
from random import randint
from time import sleep

def get_user_guess():
  guess = int(raw_input("Guess a number: "))
  return guess

def roll_dice(number_of_sides):
  first_roll = randint(1, number_of_sides)
  second_roll = randint(1, number_of_sides)
  max_val = number_of_sides*2
  print("The maximum %d") % (max_val)
  
  guess = get_user_guess()
  if guess > max_val:
    print("No guessing higher than the maxium possible value!")
  else:
    print("Rolling...")
    sleep(2)
    print("First roll is %d") % (first_roll)
    sleep(1)
    print("Second roll is %d") % (second_roll)
    sleep(1)
    
    total_roll = first_roll + second_roll
    print("Total roll is %d") % (total_roll)
    print("Result...")
    sleep(1)
    
    if guess == total_roll:
      print("You won!")
    else:
      print("Computer won!")
    
    
roll_dice(6)    

--------------------------------------------------------------

"""
Rock, Paper, Scissors
In this project, we'll build Rock-Paper-Scissors!

The program should do the following:

Prompt the user to select either Rock, Paper, or Scissors.
Instruct the computer to randomly select either Rock, Paper, or Scissors.
Compare the user's choice and the computer's choice.
Determine a winner (the user or the computer).
Inform the user who the winner is.
Happy coding!
"""
#Since the computer will select Rock, Paper or Scissors randomly, we will need the randint function - which is not built-in
from random import randint

##. create a list
options = ["ROCK", "PAPER", "SCISSORS"]

#4. create a dictionary
message = {"tie": "Yawn it's a tie!",
           "won": "Yay you won!",
           "lost": "Aww you lost!"
}

#5. write a function that decides who the winner is
def decide_winner(user_choice, computer_choice):
  print "User choice " + user_choice
  print "Computer choice :" + computer_choice
  if user_choice == computer_choice:
    print message["tie"]
  elif user_choice == options[0] and computer_choice == options[2]:
    print message["won"]
  elif user_choice == options[1] and computer_choice == options[0]:
    print message["won"]
  elif user_choice == options[2] and computer_choice == options[1]:
    print message["won"]
  else:
    print message["lost"]
  
    
def play_RPS():
  user_choice = raw_input("Enter Rock, Paper, or Scissors: ").upper()
   
  computer_choice = options[randint(0,2)]
  decide_winner(user_choice, computer_choice)  
  
play_RPS()  
 



----------------------------------------------------------

STUDENT BECOMES THE TEACHER

lloyd = {
  "name": "Lloyd",
  "homework": [90.0, 97.0, 75.0, 92.0],
  "quizzes": [88.0, 40.0, 94.0],
  "tests": [75.0, 90.0]
}
alice = {
  "name": "Alice",
  "homework": [100.0, 92.0, 98.0, 100.0],
  "quizzes": [82.0, 83.0, 91.0],
  "tests": [89.0, 97.0]
}
tyler = {
  "name": "Tyler",
  "homework": [0.0, 87.0, 75.0, 22.0],
  "quizzes": [0.0, 75.0, 78.0],
  "tests": [100.0, 100.0]
}

# Add your function below!
def average(numbers):
  total = float(sum(numbers))
  return total/len(numbers)
  
def get_average(student):
  homeword = average(student["homework"])
  #print"homeword" +str(homeword)
  quizzes = average(student["quizzes"])
  #print "quizzes" +str(quizzes)
  tests = average(student["tests"])
  #print"tests" + str(tests)

  #The \ character is a continuation character. 
  #The following line is considered a continuation of the current line.

  return 0.1*homeword + \
0.3*quizzes + \
tests*0.6

def get_letter_grade(score):
  if score>=90:
    return "A"
  elif score>=80:
    return "B"
  elif score>=70:
    return "C"
  elif score>=60:
    return "D"
  else:
    return "F"
  
#print(get_letter_grade(get_average(lloyd)))  
#print(get_average(tyler))

def get_class_average(class_list):
  results = []
  for student in class_list:
    results.append(get_average(student))
  return average(results)  

students = [alice, lloyd, tyler]
print(get_letter_grade(get_class_average(students)))

----------------------------------------------------------

BATTLESHIP!

from random import randint

board = []

for x in range(0, 5):
  board.append(["O"] * 5)

def print_board(board):
  for row in board:
    print " ".join(row)

print_board(board)

def random_row(board):
  return randint(0, len(board) - 1)

def random_col(board):
  return randint(0, len(board[0]) - 1)

ship_row = random_row(board)
ship_col = random_col(board)
print ship_row
print ship_col

# Everything from here on should be in your for loop
# don't forget to properly indent!
for turn in range(4):
  print "Turn", turn + 1
  guess_row = int(raw_input("Guess Row: "))
  guess_col = int(raw_input("Guess Col: "))

  if guess_row == ship_row and guess_col == ship_col:
    print "Congratulations! You sank my battleship!"
    
    #Add a break under the win condition to end the loop after a win.
    break
  else:
    if guess_row not in range(5) or \
      guess_col not in range(5):
      print "Oops, that's not even in the ocean."
    elif board[guess_row][guess_col] == "X":
      print( "You guessed that one already." )
    else:
      print "You missed my battleship!"
      board[guess_row -1][guess_col-1] = "X"
    print_board(board)
    if turn == 3:
      print("Game Over")


------------------------------------------------------
Command Line Calendar

"""
The program should behave in the following way:

Print a welcome message to the user
Prompt the user to view, add, update, or delete an event on the calendar
Depending on the user's input: view, add, update, or delete an event on the calendar
The program should never terminate unless the user decides to exit

"""
from time import sleep, strftime
USER_FIRST_NAME = "Gilberto"
calendar = {}
def welcome():
  print "Welcome, " + USER_FIRST_NAME + "."
  print "Calendar starting..."
  sleep(1)
  print "Today is: " + strftime("%A %B %d, %Y") 
  sleep(1)
  print "Time is: " + strftime("%H: %M: %S")
  sleep(1)
  print "What would you like to do?"
  
def start_calendar():
  welcome()
  start = True
  while start:
    user_choice = raw_input("A to Add, U to Update, V to View, D to Delete, X to Exit: ")
    if user_choice == "V":
      if len(calendar.keys()) < 1:
        print "Calendar empty."
      else:
        print calendar
    elif user_choice == "U":
      date = raw_input("What date? ")
      update = raw_input("Enter the update: ")
      calendar[date] = update
      print "The update being successful"
      print calendar
    elif user_choice == "A":
      event = raw_input("Enter event: ")
      date = raw_input("Enter date (MM/DD/YYYY): ")
      if len(date) != 10 or \
         int(date[-4:]) < int(strftime("%Y")):
        print("An invalid date was entered")
        try_again = raw_input("Try Again? Y for Yes, N for No: ")
        if try_again == "Y":
          continue
        else:
          start = False
      else:
        calendar[date] = event
        print "The add being successful"
        print calendar
    elif user_choice == "D":
      if len(calendar.keys())<1:
        print "Calendar empty."
      else:
        event = raw_input("What event?")
        for date in calendar.keys():
          if calendar[date] == event:
            del(calendar[date])
            print "The delete being successful"
            print calendar
        #else:
          #print "An incorrect event was specified"
    elif user_choice == "X":
      start = False
    else:
      print " An invalid command was enter"
      start = False
      
start_calendar()            
        
------------------------------------------------------------------------

EXAM STATISTICS

grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def print_grades(grades_input):
  for grade in grades_input:
    print grade

def grades_sum(scores):
  total = 0
  for score in scores: 
    total += score
  return total
    
def grades_average(grades_input):
  sum_of_grades = grades_sum(grades_input)
  average = sum_of_grades / float(len(grades_input))
  return average

def grades_variance(scores):
  average = grades_average(scores)
  variance = 0
  for score in scores:
    variance += (average - score)**2
  return variance/len(scores)

def grades_std_deviation(variance):
  return variance**0.5

print_grades(grades)
print grades_sum(grades)
print grades_average(grades)
variance = grades_variance(grades)
print variance
print grades_std_deviation(variance)      

---------------------------------------------------------

"""
Bank Account

Accepting deposits
Allowing withdrawals
Showing the balance
Showing the details of the account

"""

#1. create a class
class BankAccount(object):
  
  #2. add a member variable called balance and set it equal to 0. This will "represent" the starting balance "of any new BankAccount object"
  balance = 0
  
  #3. add the __init__() method that takes the default self parameter and an additional name parameter. Later, we'll use the name parameter to "specify" who the account belongs to. Inside, assign the self.name property to the name parameter that the method accepts.
  #This method will make sure that whatever name the user types (when creating an object of this class) "will be atrributes to the object"
  def __init__(self, name):
    self.name = name
    
  #4. method defines what represents the object when a user tries to print that object
  #it requires return (instead of print) to display the information associated with an object.
  def __repr__(self):
    return "%s's account. Balance: $%.2f" % (self.name, self.balance)
  
  def show_balance(self):
    print "Balance: $%.2f" % self.balance
    
  #9.
  def deposit(self, amount):
    if amount<=0:
      print "Some error message here"
      return
    else:
      print "The amount of the deposit: $%.2f" % amount
      self.balance +=amount
      self.show_balance()
      
   #10.
  def withdraw(self, amount):
    if amount> self.balance:
      print " Some error message here"
      return
    else:  
      print "The amount of the withdraw: $%.2f" % amount
      self.balance -= amount
      self.show_balance()

#Test      
my_account = BankAccount("Hong")
print my_account
my_account.show_balance()
my_account.deposit(2000)
my_account.withdraw(1000)
print my_account
      
      
---------------------------------------------------------------

LEARN PYTHON
DNA Analysis Project


sample = ['GTA','GGG','CAC']

#3.adding a method that will read a suspect's DNA sample, add the file's content to an empty string, and return the updated string
def read_dna(dna_file):
  dna_data =""
  
  #use with to open file in read-only mode, as f
  with open (dna_file, "r") as f:
    for line in f:
      dna_data += line
      
  return dna_data    

#10. a method that will take a string, creat a list codons from that string, and return a list. This will make the DNA analysis much easier later
def dna_codons(dna):
  codons = []
  for i in range(0, len(dna), 3):
    if (i+3)<len(dna):
      codons.append(dna[i:i+3])
      
    
    
  
  return codons

#16. this method should count the number of times a codon in the sample matches a codon in the suspect's DNA
def match_dna(dna):
  matches = 0
  
  for codon in dna:
    if codon in sample:
      matches +=1     
    
  return matches

#22. a method that will determine if a suspect is the criminal
def is_criminal(dna_sample):
  dna_data = read_dna(dna_sample)
  codons = dna_codons(dna_data)
  num_matches = match_dna(codons)
  
  if num_matches >=3:
    print "%s matches found. Continue investigation" % num_matches
  else:
    print "%s matches found. Free suspect" % num_matches
    
is_criminal("suspect1.txt")   
is_criminal("suspect2.txt")
is_criminal("suspect3.txt")
    
  
---------------------------------------------------------------------

LEARN PYTHON
RGB-HEX Converter

#1. create the RGB to Hex method
def rgb_hex():
  invalid_msg = "Some error message goes here..."
  
  #3. prompt the user to enter a value
  red = int(raw_input("Enter red (R) value"))
  if red<0 or red>255:
    print invalid_msg
    return
  
  green = int(raw_input("Enter green (G) value"))
  if green<0 or green>255:
    print invalid_msg
    return
  
  blue = int(raw_input("Enter blue (B) value"))
  if blue<0 or blue>255:
    print invalid_msg
    return 
  
  #11. create a variable called val. Set it equal to the sum of shifting red to left by 16 bits, shifting green to left by 8 bits, and blue
  #A hexadecimal number can be represented with 3 bytes, a byte for each part of R, G, and B. A byte is composed of two nibbles (4 bit numbers). Hexadecimal numbers have 6 characters and each nibble represents a hex character.
  #Shifting red to the left by 16 bits will insert 16 bits that will hold the place of green (shifted 8 bits to the left) and blue (no shift).  
  val = (red<<16) + (green <<8) + blue
  print val
  
  #12. 
  print "%s" % (hex(val)[2:]).upper()
  
#13. This is the method we'll use to convert the opposite way (from Hex to RGB)
def hex_rgb():
  hex_val = raw_input("Enter the color (six hexadecimal digits): ")
  if len(hex_val) != 6:
    print "Invalid hexidecimal value. Try again."
    return
  else:
    hex_val = int(hex_val, 16) 
  print hex_val
  
  #The variable two_hex_digits represents two hexadecimal digits. This will return the first RGB value (from right to left) of blue (B).
  two_hex_digits = 2**8 
  blue = hex_val % two_hex_digits
  
  #This line does just the opposite of what we did in the previous method. It moves hex_val 8 bits to the right, preparing us to modulo for the next value (G).
  hex_val = hex_val >> 8
  print hex_val
  green = hex_val % two_hex_digits
  
  hex_val = hex_val >> 8
  print hex_val
  red = hex_val % two_hex_digits
  
  print "Red: %s Green: %s Blue: %s" % (red, green, blue)
  
#25.   The method you just wrote will convert a hexadecimal value to an RGB value.
def convert():
  while True:
    option = raw_input("Enter 1 to convert RGB to HEX. Enter 2 to convert HEX to RGB. Enter X to Exit: ")
    if option == '1':
      print "RGB to Hex..."
      rgb_hex()
    elif option == '2':
      print "Hex to RGB..."
      hex_rgb()
    elif option == 'X' or option == 'x':
      break  
    else:
      print "Error"
    
convert()    
    

  
  
  
  
  
  

  
  
  
    
  
  
      
      
    



    
    
  
  
      
    





















