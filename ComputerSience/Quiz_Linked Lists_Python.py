class LinkedList:
  def __init__(self, head_node=None):
    self.head_node = head_node
    
  def stringify_list(self):
    string_list = ""
    current_node = self.head_node
    while current_node:
      string_list += str(current_node.value) + "."
      current_node = current_node.next_node
    return string_list
  
a = Node(5)
b = Node(70, a)
c = Node(5675, b)
d = Node(90, c)
ll = LinkedList(d)

print(ll.stringify_list())

-------------------------------------------------

class Node:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next_node = next_node

class LinkedList:
  def __init__(self, head_node=None):
    self.head_node = head_node
    
  def remove_node(self, node_to_remove):
    current_node = self.head_node
    if current_node == node_to_remove:
      self.head_node = current_node.next_node
    else:
      while current_node:
        next_node = current_node.next_node
        if next_node == node_to_remove:
          current_node.next_node = next_node.next_node
          current_node = None
        else:
          current_node = next_node

------------------------------------------------

class Node:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next_node = next_node

class LinkedList:
  def __init__(self, head_node=None):
    self.head_node = head_node
    
  def add_new_head(self, new_head_node):
    new_head_node.next_node = self.head_node
    self.head_node = new_head_node
