#Linked List Review

class Node:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next_node = next_node
    
  def get_value(self):
    return self.value
  
  def get_next_node(self):
    return self.next_node
  
  def set_next_node(self, next_node):
    self.next_node = next_node

class LinkedList:
  def __init__(self, value=None):
    self.head_node = Node(value)
  
  def get_head_node(self):
    return self.head_node
  
  def insert_beginning(self, new_value):
    new_node = Node(new_value)
    new_node.set_next_node(self.head_node)
    self.head_node = new_node
    
  def stringify_list(self):
    string_list = ""
    current_node = self.get_head_node()
    while current_node:
      if current_node.get_value() != None:
        string_list += str(current_node.get_value()) + "\n"
      current_node = current_node.get_next_node()
    return string_list
  
  def remove_node(self, value_to_remove):
    current_node = self.get_head_node()
    if current_node.get_value() == value_to_remove:
      self.head_node = current_node.get_next_node()
    else:
      while current_node:
        next_node = current_node.get_next_node()
        if next_node.get_value() == value_to_remove:
          current_node.set_next_node(next_node.get_next_node())
          current_node = None
        else:
          current_node = next_node


ll = LinkedList()
ll.insert_beginning(50)
ll.insert_beginning(60)
ll.insert_beginning(70)
print(ll.stringify_list())

ll.remove_node(60)
print(ll.stringify_list())
          

-----------------------------------------------------------------
#Linked List Implementation III

# We'll be using our Node class
class Node:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next_node = next_node
    
  def get_value(self):
    return self.value
  
  def get_next_node(self):
    return self.next_node
  
  def set_next_node(self, next_node):
    self.next_node = next_node

# Our LinkedList class
class LinkedList:
  def __init__(self, value=None):
    self.head_node = Node(value)
  
  def get_head_node(self):
    return self.head_node
  
  def insert_beginning(self, new_value):
    new_node = Node(new_value)
    new_node.set_next_node(self.head_node)
    self.head_node = new_node
    
  def stringify_list(self):
    string_list = ""
    current_node = self.get_head_node()
    while current_node:
      if current_node.get_value() != None:
        string_list += str(current_node.get_value()) + "\n"
      current_node = current_node.get_next_node()
    return string_list
  
  # Define your remove_node method below:
  #1. add a remove_node() method to LinkedList. It should take value_to_remove as an argument. We'll be looking for a node with this value to remove.In the body of remove_node(), set a new variable current_node equal to the head_node of the list. We'll use current_node to keep track of the node we are currently looking at as we traverse the list.
  def remove_node(self, value_to_remove):
    current_node = self.get_head_node()
    
    #2.Still inside the method body, use an if statement to check whether the list's head_node has a value that is the same as value_to_remove. If it does, we've found the node we're looking for and we need to adjust the list's pointer to head_node. Inside the if clause, set self.head_node equal to the second node in the linked list.
    if current_node.get_value() == value_to_remove:
      self.head_node = current_node.get_next_node()
      
      #3.Add an else clause. Within the else clause: Traverse the list until current_node.get_next_node().get_value() is the value_to_remove. (Just like with stringify_list you can traverse the list using a while loop that checks whether current_node exists.) When value_to_remove is found, adjust the links in the list so that current_node is linked to next_node.get_next_node(). After you remove the node with a value of value_to_remove, make sure to set current_node to None so that you exit the loop
    else:
      while current_node:
        next_node = current_node.get_next_node()
        if next_node.get_value() == value_to_remove:
          current_node.set_next_node(next_node.get_next_node())
          current_node = None
        else:
          current_node = next_node


------------------------------------------
#Linked Lists Implementation II

# We'll be using our Node class
class Node:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next_node = next_node
    
  def get_value(self):
    return self.value
  
  def get_next_node(self):
    return self.next_node
  
  def set_next_node(self, next_node):
    self.next_node = next_node

# Our LinkedList class
class LinkedList:
  def __init__(self, value=None):
    self.head_node = Node(value)
  
  def get_head_node(self):
    return self.head_node
  
  # Add your insert_beginning and stringify_list methods below:
  #1. Define an insert_beginning() method which takes new_value as an argument. Inside the method, instantiate a Node with new_value and set it equal to new_node. Now, link new_node to the existing head_node. Finally, replace the current head_node with new_node
  
  def insert_beginning(self, new_value):
    new_node = Node(new_value)
    new_node.set_next_node(self.head_node)
    self.head_node = new_node
    
  #2.Define a stringify_list method we can use to print out a string representation of a list's nodes' values. The method should traverse the list, beginning at the head node, and collect each node's value in a string. Once the end of the list has been reached, the method should return the string. You can use str() to convert integers to strings! Be sure to add "\n" between values so that each value prints on a new line. 
    
  def stringify_list(self):
    string_list = ""
    current_node = self.get_head_node()
    while current_node:
      if current_node.get_value() != None:
        string_list += str(current_node.get_value()) + "\n"
      current_node = current_node.get_next_node()
    return string_list

# Test your code by uncommenting the statements below - did your list print to the terminal?
ll = LinkedList(5)
ll.insert_beginning(70)
ll.insert_beginning(5675)
ll.insert_beginning(90)
print(ll.stringify_list())


--------------------------------------------------------
#Linked List Implementation I

# We'll be using our Node class
class Node:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next_node = next_node
    
  def get_value(self):
    return self.value
  
  def get_next_node(self):
    return self.next_node
  
  def set_next_node(self, next_node):
    self.next_node = next_node

# Create your LinkedList class below:
#1. Define an __init__() method for the LinkedList. We want to be able to instantiate a LinkedList with a head node, so __init__() should take value as an argument. Make sure value defaults to None if no value is provided.
# Inside the __init__() method, set self.head_node equal to a new Node with value as its value.
class LinkedList:
  def __init__(self, value = None):
    self.head_node = Node(value)
    
    #2. Define a get_head_node() method that helps us peek at the first node in the list. Inside the method, return the head node of the linked list
  def get_head_node(self):
    return self.head_node
  
----------------------------------------------
#Node Implementation

# Define your Node class below:
#1. Within script.py in the pane to the right, create an empty Node class. Define an __init__ method for the Node. It should take a value and a next_node. next_node should default to None if not provided. 
#These variables should be saved to self with corresponding key names.
class Node:
  def __init__(self, value, next_node = None):
    self.value = value
    self.next_node = next_node

#2.  Define get_value and get_next_node methods. These should return the corresponding values from self.
  def get_value(self):
    return self.value
  def get_next_node(self):
    return self.next_node
  #3. Define a set_next_node method that takes self and next_node as parameters and allows updating the link to the next node
  def set_next_node(self, next_node):
    self.next_node = next_node

#4. Outside the Node class, create a my_node instance of Node with the value of 44. Use get_value to print the value of my_node
my_node = Node(44)
print(my_node.get_value())
  
  
  
  
      
