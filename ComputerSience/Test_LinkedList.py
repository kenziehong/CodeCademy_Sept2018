#Introduction

from linked_list import LinkedList, Node

# initializing linked list with NO head node to start
linked_list_1 = LinkedList()
linked_list_1.add('hey!')
linked_list_1.add('ho!')
linked_list_1.add("let's go!")
linked_list_1.traverse()
# The last added node is the head using .add()!

# We can also add nodes without .add()!
# assigning a Node's .next property directly...
lyric_node_1 = Node('cool')
lyric_node_2 = Node('beans!')
lyric_node_1.next = lyric_node_2

# initializing a linked list WITH a head node
linked_list_2 = LinkedList(lyric_node_1)
print(linked_list_2)

# We can also build up a linked list with a loop!
current_node = Node("Let's count to 5!")
# save a reference to the head to pass to LinkedList
head = current_node 
for i in range(1, 6):
  current_node.next = Node(i) 
  current_node = current_node.next

linked_list_3 = LinkedList(head) # passing head as argument
print(linked_list_3)
print("This linked list has {0} nodes!".format(linked_list_3.size()))

==========================
#Insert at Point 

from linked_list import LinkedList

test_1 = LinkedList()
test_1.add('d')
test_1.add('c')
test_1.add('b')
test_1.add('a')
test_1.insert('x', 2)

test_result = test_1.head
for i in range(2):
  test_result = test_result.next
print("Result node's value should be 'x': {0}".format(test_result.val))

test_1.insert('t', 0)
test_result = test_1.head
print("Result node's value should be 't': {0}".format(test_result.val))


==========================
#Nth From Last

from linked_list import LinkedList, Node

test_list = LinkedList()
test_list.add('e')
test_list.add('d')
test_list.add('c')
test_list.add('b')
test_list.add('a')

test_result = test_list.n_from_last(0)

print("Result node's value should be 'e': {0}".format(test_result.val))

test_result = test_list.n_from_last(3)
print("Result node's value should be 'b': {0}".format(test_result.val))


====================================
#Remove Duplicates

from linked_list import LinkedList, Node

test_linked_list = LinkedList()

test_linked_list.add('d')
test_linked_list.add('c')
test_linked_list.add('c')
test_linked_list.add('c')
test_linked_list.add('b')
test_linked_list.add('a')
test_linked_list.add('a')

test_linked_list.remove_duplicates()

duplicates = {}
duplicate_found = False
current_node = test_linked_list.head
while current_node:
  if duplicates.get(current_node.val, False):
    duplicate_found = True
    break
  else:
    duplicates[current_node.val] = True
    current_node = current_node.next

if duplicate_found:
  print("Not all duplicates removed, try again!")
else:
  print("Duplicates removed, nice work!")


=============================================

#Merge Sorted Linked Lists

from linked_list import LinkedList, Node

linked_list_a = LinkedList()
linked_list_b = LinkedList()
linked_list_a.add('z')
linked_list_a.add('x')
linked_list_a.add('c')
linked_list_a.add('a')
linked_list_b.add('u')
linked_list_b.add('g')
linked_list_b.add('b')


def merge(linked_list_a, linked_list_b):
  
  current_node_a = linked_list_a.head
  current_node_b = linked_list_b.head
  
  if current_node_a.val < current_node_b.val:
    start_node = current_node_a
    current_node_a = current_node_a.next
  else:
    start_node = current_node_b
    current_node_b = current_node_b.next

  head = start_node
  
  while current_node_a or current_node_b:
    if not current_node_a:
      start_node.next = current_node_b
      current_node_b = current_node_b.next
    elif not current_node_b:
      start_node.next = current_node_a
      current_node_a = current_node_a.next
    elif current_node_a.val < current_node_b.val:
      start_node.next = current_node_a
      current_node_a = current_node_a.next
    else:
      start_node.next = current_node_b
      current_node_b = current_node_b.next
    start_node = start_node.next
    
  return LinkedList(head)

merged_linked_list = merge(linked_list_a, linked_list_b)

print("Merged list should contain all nodes in sorted order:\na -> b -> c -> g -> u -> x -> z ->")
print("Your function returned:\n{0}".format(merged_linked_list))

======================================

#Find Merge Point

from linked_list import LinkedList, Node, set_up_test_case

linked_list_1, linked_list_2 = set_up_test_case()
print(linked_list_1)
print(linked_list_2)

def merge_point(linked_list_a, linked_list_b):
  size_of_a = linked_list_a.size()
  size_of_b = linked_list_b.size()
  
  diff = abs(size_of_a - size_of_b)
    
  if size_of_a > size_of_b:
    bigger = linked_list_a.head
    smaller = linked_list_b.head
  else:
    bigger = linked_list_b.head
    smaller = linked_list_a.head
  
  for i in range(diff):
    bigger = bigger.next

  while bigger and smaller:
    if bigger == smaller:
      return bigger
    bigger = bigger.next
    smaller = smaller.next

  return None

test_result = merge_point(linked_list_1, linked_list_2)

print("Function should return merge point node holding 'q': {0}".format(test_result.val))


======================================

#Reverse a Linked List

from linked_list import LinkedList, Node

test_linked_list = LinkedList()

test_linked_list.add('d')
test_linked_list.add('c')
test_linked_list.add('b')
test_linked_list.add('a')


def reverse(linked_list):
    prev = None
    current_node = linked_list.head
    while current_node:
      tmp = current_node.next
      current_node.next = prev
      prev = current_node
      current_node = tmp
    return LinkedList(prev)


print("Pre-reverse: {0}".format(test_linked_list))

reversed_linked_list = reverse(test_linked_list)

print("Post-reverse: {0}".format(reversed_linked_list))

=======================================

#Detect Cycle in a Linked List

from linked_list import LinkedList, Node, build_cycle_linked_list, build_linked_list_no_cycle


cycle_linked_list = build_cycle_linked_list()
no_cycle_linked_list = build_linked_list_no_cycle()

def has_cycle(linked_list):
  slow, fast = linked_list.head, linked_list.head
  while slow and fast:
    slow = slow.next
    fast = fast.next
    if fast:
      fast = fast.next
    else:
      return False
    if fast == slow:
      return True
  return False

cycle_result = has_cycle(cycle_linked_list)
no_cycle_result = has_cycle(no_cycle_linked_list)

print("Should return True when a cycle exists: {0}".format(cycle_result))

print("Should return False when a cycle does not exist: {0}".format(no_cycle_result))


==============================

#Add Two Numbers

from linked_list import LinkedList, Node, build_test_case

linked_list_a, linked_list_b = build_test_case()

def add_two(linked_list_a, linked_list_b):
  
  result = LinkedList()
  carry = 0
  
  a_node = linked_list_a.head
  b_node = linked_list_b.head
  
  while a_node or b_node:
    
    if b_node:
      b_val = b_node.val
      b_node = b_node.next
    else:
      b_val = 0
      
    if a_node:
      a_val = a_node.val
      a_node = a_node.next
    else:
      a_val = 0
      
    to_sum = a_val + b_val + carry
    
    if to_sum > 9:
      carry = 1
      to_sum %= 10
    else:
      carry = 0

    
    if not result.head:
      result.head = Node(to_sum)
      tmp = result.head
    else:
      tmp.next = Node(to_sum)
      tmp = tmp.next
      
  if carry:
    tmp.next = Node(carry)

  return result


print("Adding linked list:\n{0}\nto linked list\n{1}\n".format(linked_list_a, linked_list_b))
result = add_two(linked_list_a, linked_list_b)
print("Result should be: 9 -> 5 -> 1 ->\nFunction returned:\n{0}".format(result))

