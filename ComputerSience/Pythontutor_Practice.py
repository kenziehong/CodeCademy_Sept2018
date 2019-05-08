class Node:
	def __init__(self, val, next = None):
		self.val = val
		self.next = next


class LinkedList:
	def __init__(self, head = None):
		self.head = head

	def add(self, add):
		current = Node(add) 
		current.next = self.head 
		self.head = current # (LinkedList instance).head point to current

	def remove(self, remove): # With condition: remove exist in linkedlist
	  	current= self.head
	  	if current.val == remove:
	  		self.head = current.next  		
	  	else:
	  		while current:
	  			near = current.next
	  		    if near.val == remove 
	  		    	current.next = near.next
	  		    	current = None

	  		    else:
	  		        current = near   

    def insert(self, insert, location):
	    if not location:
	      current = Node(insert)
	      current.next = self.head
	      self.head = current
	      return self

	    prev = self.head
	    node = Node(insert)
	    current = self.head.next
	    
	    while location > 1:
	      prev = current
	      current = current.next
	      location -= 1
	    
	    prev.next = node
	    node.next = current

	    return self	  	

    def n_from_last(self, last):
    	remain = self.size() - 1 - last
    	current = self.head

    	while remain:
    		current = current.next
    		remain -=1 

    	return current	

	
	def remove_duplicates(self):
		current = self.head

		while current:
			while current.next and current.next.val == current.val:
				current.next = current.next.next
			current = current.next

		return self		

	def size(self):
		count = 0
		current = self.head
		while current:
			count +=1
			current = current.next
		return count	

    def __repr__(self):
    	text = ''
        current = self.head
	    while current:
	    	text += str(current.val) + ' -> '
	        current = current.next
	    return text

	def traverse(self):
	    current = self.head
	    print("Starting traversal from head")
	    while current:
	        print("visiting node: {0}".format(current.val))
	        current = current.next

	    print("Traversal complete")    


==============================================
#1.Intro

linkedlist_1 = LinkedList()
linkedlist_1.add("hong")
linkedlist_1.add("huong")
linkedlist_1.add("hoa")
linkedlist_1.add("lan")
linkedlist_1.traverse()
linkedlist_1.remove("huong")
linkedlist_1.traverse()
# The last added node is the head using .add()!

# We can also add nodes without .add()!
# assigning a Node's .next property directly...
node_1 = Node('cool')
node_2 = Node('beans!')
node_1.next = node_2

# initializing a linked list WITH a head node
linkedlist_2 = LinkedList(node_1)
print(linkedlist_2)


# We can also build up a linked list with a loop!
node_3 = Node("Let's count to 5!")
# save a reference to the head to pass to LinkedList
head = node_3
for i in range(1, 6):
	node_3.next = Node(i) 
    node_3 = node_3.next

linkedlist_3 = LinkedList(head) # passing head as argument
print(linkedlist_3)
print("This linked list has {0} nodes!".format(linkedlist_3.size()))

==========================================
#2.Insert

test_1 = LinkedList()
test_1.add('e')
test_1.add('d')
test_1.add('c')
test_1.add('b')
test_1.add('a')
test_1.insert('x', 3)

test_result = test_1.head
for i in range(2):
  test_result = test_result.next
print("Result node's value should be 'x': {0}".format(test_result.val))

test_1.insert('t', 0)
test_result = test_1.head
print("Result node's value should be 't': {0}".format(test_result.val))    

==========================================
#3.Nth From Last

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

=======================================================
#4.Remove Duplicates

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

====================================
#5 Merge Sorted Linked Lists


linked_list_a = LinkedList()
linked_list_b = LinkedList()
linked_list_a.add('z')
linked_list_a.add('x')
linked_list_a.add('c')
linked_list_a.add('a')
linked_list_b.add('u')
linked_list_b.add('g')
linked_list_b.add('b')

def merge_h(linkedlist_a, linkedlist_b):
	current_a = linkedlist_a.head
	current_b = linkedlist_b.head

	if current_a.val < current_b.val:
		start = current_a
		current_a = current_a.next
	else:
	    start = current_b
	    current_b = current_b.next
	new = start
	
	while start:
	    if not current_a: 
	    	start.next = current_b
	    	start = current_b.next 
	    elif not current_b:
	        start.next = current_a 
	        current_a = current_a.next
	    elif current_a.val < current_b.val:
	        start.next = current_a
	        current_a = current_a.next
	    else:
	    	start.next = current_b
	    	current_b = current_b.next

	    start = start.next	 

	return LinkedList(new)    	
	            	

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

===================================
#6.Find Merge Point

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

===================================
#7. Reverse a Linked List

test_linked_list = LinkedList()

test_linked_list.add('d')
test_linked_list.add('c')
test_linked_list.add('b')
test_linked_list.add('a')


def reverse(linked_list):
    prev = None
    current = linked_list.head
    while current:
      tmp = current.next
      current.next = prev
      prev = current
      current = tmp
    return LinkedList(prev)


print("Pre-reverse: {0}".format(test_linked_list))

reversed_linked_list = reverse(test_linked_list)

print("Post-reverse: {0}".format(reversed_linked_list))

=================================
#Detect Cycle in a Linked List

# def __repr__(self):
#     text = ''
#     head = self.head
#     repeat = {}
#     while head:
#       if repeat.get(id(head), False):
#         text += str(head.val) + ' -> '
#         text += "\nCYCLE DETECTED, stopping traversal..."
#         break
#       else:
#         repeat[id(head)] = True
#         text += str(head.val) + ' -> '
#         head = head.next
#     print(repeat)    
#     return text
  
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


cycle_linked_list = build_cycle_linked_list()
no_cycle_linked_list = build_linked_list_no_cycle()
print(cycle_linked_list)
print(no_cycle_linked_list)


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

=======================================
#9. Add Two Numbers

def build_test_case():
  linked_list_a = LinkedList()
  linked_list_a.add(1)
  linked_list_a.add(4)
  linked_list_a.add(2)
  linked_list_b = LinkedList()
  linked_list_b.add(1)
  linked_list_b.add(7)
  return linked_list_a, linked_list_b

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

---------------------------------------------------------
17/01/2019

TECHNICAL INTERVIEW PROBLEMS: DYNAMIC PROGRAMMING

#Fibonacci Without Memoization
arguments_count = {}
num_in_fibonacci = 9

def fibonacci(num):
  count = arguments_count.get(num, 0)
  count += 1
  arguments_count[num] = count
  if num < 0:
    print("Not a valid number")
  if num <= 1:
    return num
  else:
    return fibonacci(num - 1) + fibonacci(num - 2)
  

print("Number {0} in the fibonacci sequence is {1}.".format(num_in_fibonacci, fibonacci(num_in_fibonacci)))
      
for num, count in arguments_count.items():
  print("Argument {0} seen {1} time(s)!".format(num, count))

print("Fibonacci function called {0} total times!".format(sum(arguments_count.values())))

=============================================
#Fibonacci With Memoization

num_in_fibonacci = 9
function_calls = []

def fibonacci(num,memo):
  function_calls.append(1)
  
  if num < 0:
    print("Not a valid number")
  if num <= 1:
    return num
  elif memo.get(num):
    return memo.get(num)
    
  else:
    memo[num] = fibonacci(num - 1, memo) + fibonacci(num - 2,memo)
    return memo[num]
  
  
fibonacci_result = fibonacci(num_in_fibonacci,{})
print("Number {0} in the fibonacci sequence is {1}.".format(num_in_fibonacci, fibonacci_result))

print("Fibonacci function called {0} total times!".format(len(function_calls)))

  
-----------------------------------------------
#Knapsack Without Memoization





