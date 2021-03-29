#Review

#1. Define a class Student this will be our data model at Jan van Eyck High School and Conservatory.
class Student:
  
  #2. Add a constructor for Student. Have the constructor take in two parameters: a name and a year. Save those two as attributes .name and .year.
  def __init__(self, name, year):
    self.name = name
    self.year = year
    
    #6. In the body of the constructor for Student, declare self.grades as an empty list
    self.grades = []
    
#7. Add an .add_grade() method to Student that takes a parameter, grade. 
#.add_grade() should verify that grade is of type Grade and if so, add it to the Student's .grades 
# If grade isn't an instance of Grade then .add_grade() should do nothing.
  def add_grade(self, grade): 
    #if type(grade) is Grade:
    if type(grade) == Grade:
      self.grades.append(grade)
    #return self.grades  
  
#3. Create three instances of the Student class:
#Save them into the variables roger, sandro, and pieter
#Create an instance by passing arguments to the class constructor. 
#cool_object = CoolClass(cool_arg1, cool_arg2)
roger = Student("Roger van der Weyden", 10)
sandro = Student("Sandro Botticelli", 12)
pieter = Student("Pieter Bruegel the Elder", 8)

#4. Create a Grade class, with minimum_passing as an attribute set to 65
class Grade:
  minimum_passing = 65
  
  #5. Give Grade a constructor. Take in a parameter score and assign it to self.score
  def __init__(self, score):
    self.score = score

#8. Create a new Grade with a score of 100 and add it to pieter's .grades attribute using .add_grade().
pieter.add_grade(Grade(100))

----------------------------------------------------
#String Representation

class Circle:
  pi = 3.14
  
  def __init__(self, diameter):
    self.radius = diameter / 2
  
  def area(self):
    return self.pi * self.radius ** 2
  
  def circumference(self):
    return self.pi * 2 * self.radius
  
  def __repr__(self):
    return "Circle with radius {radius}".format(radius=self.radius)
  
  
medium_pizza = Circle(12)
teaching_table = Circle(36)
round_room = Circle(11460)

print(medium_pizza)
print(teaching_table)
print(round_room)

--------------------------------------------
#Everything is an Object

print(dir(5))
def this_function_is_an_object():
  return "Dinh Thi Anh Hong"
print(dir(this_function_is_an_object))

------------------------------------------
#Self

class Circle:
  pi = 3.14
  def __init__(self, diameter):
    print("Creating circle with diameter {d}".format(d=diameter))
    # Add assignment for self.radius here:
    
    #1.In Circle's constructor set the instance variable self.radius to equal half the diameter that gets passed in
    self.radius = diameter/2
    
    #3. Define a new method circumference for your circle object that takes only one argument, self, and returns the circumference of a circle with the given radius by this formula
    #Remember to use self to refer to class and instance variables in a method.
  def circumference(self):
    return 2 * self.pi * self.radius
    
#2. Define three Circles with three different diameters.    
medium_pizza = Circle(12)  
teaching_table = Circle(36) 
round_room = Circle(11460)

#4. 
print(medium_pizza.circumference())
print(teaching_table.circumference())
print(round_room.circumference())

-------------------------------------------
#Attribute Functions

how_many_s = [{'s': False}, "sassafrass", 18, ["a", "c", "s", "d", "s"]]

#In script.py we have a list of different data types, some strings, some lists, and some dictionaries, all saved in the variable how_many_s.

#For every element in the list, check if the element has the attribute count. If so, count the number of times the string "s" appears in the element. Print this number.
for element in how_many_s:
  if hasattr(element, "count"):
    print(element.count("s"))
    
#list_of_things (how_many_s), special_method(count), "s" (argument)

------------------------------------------
#Instance Variables

class Store:
  pass

#1. Create two objects from this store class, named alternative_rocks and isabelles_ices.
alternative_rocks = Store()
isabelles_ices = Store()

#2. Give them both instance attributes called store_name. Set alternative_rocks's store_name to "Alternative Rocks". Set isabelles_ices's store_name to "Isabelle's Ices"
alternative_rocks.store_name = "Alternative Rocks"
isabelles_ices.store_name = "Isabelle's Ices"

--------------------------------------------
#Constructors

class Circle:
  pi = 3.14
  
  # Add constructor here:
  #1. Add a constructor to our Circle class. Since we seem more frequently to know the diameter of a circle, it should take the argument diameter. It doesn't need to do anything yet, just write pass in the body of the constructor.
  def __init__(self,diameter):
    
    #2. Now have the constructor print out the message "New circle with diameter: {diameter}" when a new circle is created
    print("New circle with diameter: {diameter}".format(diameter=diameter))

#2. Create a circle teaching_table with diameter 36.     
teaching_table = Circle(36)    

------------------------------------------
#Methods with Arguments

#1. Create a Circle class with class variable pi. Set pi to the approximation 3.14
class Circle:
  pi = 3.14
  
  #2. Give Circle an area method that takes two parameters: self and radius.
  def area(self, radius):
    
    # Since pi is a class variable, you can access it as an attribute of the class
    return Circle.pi * radius ** 2

#3. Create an instance of Circle. Save it into the variable circle.
circle = Circle() 

#4. You save the areas of these three things into pizza_area, teaching_table_area, and round_room_area. Remember that the radius of a circle is half the diameter. We gave three diameters here, so halve them before you calculate the given circle's area
pizza_area = circle.area(12/2)
teaching_table_area = circle.area(36/2)
round_room_area = circle.area(11460/2)


-----------------------------------------
#Methods

#1 .At Jan van High, the students are constantly calling the school rules into question. Create a Rules class so that we can explain the rules.
class Rules:
  
  #2. Give Rules a method washing_brushes that returns the string 
  def washing_brushes(self):
    return "Point bristles towards the basin while washing your brushes."

-------------------------------
#Class Variables

class Grade:
  minimum_passing = 65

-------------------------------
#Object-Oriented Programming

class Facade:
  pass

facade_1 = Facade()

#1.In script.py we see facade_1 from last exercise. Try calling type() on facade_1 and saving it to the variable facade_1_type.
facade_1_type= type(facade_1)
print(facade_1_type)

------------------------------
#Instantiation

class Facade:
  pass

#1.In script.py we see our Facade class from last exercise. Make a Facade instance and save it to the variable facade_1
facade_1 = Facade()

--------------------------------
#Class
class Facade:
  pass

--------------------------
#Types

print(type(5))
my_dict={}
print(type(my_dict))
my_list=[]
print(type(my_list))  






