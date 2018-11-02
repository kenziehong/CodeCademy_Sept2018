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
 





























