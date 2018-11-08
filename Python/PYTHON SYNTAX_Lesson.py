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


--------------------------------------------------------

#PYTHON LISTS AND DICTIONARIES

animals = ["aardvark", "badger", "duck", "emu", "fennec fox"]
duck_index = animals.index("duck")# Use index() to find "duck"
print(duck_index)

# Your code here!
animals.insert(duck_index, "cobra")


print animals # Observe what prints after the insert operation

my_list = [1,9,3,8,5,7]

for number in my_list:
  # Your code here
  print(number*2)
  
start_list = [5, 3, 1, 2, 4]
square_list = []

# Your code here!
#1. write a for loop that iterates over start_list and append() each number squared to square_list
for number in start_list:
  square_list.append(number)
  square_list.sort()
print square_list  


# Assigning a dictionary with three key-value pairs to residents:
residents = {'Puffin' : 104, 'Sloth' : 105, 'Burmese Python' : 106}

print residents['Puffin'] # Prints Puffin's room number

# Your code here!
#print the values stored under the "Sloth" and "Burmese Python" keys. Accessing dictionary values by key is just like accessing list values by index
print residents["Sloth"]
print residents["Burmese Python"]


menu = {} # Empty dictionary
menu['Chicken Alfredo'] = 14.50 # Adding new key-value pair
print menu['Chicken Alfredo']

# Your code here: Add some dish-price pairs to menu!

#Add at least three more key-value pairs to the menu variable, with the dish name(as a string) for the key and the price(as a float or integer) as the value
menu["Tomatoes"] = 23.4
menu["Apple"] = 53.6
menu["Orange"] = 34.5

print "There are " + str(len(menu)) + " items on the menu."
print menu

# key - animal_name : value - location 
zoo_animals = { 'Unicorn' : 'Cotton Candy House',
'Sloth' : 'Rainforest Exhibit',
'Bengal Tiger' : 'Jungle House',
'Atlantic Puffin' : 'Arctic Exhibit',
'Rockhopper Penguin' : 'Arctic Exhibit'}
# A dictionary (or list) declaration may break across multiple lines

# Removing the 'Unicorn' entry. (Unicorns are incredibly expensive.)
del zoo_animals['Unicorn']

# Your code here!
#Delete items from dictionary using del
del zoo_animals["Sloth"]
del zoo_animals["Bengal Tiger"]

#Set the value associated with "Rockhopper Penguin" to anything other than "Arctic Exhibit"
zoo_animals["Rockhopper Penguin"] = "Hong"
print zoo_animals

backpack = ['xylophone', 'dagger', 'tent', 'bread loaf']

#Remove 'dagger' from the list of items stored in the backpack variable.
backpack.remove("dagger")
print(backpack)

backpack.remove(backpack[0])
print(backpack)

del backpack[0]
print(backpack)

#AttributeError: 'dict' object has no attribute 'remove'

inventory = {
  'gold' : 500,
  'pouch' : ['flint', 'twine', 'gemstone'], # Assigned a new list to 'pouch' key
  'backpack' : ['xylophone','dagger', 'bedroll','bread loaf']
}

# Adding a key 'burlap bag' and assigning a list to it
inventory['burlap bag'] = ['apple', 'small ruby', 'three-toed sloth']

# Sorting the list found under the key 'pouch'
inventory['pouch'].sort() 

# Your code here
#Add a key to inventory called "pocket". Set the value of it to be a list consisting of the strings. Use sort() method to the items in the list stored under the "backpack" key. Then remove("dagger") from the list of items stored under the "backpack" key. Add 50 to the number stored the "gold" key
inventory["pocket"]=['seashell', 'strange berry', 'lint' ] 
inventory["backpack"].sort()
inventory["backpack"].remove("dagger")
inventory["gold"] +=50

------------------------------------------------------------
#A DAY AT THE SUPERMARKET


names = ["Adam","Alex","Mariah","Martine","Columbus"]

#Use a for loop to print out all of the elements in the list names.
for name in names:
  print name

++++++++++++++++++++++++++++++++++
webster = {
  "Aardvark" : "A star of a popular children's cartoon show.",
  "Baa" : "The sound a goat makes.",
  "Carpet": "Goes on the floor.",
  "Dab": "A small amount."
}

# Add your code below!
#Use a for loop to go through the webster dictionary and print out all of the definations
for key in webster:
  print webster[key]

++++++++++++++++++++++++++++++++++++++
a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

#loop through each in the list called a, store each item in the list in the variable item
for item in a:
  if item%2 == 0:
    print item
  

+++++++++++++++++++++++++++++++++++
# Write your function below!
#write a function called fizz_count that takes a list x as input
def fizz_count(x):
  
  #create a variable count to hold the ongoing count. Initialize it to zero
  count = 0
  
  #for each item in x, if that item is equal to the string "fizz" then increment the count varibale. After the loop, please return the count variable
  for item in x:
    if item=="fizz":
      count +=1
  return count    
  

++++++++++++++++++++++++++++++++++++
for letter in "Codecademy":
  print letter
    
# Empty lines to make the output pretty
print
print

word = "Programming is fun!"

for letter in word:
  # Only print out the letter i
  if letter == "i":
    print letter

+++++++++++++++++++++++++++++++++++
# create a new dictionary called prices using {} format like the example above. And put these values in your prices
prices = {"banana": 4, "apple": 2, "orange": 1.5, "pear": 3}

stock = {"banana": 6, "apple": 0, "orange": 32, "pear": 15}

#Because prices and stock have the same keys, we can loop through one dictionary and print values from both.
for key in prices:
  print(key)
  print("price: %s") % (prices[key])
  print("stock: %s") % (stock[key])
  print


#Let's determine how much money you would make if you sold all of your food
#create a varibale called total and set it to zero
total = 0

#loop through the prices dictionary. For each key in prices, multiply the number in prices by the number in stock. Print that value into the console and then add it to total. Finally, outside your loop, print total
for key in prices:
  var = prices[key]*stock[key]
  print "Total money of " + key + " is " + str(var)
  total +=var
  
print "Total stock is %s" % total  

+++++++++++++++++++++++++++++++
#make a list called groceries with the values
groceries = ["banana", "orange", "apple"]


shopping_list = ["banana", "orange", "apple"]

stock = {
  "banana": 6,
  "apple": 0,
  "orange": 32,
  "pear": 15
}
    
prices = {
  "banana": 4,
  "apple": 2,
  "orange": 1.5,
  "pear": 3
}

# Write your code below!
#define a function compute_bill that takes one parameter food as input
def compute_bill(food):
  
  #create a variable total with an initial value of zero
  total = 0
  
  #for each item in the food list, add the price of that item to total. Finally, return the total
  if stock[item]>0:
      total += prices[item]
      stock[item] -=1
      
  return total      

print(compute_bill(["apple"]))
print(compute_bill(["banana", "apple", "orange", "pear"]))

  
-------------------------------------------------------------------

LISTS AND FUNCTIONS
List element modification

n = [1, 3, 5]
# Do your multiplication here
#. Multiply the second element of the n list by 5. Overwrite the second element with that result. Make sure to print the list when you are done
n[1] = n[1]*5
print n

++++++++++++++++++++++++++++++++

n = [1, 3, 5]
# Append the number 4 here
#Append the number 4 to the end of the list n
n.append(4)
print n

+++++++++++++++++++++++++++++++

LISTS AND FUNCTIONS
Removing elements from lists
This exercise will expand on ways to remove items from a list. You actually have a few options. For a list called n:

n.pop(index) will remove the item at index from the list and return it to you:

n = [1, 3, 5]
n.pop(1)
# Returns 3 (the item at index 1)
print n
# prints [1, 5]
n.remove(item) will remove the actual item if it finds it:

n.remove(1)
# Removes 1 from the list,
# NOT the item at index 1
print n
# prints [3, 5]
del(n[1]) is like .pop in that it will remove the item at the given index, but it won't return it:

del(n[1])
# Doesn't return anything
print n
# prints [1, 5]

+++++++++++++++++++++++++++++++++++++++

n = [1, 3, 5]
# Remove the first item in the list here
n.pop(0)
n.remove(1)
del(n[0])

print n

+++++++++++++++++++++++++++++++++++

number = 5

def my_function(x):
  #print (x * 3)
  x*3

#my_function(number)
print(my_function(number)) #None

++++++++++++++++++++++++

m = 5
n = 13
# Add add_function here that has 2 parameters x and y and adds them together
def add_function(x,y):
  return x+y

print add_function(m, n)

++++++++++++++++++++++++++++

n = "Hello"
# Your function here! called string_function that takes in a string argument (s) and then return s that argument concatenated with the word 'word'. Dont add a space before world
def string_function(s):
  return s + "world"

print string_function(n)

+++++++++++++++++++++++++++

Modifying each element in a list in a function


n = [3, 5, 7]

for i in range(0, len(n)):
    n[i] = n[i] * 2
# Don't forget to return your new list!
def double_list(x):
  for i in range(0, len(x)):
    x[i] = x[i] * 2
  return x 

print double_list(n)


++++++++++++++++++++++++++++++

range(6) # => [0, 1, 2, 3, 4, 5]
range(1, 6) # => [1, 2, 3, 4, 5]
range(1, 6, 3) # => [1, 4]
The range function has three different versions:

range(stop)
range(start, stop)
range(start, stop, step)

In all cases, the range() function returns a list of numbers from start up to (but not including) stop. Each item increases by step

def my_function(x):
  for i in range(0, len(x)):
    x[i] = x[i]
  return x

#replace the ____ with a range() that returns a list containing [0, 1, 2].
print my_function(range(3)) # Add your range between the parentheses!

+++++++++++++++++++++++++++++++

Iterating over a list in a function
Now that we've learned about range, we have two ways of iterating through a list.

Method 1 - for item in list:

for item in list:
  print item
Method 2 - iterate through indexes:

for i in range(len(list)):
  print list[i]
Method 1 is useful to loop through the list, but it's not possible to modify the list this way.

Method 2 uses indexes to loop through the list, making it possible to also modify the list if needed. Since we aren't modifying the list, feel free to use either one on this lesson!CONDITIONALS _CONTROL FLOW_Lesson.py

n = [3, 5, 7]

def total(numbers):
  result = 0
  for item in numbers:
    result +=item
  return result  


 n = ["Michael", "Lieberman"]
# Add your function here
def join_strings(words):
  result =""
  for i in range(len(words)):
    result += words[i]
    
  return result

print join_strings(n)

+++++++++++++++++++++++++++++++++

a = [1, 2, 3]
b = [4, 5, 6]
print a + b
# prints [1, 2, 3, 4, 5, 6]
The example above is just a reminder of how to concatenate two lists.


+++++++++++++++++++++++++++

n = [[1, 2, 3], [4, 5, 6, 7, 8, 9]]
# Add your function here
def flatten(lists):
  
  #Make a new, empty list called results.
  results = []
  
  #Iterate through lists. Call the looping variable numbers.
  for numbers in lists:
    
    #Iterate through numbers.
    for item in numbers:
      
      #For each number, .append() it to results
      results.append(item)
  #Finally, return results from your function
  return results

print flatten(n)

-------------------------------------------

BATTLESHIP!
Make a List

print ["O"] * 5
will print out ['O', 'O', 'O', 'O', 'O'] 


#create a variable board and set it equal to an empty list
board = []
for i in range(5):
  board.append(["O"]*5)
  
print board  
  
++++++++++++++++++++++++++
Custom Print

def print_board(board_in):
  for row in board_in:
    print row
  
print_board(board)   

+++++++++++++++++++++++++++

Printing Pretty

letters = ['a', 'b', 'c', 'd']
print " ".join(letters)
print "---".join(letters)

Then, we print a b c d. The .join method uses the string to combine the items in the list.
Finally, we print a---b---c---d. We are calling the .join function on the "---" string.


def print_board(board_in):
  for row in board_in:
    #Inside your loop, use " " as the separator to join the elements of each row
    print " ".join(row)
  
print_board(board)  
  
+++++++++++++++++++++++++++++
Hide...

from random import randint
coin = randint(0, 1)
dice = randint(1, 6)
In the above example, we first import the randint(low, high) function from the random module.
Then, we generate either zero or one and store it in coin.
Finally, we generate a number from one to six inclusive.   
  
# Add your code below!
#Define two new functions, random_row and random_col, that each take board_in as input. These functions should return a random row index and a random column index from your board, respectively. Use randint(0, len(board_in) - 1). Call each function on board.
def random_row(board_in):
  return randint(0, len(board_in) -1)
def random_col(board_in):
  return randint(0, len(board_in) -1)

random_row(board)
random_col(board)

++++++++++++++++++++++++++++++

raw_input asks the user for input and returns it as a string. But we're going to want to use integers for our guesses! To do this, we'll wrap the raw_inputs with int() to convert the string to an integer.

if x not in range(8) or \
   y not in range(3):
  print "Outside the range"
The example above checks if either x or y are outside those ranges. 
The \ character just continues the if statement onto the next line.

-----------------------------------------------------
Expand:

https://www.digitalocean.com/community/tutorials/how-to-use-list-methods-in-python-3
How To Use List Methods in Python 3

list.append()
The method list.append(x) will add an item (x) to the end of a list. We’ll start with a list of our fish that are dispersed throughout the aquarium.


fish = ['barracuda','cod','devil ray','eel']
fish.append('flounder')
print(fish)

Output
['barracuda', 'cod', 'devil ray', 'eel', 'flounder']

+++++++++++++++++++++

list.insert()
The list.insert(i,x) method takes two arguments, with i being the index position you would like to add an item to, and x being the item itself.

fish.insert(0,'anchovy')
print(fish)

Output
['anchovy', 'barracuda', 'cod', 'devil ray', 'eel', 'flounder']

+++++++++++++++++++++

list.extend()
If we want to combine more than one list, we can use the list.extend(L) method, which takes in a second list as its argument.

more_fish = ['goby','herring','ide','kissing gourami']

fish.extend(more_fish)
print(fish)

Output
['anchovy', 'barracuda', 'cod', 'devil ray', 'eel', 'flounder', 'goby', 'herring', 'ide', 'kissing gourami']

++++++++++++++++++++++++

list.remove()
list.pop()
list.index()

+++++++++++++++++++

list.copy()
When we are working with a list and may want to manipulate it in multiple ways while still having the original list available to us unchanged, we can use list.copy() to make a copy of the list.

fish_2 = fish.copy()
print(fish_2)

Output
['anchovy', 'barracuda', 'cod', 'eel', 'flounder', 'goby', 'herring', 'ide']

+++++++++++++++++++++++

list.reverse()
We can reverse the order of items in a list by using the list.reverse() method. Perhaps it is more convenient for us to use reverse alphabetical order rather than traditional alphabetical order. In that case, we need to use the .reverse() method with the fish list to have the list be reversed in place.

fish.reverse()
print(fish)
Output
['ide', 'herring', 'goby', 'flounder', 'eel', 'cod', 'barracuda', 'anchovy']

+++++++++++++++++++++++++++

list.count()
The list.count(x) method will return the number of times the value x occurs within a specified list. We may want to use this method when we have a long list with a lot of matching values. If we had a larger aquarium, for example, and we had an item for each and every neon tetra that we had, we could use .count() to determine the total number of neon tetras we have at any given time.

We’ll use our current list to count the number of times the item 'goby' appears:

print(fish.count('goby'))
Output
1

fish_ages = [1,2,4,3,2,1,1,2]
print(fish_ages.count(1))
Output
3

+++++++++++++++++++++++++++++

list.sort()
We can use the list.sort() method to sort the items in a list.

Just like list.count(), list.sort() can make it more apparent how many of a certain integer value we have, and it can also put an unsorted list of numbers into numeric order.

Let’s use the integer list, fish_ages to see the .sort() method in action:

fish_ages.sort()
print(fish_ages)
Output
[1, 1, 1, 2, 2, 2, 3, 4]

+++++++++++++++++++++++++++++

list.clear()
When we’re done with a list, we can remove all values contained in it by using the list.clear() method.

The local government has decided to take over our aquarium, making it a public space for the people in our city to enjoy. Since we’re no longer working on the aquarium ourselves, we no longer need to keep an inventory of the fish, so let’s clear the fish list:

fish.clear()
print(fish)
Output
[]

------------------------------------------------------------------------

LOOPS
While you're here

count = 0

#if something is true
if count < 10:
  print "Hello, I am an if statement and count is", count
#as long as something is true. 
#Be careful not to alter or remove the count +=1 statement. If your program has no way to increase count, your loop could go on forever and become an infinite loop which could crash your computer/browser
while count < 10:
  print "Hello, I am a while and count is", count
  count += 1

+++++++++++++++++++++++++++++++++

Condition
The condition is the expression that decides whether the loop is going to continue being executed or not. There are 5 steps to this program:

The loop_condition variable is set to True

The while loop checks to see if loop_condition is True. It is, so the loop is entered.

The print statement is executed.

The variable loop_condition is set to False.

The while loop again checks to see if loop_condition is True. It is not, so the loop is not executed a second time.

loop_condition = True

while loop_condition:
  print "I am a loop"
  loop_condition = False

++++++++++++++++++++++++++++++

LOOPS
Simple errors

choice = raw_input('Enjoying the course? (y/n)')

#Fill in the loop condition so the user will  be prompted for a choice over and over while choice does not equal "y" or "n"
while choice !="y" and choice !="n":  # Fill in the condition (before the colon)
  choice = raw_input("Sorry, I didn't catch that. Enter again: ")


++++++++++++++++++++++++++++++++++++

count = 0

while count < 10: # Add a colon
  print count
  # Increment count
  count +=1
  
++++++++++++++++++++++++++++++++++++

count = 0

#The difference here is that this loop is guaranteed to run at least once.
while True:
  print count
  count += 1
  if count >= 10:

    #The break is a one-line statement that means "exit the current loop."
    break
    
+++++++++++++++++++++++++++++++++++

LOOPS
While / else

import random

print "Lucky Numbers! 3 numbers will be generated."
print "If one of them is a '5', you lose!"

count = 0
while count < 3:
  num = random.randint(1, 6)
  print num
  if num == 5:
    print "Sorry, you lose!"
    break
  count += 1
  
#the else block will execute anytime the loop condition( while count < 3) is evaluated to False.   
else:
  print "You win!"


++++++++++++++++++++++++++++++++
from random import randint

# Generates a number from 1 through 10 inclusive
random_number = randint(1, 10)
print random_number

guesses_left = 3
# Start your game!
while guesses_left > 0:
  guess = int(raw_input("Your guess: "))
  if guess == random_number:
    print "You win!"
    break
  guesses_left -=1
  
else:
  print "You lose."


+++++++++++++++++++++++++++++++++++++++

LOOPS
For your A

phrase = "A bird in the hand..."

# Add your for loop
for char in phrase:
  if char == "A" or char == 'a':
    
    #The , character after our print statement means that our next print statement keeps printing on the same line.
    print 'X',
  else:
    print char,

#Don't delete this print statement!
print  
  

++++++++++++++++++++++++++++++++++++++

numbers  = [7, 9, 12, 54, 99]

print "This list contains: "

for num in numbers:
  print num

+++++++++++++++++++++++++++++++++++

d = {'a': 'apple', 'b': 'berry', 'c': 'cherry'}

for key in d:
  # Your code here!
  print key
  
++++++++++++++++++++++++++++

choices = ['pizza', 'pasta', 'salad', 'nachos']

print 'Your choices are:'
for index, item in enumerate(choices):
  print index, item

#Your choices are:
0 pizza
1 pasta
2 salad
3 nachos
++++++++++++++++++++++++++++++++++++  

list_a = [3, 9, 17, 15, 19]
list_b = [2, 4, 8, 10, 30, 40, 50, 60, 70, 80, 90]

for a, b in zip(list_a, list_b):
  # Add your code here!
    print max(a, b)
    
print(zip(list_a, list_b)) #[(3, 2), (9, 4), (17, 8), (15, 10), (19, 30)]


++++++++++++++++++++++++++++++++++++++++

LOOPS
For / else

fruits = ['banana', 'apple', 'orange', 'tomato', 'pear', 'grape']

print 'You have...'
for f in fruits:
  if f == 'tomato':
    print 'A tomato is not a fruit!' # (It actually is.)
    break
  print 'A', f
else:
  print 'A fine selection of fruits!'


------------------------------------------------------------

PRACTICE MAKES PERFECT

#define a function that will take a number x as input:
def is_even(x):
  if x%2 == 0:
    return True
  else:
    return False

+++++++++++++++++++++++++++++++++++++

def is_int(x):
  absolute = abs(x)
  rounded = round(absolute)
  return absolute - rounded == 0

print is_int(10)
print is_int(10.5)

+++++++++++++++++++++++++++++++++++

def digit_sum(n):
  if n>0:
    n = str(n)
    total=0
    for item in n:
      item = int(item)
      total +=item
    return total


def digit_sum(n):
  total = 0
  string_n = str(n)
  for char in string_n:
    total += int(char)
  return total

#Alternate Solution:

#def digit_sum(n):
#  total = 0
#  while n > 0:
#    total += n % 10
#    n = n // 10
#  return total
  
print digit_sum(1234)
print(1234//10)

++++++++++++++++++++++++++++++++++++++

def factorial(x):
  factorial = 1
  while x>0:
    factorial *=x
    x -=1    
  return factorial
print(factorial(5))

+++++++++++++++++++++++++++++++++++

def is_prime(x):
    if x < 2:
        return False
    else:
        for n in range(2, x-1):
            if x % n == 0:
                return False
        return True

print is_prime(13)
print is_prime(10)
print(range(2,5)) #[2, 3, 4]

++++++++++++++++++++++++++++++++++

#You may not use reversed or [::-1] to help you with this.
def reverse(text):
    word = ""
    l = len(text) - 1
    while l >= 0:
        word = word + text[l]
        l -= 1
    return word
  
print reverse("Hello World")

+++++++++++++++++++++++++++++++++++

def anti_vowel(text):
  vowel = "aeiouAEIOU"
  word =""
  for chr in text:
    if chr not in vowel:
      word +=chr      
  return word
print(anti_vowel("Honag"))

++++++++++++++++++++++++++++++++++++++++++++++

score = {"a": 1, "c": 3, "b": 3, "e": 1, "d": 2, "g": 2, 
         "f": 4, "i": 1, "h": 4, "k": 5, "j": 8, "m": 3, 
         "l": 1, "o": 1, "n": 1, "q": 10, "p": 3, "s": 1, 
         "r": 1, "u": 1, "t": 1, "w": 4, "v": 4, "y": 4, 
         "x": 8, "z": 10}

def scrabble_score(word):
  word_lower = word.lower()
  total = 0
  for chr in word_lower:
    total += score[chr]
  return total  
    
print(scrabble_score("Hong")) #8


++++++++++++++++++++++++++++++++++++++++++

def censor(text, word):
    words = text.split()
    print(words)  #['this', 'hack', 'is', 'wack', 'hack']
    result = ''
    stars = '*' * len(word)
    count = 0
    for i in words:
        if i == word:
            words[count] = stars
        count += 1
    result =' '.join(words)

    return result
  
print censor("this hack is wack hack", "hack")
print("hong".split( )) #['hong']

++++++++++++++++++++

def count(sequence, item):
  #return sequence.count(item)
  count = 0
  for element in sequence:
    if element == item:
      count +=1
  return count

++++++++++++++++++++++

def purify(your_list):
  new_list=[]
  for el in your_list:
    if el%2 == 0:
      new_list.append(el)
  return new_list    

+++++++++++++++++++++++++

def product(lst):
  product = 1
  
  for el in lst:
    product *=el
    
  return product
    
print(product([2,3]))  #6
  
++++++++++++++++++++++++

def remove_duplicates(inputlist):
    if inputlist == []:
        return []
    
    # Sort the input list from low to high    
    inputlist = sorted(inputlist)
    print(inputlist) #[1, 1, 2, 2, 4, 5, 5]
    # Initialize the output list, and give it the first value of the now-sorted input list
    outputlist = [inputlist[0]]
    print(outputlist) #[1]

    # Go through the values of the sorted list and append to the output list
    # ...any values that are greater than the last value of the output list
    for i in inputlist:
        if i > outputlist[-1]:
            outputlist.append(i)
        
    return outputlist
  
print remove_duplicates([1, 1, 2, 2, 5, 4, 5])   

def remove_duplicates_2(lst):
  new_lst = []
  for el in lst:
    if el not in new_lst:
      new_lst.append(el)
  return new_lst

print(remove_duplicates_2(["hong","hoa","hong"]))
  
++++++++++++++++++++++++++++++++

def median(lst):
    sorted_list = sorted(lst)
    if len(sorted_list) % 2 != 0:
        #odd number of elements
        index = len(sorted_list)//2 
        return sorted_list[index]
    elif len(sorted_list) % 2 == 0:
        #even no. of elements
        index_1 = len(sorted_list)/2 - 1       
        index_2 = len(sorted_list)/2
        print index_1, index_2
        mean = (sorted_list[index_1] + sorted_list[index_2])/2.0
        return mean
   
print median([2, 4, 5, 9])
print median([2])


--------------------------------------------------------------

ADVANCED TOPICS IN PYTHON
Iterators for Dictionaries


my_dict = {
  "Name": "Hong",
  "Age": 27,
  "BDFL": True
}

print my_dict.items() #[('BDFL', True), ('Age', 27), ('Name', 'Hong')]

print my_dict.keys() #['BDFL', 'Age', 'Name']
print my_dict.values() #[True, 27, 'Hong']
for el in my_dict:
  print el,  #BDFL Age Name


for key in my_dict:
  print key, my_dict[key]
  
"""
BDFL True
Age 27
Name Hong
"""  


my_lst_1 = ["name", "age", "BDFL"]
my_lst_2 = ["Hong", 27, True]

print zip(my_lst_1, my_lst_2) #[('name', 'Hong'), ('age', 27), ('BDFL', True)]
print my_lst_1 + my_lst_2 #['name', 'age', 'BDFL', 'Hong', 27, True]

++++++++++++++++++++++++++++++

ADVANCED TOPICS IN PYTHON
List Comprehension Syntax

doubles_by_3 = [x * 2 for x in range(1, 6) if (x * 2) % 3 == 0]

# Complete the following line. Use the line above for help.
even_squares = [x**2 for x in range(1,11) if x%2 == 0]

print even_squares

cubes_by_four = [x ** 3 for x in range(1, 11) if ((x ** 3) % 4) == 0]
print cubes_by_four

+++++++++++++++++++++++++++++++++

ADVANCED TOPICS IN PYTHON
List Slicing Syntax

l = [i ** 2 for i in range(1, 11)]
# Should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

#[start:end:stride]
print l[2:9:2] #[9, 25, 49, 81]

my_list = range(1, 11) # List of numbers 1 - 10

# Omit the start and end index. You only need to specify a stride.
print my_list[::2]

++++++++++++++++++++++++++

ADVANCED TOPICS IN PYTHON
Reversing a List

my_list = range(1, 11)

#A negative stride progresses through the list from right to left.
backwards = my_list[::-1]

to_one_hundred = range(101)
# Add your code below!
backwards_by_tens = to_one_hundred[::-10]
print backwards_by_tens #[100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0]

to_21 = range(1,22)
odds = to_21[::2]
middle_third = to_21[7:14]
print(middle_third) #[8, 9, 10, 11, 12, 13, 14]


++++++++++++++++++++++++++++++++++

ADVANCED TOPICS IN PYTHON
Anonymous Functions

"""
lambda x: x % 3 == 0
Is the same as

def by_three(x):
  return x % 3 == 0
"""
# filter uses the lambda to determine what to filter, and the second argument is the list it does the filtering on.

my_list = range(16)
print filter(lambda x: x % 3 == 0, my_list)

languages = ["HTML", "JavaScript", "Python", "Ruby"]

# Add arguments to the filter()
print filter(lambda x: x=="Python", languages) #['Python']


squares = [ x**2 for x in range(1,11)]
print filter(lambda x: x>30 and x<=70, squares) #[36, 49, 64]

+++++++++++++++++++++++++++++++++++
Time to look back again

garbled = "!XeXgXaXsXsXeXmX XtXeXrXcXeXsX XeXhXtX XmXaX XI"

message = garbled[::-2]
print message #I am the secret message!

garbled = "IXXX aXXmX aXXXnXoXXXXXtXhXeXXXXrX sXXXXeXcXXXrXeXt mXXeXsXXXsXaXXXXXXgXeX!XX"
message = filter(lambda x: x!= "X", garbled)
print message

--------------------------------------------------------------------

INTRODUCTION TO BITWISE OPERATORS
Just a Little BIT

"""
0
10
0
13
38
-89
"""
print 5 >> 4  # Right Shift
print 5 << 1  # Left Shift
print 8 & 5   # Bitwise AND
print 9 | 4   # Bitwise OR
print 12 ^ 42 # Bitwise XOR
print ~88     # Bitwise NOT

print 0b1,    #1
print 0b10,   #2
print 0b11,   #3
print 0b100,  #4
print 0b101,  #5
print 0b110,  #6
print 0b111   #7
print "******"
print 0b1 + 0b11
print 0b11 * 0b11

eight = 0b1000
nine = 0b1001
ten = 0b1010
eleven = 0b1011
twelve = 0b1100

print int("1",2)
print int("10",2)
print int("111",2)
print int("0b100",2)
print int(bin(5),2)
# Print out the decimal equivalent of the binary 11001001.
print int("11001001",2) #201

+++++++++++++++++++++++++++++++++++++++
INTRODUCTION TO BITWISE OPERATORS
Slide to the Left! Slide to the Right!


shift_right = 0b1100
shift_left = 0b1

# Your code here!
#Shift the variable shift_right to the right twice (>> 2) and shift the variable shift_left to the left twice (<< 2). Try to guess what the printed output will be!
shift_right = shift_right >> 2
shift_left = shift_left << 2

print bin(shift_right) #0b11
print bin(shift_left) #0b100

+++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
A BIT of This AND That

"""
So remember, for every given bit in a and b:

0 & 0 = 0
0 & 1 = 0
1 & 0 = 0
1 & 1 = 1

     a:   00101010   42
     b:   00001111   15       
===================
 a & b:   00001010   10
"""
print bin(0b1110 & 0b101)

+++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
A BIT of This OR That

"""
So remember, for every given bit in a and b:

0 | 0 = 0
0 | 1 = 1 
1 | 0 = 1
1 | 1 = 1

    a:  00101010  42
    b:  00001111  15       
================
a | b:  00101111  47
"""

print bin(0b1110 | 0b101) #0b1111


++++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
This XOR That?

"""
So remember, for every given bit in a and b:

0 ^ 0 = 0
0 ^ 1 = 1
1 ^ 0 = 1
1 ^ 1 = 0

    a:  00101010   42
    b:  00001111   15       
================
a ^ b:  00100101   37

"""
print bin(0b1110^0b101) #0b101


+++++++++++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
See? This is NOT That Hard!

"""
The bitwise NOT operator (~) just flips all of the bits in a single number.
 this is equivalent to adding one to the number and then making it negative.
-2
-3
-4
-43
-124
"""
print ~1
print ~2
print ~3
print ~42
print ~123

+++++++++++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
The Man Behind the Bit Mask

def check_bit4(input):
  mask = 0b1000
  desired = input & mask
  if desired > 0:
    return "on"
  else:
    return "off"


+++++++++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
Turn It On

a = 0b10111011
print bin(a | 0b100) #0b10111111


+++++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
Just Flip Out

a = 0b11101110

mask = 0b11111111
desired = a ^ mask

print bin(desired) #0b10001

++++++++++++++++++++++++++++++++++

INTRODUCTION TO BITWISE OPERATORS
Slip and Slide

def flip_bit(number, n):
  bit_to_flip = 0b1 << (n -1)
  result = number ^ bit_to_flip
  return bin(result)

print(flip_bit(12,4)) #0b100

-------------------------------------------------------------------------------------
INTRODUCTION TO CLASSES
# Class definition

class Animal(object):
  """Makes cute animals."""
  # For initializing our instance objects
  def __init__(self, name, age):
    self.name = name
    self.age = age

# Note that self is only used in the __init__()
# function definition; we don't need to pass it
# to our instance objects.

zebra = Animal("Jeffrey", 2, True)
giraffe = Animal("Bruce", 1, False)
panda = Animal("Chad", 7, True)

print zebra.name, zebra.age, zebra.is_hungry #Jeffrey 2 True
print giraffe.name, giraffe.age, giraffe.is_hungry
print panda.name, panda.age, panda.is_hungry


++++++++++++++++++++++++++++++++++++

class ShoppingCart(object):
  """Creates shopping cart objects
  for users of our fine website."""
  
  def __init__(self, customer_name):
    self.customer_name = customer_name
    self.items_in_cart = {}
  def add_item(self, product, price):
    """Add product to the cart."""
    if not product in self.items_in_cart:
      self.items_in_cart[product] = price
      print product + " added."
    else:
      print product + " is already in the cart."

  def remove_item(self, product):
    """Remove product from the cart."""
    if product in self.items_in_cart:
      del self.items_in_cart[product]
      print product + " removed."
    else:
      print product + " is not in the cart."

my_cart = ShoppingCart("Hong_cart")
my_cart.add_item("Rose", 13)

++++++++++++++++++++++++++++++++

INTRODUCTION TO CLASSES
Warning: Here Be Dragons
Inheritance is a tricky concept


class Customer(object):
  """Produces objects that represent customers."""
  def __init__(self, customer_id):
    self.customer_id = customer_id

  def display_cart(self):
    print "I'm a string that stands in for the contents of your shopping cart!"

class ReturningCustomer(Customer):
  """For customers of the repeat variety."""
  def display_order_history(self):
    print "I'm a string that stands in for your order history!"

monty_python = ReturningCustomer("ID: 12345")
monty_python.display_cart()
monty_python.display_order_history()
"""
I'm a string that stands in for the contents of your shopping cart!
I'm a string that stands in for your order history!
"""

+++++++++++++++++++++++++++++++++++
Inheritance


class Shape(object):
  """Makes shapes!"""
  def __init__(self, number_of_sides):
    self.number_of_sides = number_of_sides

# Add your Triangle class below!
class Triangle(Shape):
  def __init__(self, side1, side2, side3):
    self.side1 = side1
    self.side2 = side2
    self.side3 = side3


+++++++++++++++++++++++++++++++++
Override


class Employee(object):
  """Models real-life employees!"""
  def __init__(self, employee_name):
    self.employee_name = employee_name

  def calculate_wage(self, hours):
    self.hours = hours
    return hours * 20.00

# Add your code below!
#PartTimeEmployee.calculate_wage overrides Employee.calculate_wage
class PartTimeEmployee(Employee):
  def calculate_wage(self, hours):
    self.hours = hours
    return hours*12.00

 #you've overwritten a method or attribute defined in that class' base class (also called a parent or superclass)
  #You can directly access the attributes or methods of a superclass with Python's built-in super call.
  def full_time_wage(self, hours):
    return super(PartTimeEmployee, self).calculate_wage(hours)

milton =  PartTimeEmployee("Hong")
print milton.full_time_wage(10)    


++++++++++++++++++++++++++++++++++
Basic Class

class Triangle(object):
  #2.add a member varibale (attribue)
  number_of_sides = 3
  
  #1.
  def __init__(self, angle1, angle2, angle3):
    self.angle1 = angle1 # a instance variable (attribute)
    self.angle2 = angle2
    self.angle3 = angle3
  
  #3. add a function (method)
  def check_angles(self):
    return self.angle1 + self.angle2 + self.angle3 == 180


#4. create an instance 
my_triangle = Triangle(90,30,60)
print my_triangle.number_of_sides 
print my_triangle.check_angles()
    
#5. create a class that inherrits 
class Equilateral(Triangle):
  
  #add a member variable
  angle = 60
  
  #overwritten attribute
  def __init__(self):
    self.angle1 = self.angle
    self.angle2 = self.angle
    self.angle3 = self.angle
    


-------------------------------------------------------

CLASSES

#create class
class Car(object):
  
  #create a member variable that store information about each class object(information that belongs to class object)
  condition ="new"
  
  #there is a special function named __init__() that gets called whenever we create a new instance of a class
  #We might want to do this in order to provide more input variables,
  #the keyword self - this is how the object keeps track of itself internally 
  def __init__(self, model, color, mpg):
    self.model= model
    self.color = color
    self.mpg = mpg

   #add a method named display_car to Car that will reference the Car's member variables to return the string,
  def display_car(self):
    return "This is a %s %s with %s MPG." % (self.color, self.model, self.mpg) 
    

  #Modifying member variables
  def drive_car(self):
    self.condition = "used"
       

#create new object (instance of class)
#You don't need to include the self keyword when you create an instance of a class, because self gets added to the beginning of your list of inputs automatically by the class definition.
my_car = Car("DeLorean", "silver", 88)

#call member variable
print my_car.condition
print my_car.model
print my_car.color
print my_car.mpg
print my_car.condition
print my_car.drive_car()
print my_car.condition

class ElectricCar(Car):
  def __init__(self, model, color, mpg, battery_type):
    self.model = model
    self.color = color
    self.mpg   = mpg
    self.battery_type = battery_type
    
  def drive_car(self):
    self.condition = "like new"

my_car = ElectricCar("DeLorean", "silver", 88, "molten salt")

print my_car.condition
my_car.drive_car()
print my_car.condition

+++++++++++++++++++++++

class Point3D(object):
  def __init__(self, x, y, z):
    self.x = x
    self.y = y
    self.z = z
    
  def __repr__(self):
    return "(%d, %d, %d)" % (self.x, self.y, self.z)
    
my_point = Point3D(1, 2, 3)
print my_point


----------------------------------------------------------------------

FILE INPUT/OUTPUT

# Use a file handler to open a file for writing
write_file = open("text.txt", "w")

# Open the file for reading
read_file = open("text.txt", "r")

# Write to the file
write_file.write("Not closing files is VERY BAD.")
write_file.close()
read_file.close()


# Try to read from the file
print read_file.read()

++++++++++++++++++++++++++++++++++++

my_file = open("text.txt", "r")
print my_file.readline()
print my_file.readline()
print my_file.readline()
my_file.close()

++++++++++++++++++++++++++++++

with open("text.txt", "w") as my_file:
  my_file.write("My Data!")

print my_file.closed  #True
if not file.closed:
  file.close()

#print my_file.closed