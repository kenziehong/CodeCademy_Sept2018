class Node:
  def __init__(self, val, next = None):
    self.val = val
    self.next = next

class LinkedList:
  def __init__(self, head_node = None):
    self.head = head_node

  def add(self, val):
    new_head = Node(val)
    new_head.next = self.head
    self.head = new_head

  def remove_duplicates(self):
    current_node = self.head
    
    while current_node:
      while current_node.next and current_node.next.val == current_node.val:
        current_node.next = current_node.next.next
      current_node = current_node.next
    return self    
    
  def remove_duplicates(self):
    current_node = self.head
    
    while current_node:
      while current_node.next and current_node.next.val == current_node.val:
        current_node.next = current_node.next.next
      current_node = current_node.next
    return self
    

  def insert(self, node_value, location):
    if not location:
      new_head = Node(node_value)
      new_head.next = self.head
      self.head = new_head
      return self

    prev = self.head
    node = Node(node_value)
    current_node = self.head.next
    
    while location > 1:
      prev = current_node
      current_node = current_node.next
      location -= 1
    
    prev.next = node
    node.next = current_node

    return self  

  def n_from_last(self, n):
    nodes_remaining = self.size() - 1 - n
    result = self.head
    
    while nodes_remaining:
      result = result.next
      nodes_remaining -= 1
    
    return result  

  def traverse(self):
    head = self.head
    print("Starting traversal from head")
    while head:
      print("visiting node: {0}".format(head.val))
      head = head.next
    print("Traversal complete")
    
  def size(self):
    node_count = 0
    current_node = self.head
    while current_node:
      node_count += 1
      current_node = current_node.next
    return node_count
  
  def __repr__(self):
    text = ''
    head = self.head
    repeat = {}
    while head:
      if repeat.get(id(head), False):
        text += str(head.val) + ' -> '
        text += "\nCYCLE DETECTED, stopping traversal..."
        break
      else:
        repeat[id(head)] = True
        text += str(head.val) + ' -> '
        head = head.next
    return text

  # def __repr__(self):
  #   text = ''
  #   head = self.head
  #   while head:
  #     text += str(head.val) + ' -> '
  #     head = head.next
  #   return text  

def build_test_case():
  linked_list_a = LinkedList()
  linked_list_a.add(1)
  linked_list_a.add(4)
  linked_list_a.add(2)
  linked_list_b = LinkedList()
  linked_list_b.add(1)
  linked_list_b.add(7)
  return linked_list_a, linked_list_b    
  
def build_cycle_linked_list():
  start_node = Node('a')
  head = start_node
  b = Node('b')
  c = Node('c')
  d = Node('d')
  for letter_node in [b, c, d]:
    start_node.next = letter_node
    start_node = start_node.next
  start_node.next = b
  return LinkedList(head)
  
def build_linked_list_no_cycle():
  start_node = Node('a')
  head = start_node
  
  for letter in ['b', 'c', 'd', 'b']:
    start_node.next = Node(letter)
    start_node = start_node.next
  return LinkedList(head)
  



def set_up_test_case():
  head_node_1 = Node('x')
  head_node_2 = Node('d')
  current_node_1 = head_node_1
  current_node_2 = head_node_2
  
  for letter in ['a', 'b']:
    current_node_1.next = Node(letter)
    current_node_1 = current_node_1.next
    
  current_node_2.next = Node('f')
  current_node_2 = current_node_2.next
  
  for shared_node in [Node('q'), Node('e')]:
  	current_node_1.next = shared_node
  	current_node_2.next = shared_node
  	current_node_1 = current_node_1.next
  	current_node_2 = current_node_2.next
    
  linked_list_1 = LinkedList(head_node_1)
  linked_list_2 = LinkedList(head_node_2)
  return linked_list_1, linked_list_2