skill_completed = "Python Syntax"
exercises_completed = 13
#The amount of points for each exercise may change, because points don't exist yet
points_per_exercise = 5
point_total  = 100
point_total += exercises_completed*points_per_exercise
print("I got " +str(point_total)+ " points!")

float_1 = 0.25
float_2 = 40.0
product = float_1*float_2
big_string = "The product was " + str(product)

# Hi! I'm Maria and I live in script.py.
# I'm an expert Python coder.
# I'm 21 years old and I plan to program cool stuff forever.
age_is_12 = False
name_is_maria = True

#Multi-line Strings
haiku = """The old pond,
A frog jumps in:
Plop!"""

print haiku

#Two Types of Division
cucumbers  = 100
num_people = 6
whole_cucumbers_per_person = cucumbers/num_people
print(whole_cucumbers_per_person)
float_cucumbers_per_person = float(cucumbers)/num_people
print(float_cucumbers_per_person)

#Numbers
cucumbers = 1
price_per_cucumber = 3.25
total_cost = cucumbers*price_per_cucumber
print(total_cost)


#PYGLATIN
# Testing, Testing, is This Thing On?
# pyg = 'ay'

original = raw_input('Enter a word:')

if len(original) > 0 and original.isalpha():
  print original
  word = original.lower()
  first = word[0]
  new_word = word[1:len(new_word)] + word[0] + pyg
else:
  print 'empty'


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

------------------------------------------------------

#FUNCTIONS
import math # Imports the math module
everything = dir(math) # Sets everything to a list of things from math
print everything # Prints 'em all!
  
def biggest_number(*args):
  print max(args)
  return max(args)
    
def smallest_number(*args):
  print min(args)
  return min(args)

def distance_from_zero(arg):
  print abs(arg)
  #return abs(arg)

biggest_number(-10, -5, 5, 10)
smallest_number(-10, -5, 5, 10)
distance_from_zero(-10)  


print(type(5))
print(type("hong"))
print(type(3.4))









