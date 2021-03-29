LEARN HASH MAPS
Blossom
The language of the flowers has a long history and has often been a topic resigned to the domain of dusty books in a thrift bookseller or a library. With Blossom, we want to give people lightning fast access to all of the possible meanings of their favorite flowers.

In this project, we are going to implement a hash map to relate the names of flowers to their meanings. In order to avoid collisions when our hashing function collides the names of two flowers, we are going to use separate chaining. We will implement the Linked List data structure for each of these separate chains.

-----------------------------------------------------------
#script.py

from linked_list import Node, LinkedList
from blossom_lib import flower_definitions


class HashMap:
  def __init__(self, size):
    self.array_size = size

    self.array = [[] for index in range(self.array_size)]
    #self.array = [LinkedList() for index in range(self.array_size)]
    
  def hash(self, key):
    hash_code = sum(key.encode())
    return hash_code
  
  def compress(self, hash_code):
    return hash_code % self.array_size
  
  def assign(self, key, value):
    array_index = self.compress(self.hash(key))
    
    #14.
    #payload = Node([key, value])
    list_at_array = self.array[array_index]
    
    #16.
    for item in list_at_array:
      if item[0] == key:
        item[1] = value
    #list_at_array.insert(payload) 
    list_at_array.append([key, value])
     
  def retrieve(self, key):
    array_index = self.compress(self.hash(key))
    list_at_index = self.array[array_index]
    
    for item in list_at_index:
      if item[0]==key:
        return item[1]
    return None
         
    
        
blossom = HashMap(len(flower_definitions))
for flower in flower_definitions:
  blossom.assign(flower[0], flower[1])
  
print(blossom.retrieve('snapdragon'))  
  

-------------------------------------------------------------------------
#linked_list.py

class Node:
  def __init__(self, value):
    self.value = value
    self.next_node = None
    
  def get_value(self):
    return self.value
  
  def get_next_node(self):
    return self.next_node
  
  def set_next_node(self, next_node):
    self.next_node = next_node

class LinkedList:
  def __init__(self, head_node=None):
    self.head_node = head_node
  
  def insert(self, new_node):
    current_node = self.head_node

    if not current_node:
      self.head_node = new_node

    while(current_node):
      next_node = current_node.get_next_node()
      if not next_node:
        current_node.set_next_node(new_node)
      current_node = next_node

  def __iter__(self):
    current_node = self.head_node
    while(current_node):
      yield current_node.get_value()
      current_node = current_node.get_next_node()

-----------------------------------------------------
#blossom_lib.py

flower_definitions = [['begonia', 'cautiousness'], ['chrysanthemum', 'cheerfulness'], ['carnation', 'memories'], ['daisy', 'innocence'], ['hyacinth', 'playfulness'], ['lavender', 'devotion'], ['magnolia', 'dignity'], ['morning glory', 'unrequited love'], ['periwinkle', 'new friendship'], ['poppy', 'rest'], ['rose', 'love'], ['snapdragon', 'grace'], ['sunflower', 'longevity'], ['wisteria', 'good luck']]




