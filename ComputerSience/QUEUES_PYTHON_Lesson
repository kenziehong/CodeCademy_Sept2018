#Queues Python Review

from node import Node

class Queue:
  def __init__(self, max_size=None):
    self.head = None
    self.tail = None
    self.max_size = max_size
    self.size = 0
    
  def enqueue(self, value):
    if self.has_space():
      item_to_add = Node(value)
      print("Adding " + str(item_to_add.get_value()) + " to the queue!")
      if self.is_empty():
        self.head = item_to_add
        self.tail = item_to_add
      else:
        self.tail.set_next_node(item_to_add)
        self.tail = item_to_add
      self.size += 1
    else:
      print("Sorry, no more room!")
         
  def dequeue(self):
    if self.get_size() > 0:
      item_to_remove = self.head
      print(str(item_to_remove.get_value()) + " is served!")
      if self.get_size() == 1:
        self.head = None
        self.tail = None
      else:
        self.head = self.head.get_next_node()
      self.size -= 1
      return item_to_remove.get_value()
    else:
      print("The queue is totally empty!")
  
  def peek(self):
    if self.size > 0:
      return self.head.get_value()
    else:
      print("No orders waiting!")
  
  def get_size(self):
    return self.size
  
  def has_space(self):
    if self.max_size == None:
      return True
    else:
      return self.max_size > self.get_size()
    
  def is_empty(self):
    return self.size == 0

print("Creating a deli line with up to 10 orders...\n------------")
deli_line = Queue(10)
print("Adding orders to our deli line...\n------------")
deli_line.enqueue("egg and cheese on a roll")
deli_line.enqueue("bacon, egg, and cheese on a roll")
deli_line.enqueue("toasted sesame bagel with butter and jelly")
deli_line.enqueue("toasted roll with butter")
deli_line.enqueue("bacon, egg, and cheese on a plain bagel")
deli_line.enqueue("two fried eggs with home fries and ketchup")
deli_line.enqueue("egg and cheese on a roll with jalapeos")
deli_line.enqueue("plain bagel with plain cream cheese")
deli_line.enqueue("blueberry muffin toasted with butter")
deli_line.enqueue("bacon, egg, and cheese on a roll")
# ------------------------ #
# Uncomment the line below:
deli_line.enqueue("western omelet with home fries")
# ------------------------ #
print("------------\nOur first order will be " + deli_line.peek())
print("------------\nNow serving...\n------------")
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
deli_line.dequeue()
# ------------------------ #
# Uncomment the line below:
deli_line.dequeue()
# ------------------------ #


-----------------------------------------------------------

#Queues Python Dequeue

from node import Node

class Queue:
  def __init__(self, max_size=None):
    self.head = None
    self.tail = None
    self.max_size = max_size
    self.size = 0
    
  def enqueue(self, value):
    if self.has_space():
      item_to_add = Node(value)
      print("Adding " + str(item_to_add.get_value()) + " to the queue!")
      if self.is_empty():
        self.head = item_to_add
        self.tail = item_to_add
      else:
        self.tail.set_next_node(item_to_add)
        self.tail = item_to_add
      self.size += 1
    else:
      print("Sorry, no more room!")
      
  # Add your dequeue method below: 
  #1.Inside the Queue class you built, define a method dequeue(). Add an if clause to check if the queue is not empty. If so, set a new variable item_to_remove to the current head. Inside your if statement, print: "Removing " + str(item_to_remove.get_value()) + " from the queue!"
  def dequeue(self):
    if self.get_size() > 0:
      item_to_remove = self.head
      print("Removing " + str(item_to_remove.get_value()) + " from the queue!")
      if self.get_size() == 1:
        self.head = None
        self.tail = None
      else:
        
        #2.set the queue's head equal to the following node using Node's handy dandy get_next_node() method
        self.head = self.head.get_next_node()
      self.size -= 1
      
      #3.use Node's get_value() method to return the value of item_to_remove
      return item_to_remove.get_value()
    else:
      print("This queue is totally empty!")
  
  def peek(self):
    if self.is_empty():
      print("Nothing to see here!")
    else:
      return self.head.get_value()
  
  def get_size(self):
    return self.size
  
  def has_space(self):
    if self.max_size == None:
      return True
    else:
      return self.max_size > self.get_size()
    
  def is_empty(self):
    return self.size == 0

q = Queue()
q.enqueue("some guy with a mustache")
q.dequeue()


-----------------------------------------

#Queues Python Enqueue

from node import Node

class Queue:
  def __init__(self, max_size=None):
    self.head = None
    self.tail = None
    self.max_size = max_size
    self.size = 0
    
  # Add your enqueue method below:
  #1. Inside the Queue class you built, define a method enqueue() that takes a node value value as a parameter. Add an if clause to check if the queue has space. If it does, instantiate a Node that takes value as its argument and assign it to a new variable item_to_add. Print "Adding " + str(item_to_add.get_value()) + " to the queue!"
  def enqueue(self, value):
    if self.has_space():
      item_to_add = Node(value)
      print("Adding " + str(item_to_add.get_value()) + " to the queue!")
      
      #2. Also inside the if statement, do the following: Check if the queue is empty  if so, set both the instance's head and tail to the item_to_add. Otherwise, use Node's set_next_node() method to: set item_to_add as the current tail's next node, set tail equal to item_to_add, Increment the queues size by 1
      if self.is_empty():
        self.head = item_to_add
        self.tail = item_to_add
      else:
        self.tail.set_next_node(item_to_add)
        self.tail = item_to_add
      self.size += 1
    else:
      print("Sorry, no more room!")
    
  def peek(self):
    if self.is_empty():
      print("Nothing to see here!")
    else:
      return self.head.get_value()
  
  def get_size(self):
    return self.size
  
  def has_space(self):
    if self.max_size == None:
      return True
    else:
      return self.max_size > self.get_size()
    
  def is_empty(self):
    return self.size == 0

q = Queue()
q.enqueue("all the fluffy kitties")

---------------------------------------------------------

#Queues Python Size

from node import Node

class Queue:
  # Add max_size and size properties within __init__():
  def __init__(self, max_size = None):
    self.head = None
    self.tail = None
    
    #1.Add a new parameter max_size to your __init__() method that has a default value of None. Inside the method: create a max_size instance variable assigned to max_size, create another instance variable size and set it equal to 0
    self.max_size = max_size
    self.size = 0
    
  #5.Now we'll make sure we aren't attempting to peek() on an empty queue. After all, a deli server can't get an order from a line with no customers! At the top of your peek() method body, use get_size() to see if the queue is empty. if so, the method should just print "Nothing to see here!" if not, peek() will perform the same as it did before
  def peek(self):
    if self.size > 0:
      return self.head.get_value()
    else:
      print("Nothing to see here!")
  
  # Define get_size() and has_space() below:
  #2. Inside Queue define a new method get_size() that returns the size instance property.
  def get_size(self):
    return self.size
  
  #3. Below get_size(), define another method has_space(). Inside the method, check if a self.max_size has been set. If there's no max_size set, then we will always have space in the queue, so we can return True. If so, return True if the max_size is greater than self.get_size()
  def has_space(self):
    if self.max_size == None:
      return True
    else:
      return self.max_size > self.get_size()
  #4.Define another method is_empty for Queue. The method should return True if the queue is empty (if the size of the queue is 0).
  def is_empty(self):
    return self.size == 0    
    
-----------------------------------------------------------------
#Queues Python Introduction

from node import Node
# Create the Queue class below:
class Queue:
  def __init__(self):
    self.head = None
    self.tail = None
  def peek(self):
    return self.head.get_value()

