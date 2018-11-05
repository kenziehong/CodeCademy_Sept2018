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







