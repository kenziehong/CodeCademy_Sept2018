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

  

  








