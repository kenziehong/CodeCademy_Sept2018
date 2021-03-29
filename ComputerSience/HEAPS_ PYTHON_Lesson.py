#Min-Heap Review

# script.py

# import random number generator
from random import randrange
# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# populate min_heap with descending numbers
descending_nums = [n for n in range(10001, 1, -1)]
print("ADDING!")
for el in descending_nums:
  min_heap.add(el)

print("REMOVING!")
# remove minimum until min_heap is empty
min_heap.retrieve_min()

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# min_heap.py

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  def child_present(self, idx):
    return self.left_child_idx(idx) <= self.count
  
  def retrieve_min(self):
    if self.count == 0:
      print("No items in heap")
      return None
    
    min = self.heap_list[1]
    self.heap_list[1] = self.heap_list[self.count]
    self.count -= 1
    self.heap_list.pop()
    self.heapify_down()
    return min

  def add(self, element):
    self.count += 1
    self.heap_list.append(element)
    self.heapify_up()


  def get_smaller_child_idx(self, idx):
    if self.right_child_idx(idx) > self.count:
      return self.left_child_idx(idx)
    else:
      left_child = self.heap_list[self.left_child_idx(idx)]
      right_child = self.heap_list[self.right_child_idx(idx)]
      if left_child < right_child:
        return self.left_child_idx(idx)
      else:
        return self.right_child_idx(idx)
    
  def heapify_up(self):
    idx = self.count
    swap_count = 0
    while self.parent_idx(idx) > 0:
      if self.heap_list[self.parent_idx(idx)] > self.heap_list[idx]:
        swap_count += 1
        tmp = self.heap_list[self.parent_idx(idx)]
        self.heap_list[self.parent_idx(idx)] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = self.parent_idx(idx)

    element_count = len(self.heap_list)
    if element_count > 10000:
      print("Heap of {0} elements restored with {1} swaps"
            .format(element_count, swap_count))
      print("")    
      
  def heapify_down(self):
    idx = 1
    # starts at 1 because we swapped first and last elements
    swap_count = 1
    while self.child_present(idx):
      smaller_child_idx = self.get_smaller_child_idx(idx)
      if self.heap_list[idx] > self.heap_list[smaller_child_idx]:
        swap_count += 1
        tmp = self.heap_list[smaller_child_idx]
        self.heap_list[smaller_child_idx] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = smaller_child_idx

    element_count = len(self.heap_list)
    if element_count >= 10000:
      print("Heap of {0} elements restored with {1} swaps"
            .format(element_count, swap_count))
      print("")  


---------------------------------------------------------------------------------

#Removing the Min: Heapify Down II

#script.py

# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# set internal list for testing purposes...
min_heap.heap_list = [None, 10, 13, 21, 61, 22, 23, 99]
min_heap.count = 7

while len(min_heap.heap_list) != 1:
  print(min_heap.heap_list)
  min_heap.retrieve_min()

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# min_heap.py

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  # NEW HELPER!
  def child_present(self, idx):
    return self.left_child_idx(idx) <= self.count

  # END OF HEAP HELPER METHODS
  
  def retrieve_min(self):
    if self.count == 0:
      print("No items in heap")
      return None
    
    min = self.heap_list[1]
    print("Removing: {0} from {1}".format(min, self.heap_list))
    self.heap_list[1] = self.heap_list[self.count]
    self.count -= 1
    self.heap_list.pop()
    print("Last element moved to first: {0}".format(self.heap_list))    
    self.heapify_down()
    return min

  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()
    
      
  def heapify_down(self):
    idx = 1
    
    #1.the loop will run as long as idx has a child element
    while self.child_present(idx):
      print("Heapifying down!")
      smaller_child_idx = self.get_smaller_child_idx(idx)
      child = self.heap_list[smaller_child_idx]
      parent = self.heap_list[idx]
      if parent > child:
        self.heap_list[idx] = child
        self.heap_list[smaller_child_idx] = parent
      idx = smaller_child_idx
    print("HEAP RESTORED! {0}".format(self.heap_list))

  def get_smaller_child_idx(self, idx):
    if self.right_child_idx(idx) > self.count:
      print("There is only a left child")
      return self.left_child_idx(idx)
    else:
      left_child = self.heap_list[self.left_child_idx(idx)]
      right_child = self.heap_list[self.right_child_idx(idx)]
      if left_child < right_child:
        print("Left child is smaller")
        return self.left_child_idx(idx)
      else:
        print("Right child is smaller")
        return self.right_child_idx(idx)
    
  def heapify_up(self):
    idx = self.count
    while self.parent_idx(idx) > 0:
      if self.heap_list[self.parent_idx(idx)] > self.heap_list[idx]:
        tmp = self.heap_list[self.parent_idx(idx)]
        print("swapping {0} with {1}".format(tmp, self.heap_list[idx]))
        self.heap_list[self.parent_idx(idx)] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = self.parent_idx(idx)
    print("HEAP RESTORED! {0}".format(self.heap_list))
    print("")
    

---------------------------------------------------------------------------

#.Finding the Smallest Child

#. script.py 

# import random number generator
from random import randrange
# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# set internal list for testing purposes...
min_heap.heap_list = [None, 10, 13, 21, 61, 22, 23, 99]
min_heap.count = 7

print("The smaller child of index 1 is: ")
smaller_child_of_idx_1 = min_heap.get_smaller_child_idx(1)
print(smaller_child_of_idx_1)
smaller_child_element = min_heap.heap_list[smaller_child_of_idx_1]
print(smaller_child_element)

print("The smaller child of index 2 is: ")
smaller_child_of_idx_2 = min_heap.get_smaller_child_idx(2)
print(smaller_child_of_idx_2)
smaller_child_element = min_heap.heap_list[smaller_child_of_idx_2]
print(smaller_child_element)

print("The smaller child of index 3 is: ")
smaller_child_of_idx_3 = min_heap.get_smaller_child_idx(3)
print(smaller_child_of_idx_3)
smaller_child_element = min_heap.heap_list[smaller_child_of_idx_3]
print(smaller_child_element)


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#min_heap.py

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  # END OF HEAP HELPER METHODS
  
  def retrieve_min(self):
    if self.count == 0:
      print("No items in heap")
      return None
    
    min = self.heap_list[1]
    print("Removing: {0} from {1}".format(min, self.heap_list))
    self.heap_list[1] = self.heap_list[self.count]
    self.count -= 1
    self.heap_list.pop()
    print("Last element moved to first: {0}".format(self.heap_list))    
    self.heapify_down()
    return min

  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()
    
  #1. 
  def get_smaller_child_idx(self, idx):
    
    #check we do have a right child
    if self.right_child_idx(idx) > self.count:
      print("There is only a left child")
      return self.left_child_idx(idx)
    else:
      #2. make a comparision to see which is smaller
      left_child = self.heap_list[self.left_child_idx(idx)]
      right_child = self.heap_list[self.right_child_idx(idx)]
      if left_child < right_child:
        print("Left child is smaller")
        return self.left_child_idx(idx)
      else:
        print("Right child is smaller")
        return self.right_child_idx(idx)
    
  def heapify_up(self):
    idx = self.count
    while self.parent_idx(idx) > 0:
      if self.heap_list[self.parent_idx(idx)] > self.heap_list[idx]:
        tmp = self.heap_list[self.parent_idx(idx)]
        print("swapping {0} with {1}".format(tmp, self.heap_list[idx]))
        self.heap_list[self.parent_idx(idx)] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = self.parent_idx(idx)
    print("HEAP RESTORED! {0}".format(self.heap_list))
    print("")
      
  def heapify_down(self):
    print("Heapifying down! {incomplete}")
    idx = 1 
----------------------------------------------------------------

#Heapify Down I

# import random number generator
from random import randrange
# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# populate min_heap with random numbers
random_nums = [randrange(1, 101) for n in range(6)]
for el in random_nums:
  min_heap.add(el)

# Test that .heapify_down() is called by .retrieve_min()
min_heap.retrieve_min()

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  # END OF HEAP HELPER METHODS

  def retrieve_min(self):
    if self.count == 0:
      print("No items in heap")
      return None
    
    min = self.heap_list[1]
    print("Removing: {0} from {1}".format(min, self.heap_list))
    self.heap_list[1] = self.heap_list[self.count]
    self.count -= 1
    self.heap_list.pop()
    print("Last element moved to first: {0}".format(self.heap_list))    
    # Checkpoint 3: add .heapify_down()
    #3. 
    self.heapify_down()
    return min
  
  
  # define .heapify_down() below...
  #1.
  def heapify_down(self):
    print("Heapifying down!")
    
    #1. declare a variable idx and set it to 1. Initially, this is pointng to our out-of-place value we swapped in while removing the minimum
    idx = 1  

  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()
    
  def heapify_up(self):
    idx = self.count
    while self.parent_idx(idx) > 0:
      if self.heap_list[self.parent_idx(idx)] > self.heap_list[idx]:
        tmp = self.heap_list[self.parent_idx(idx)]
        print("swapping {0} with {1}".format(tmp, self.heap_list[idx]))
        self.heap_list[self.parent_idx(idx)] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = self.parent_idx(idx)
    print("HEAP RESTORED! {0}".format(self.heap_list))
    print("")


---------------------------------------------------------------

#Removing the Min

# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# add elements
min_heap.add(7)
min_heap.add(12)
min_heap.add(42)

# remove minimum element
print(min_heap.retrieve_min())

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  # END OF HEAP HELPER METHODS

  # define .retrieve_min() below...
  def retrieve_min(self):
    
    #1. have no element to retrieve
    if self.count == 0:
      print("No items in heap")
      return None
    
    #2. declare the varibale min, which is the element at index 1 in our internal list
    min = self.heap_list[1]
    
    #3.
    print("Removing: min {} from self.heap_list {}".format(min, self.heap_list))
    self.heap_list[1] = self.heap_list[-1]
    self.heap_list.pop()
    self.count -=1
    
    #4.
    print("Last element moved to first: self.heap_list {}".format(self.heap_list))
    return min
  
  
  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()
    
  def heapify_up(self):
    idx = self.count
    while self.parent_idx(idx) > 0:
      if self.heap_list[self.parent_idx(idx)] > self.heap_list[idx]:
        tmp = self.heap_list[self.parent_idx(idx)]
        print("swapping {0} with {1}".format(tmp, self.heap_list[idx]))
        self.heap_list[self.parent_idx(idx)] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = self.parent_idx(idx)
    print("HEAP RESTORED! {0}".format(self.heap_list))
    print("")  

 -----------------------------------------------------------------------

 #Adding an Element: Heapify Up II

 # import random number generator
from random import randrange
# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# populate min_heap with random numbers
random_nums = [randrange(1, 101) for n in range(6)]
for el in random_nums:
  min_heap.add(el)


# test it out, is the minimum number at index 1?
print(min_heap.heap_list)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  # END OF HEAP HELPER METHODS

  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()
    
  def heapify_up(self):
    print("Heapifying up")
    # start at the last element of the list
    # while there's a parent element available:
        # if the parent element is greater:
          # swap the elements
        # set the target element index to be the parent's index
    
    #1. declare a variable called idx and set it to the last index of the internal list
    idx = len(self.heap_list)-1
    
    #2. set up a while loop that will run as long as there is a valid parent index. A valid parent index is anything greater than 0. Inside the loop, set idx to be the index of its parent
    while self.parent_idx(idx) > 0:
      
      #3. declare variable
      child = self.heap_list[idx]
      parent = self.heap_list[self.parent_idx(idx)]
      
      #4. check to see if parent is greater than child
      if parent > child:
        print("swapping parent_element {} with element_at_index {}".format(parent, self.parent_idx(idx)))
        self.heap_list[idx] = parent
        self.heap_list[self.parent_idx(idx)] = child
      idx = self.parent_idx(idx)
    print("Heap Restored {0}".format(self.heap_list))


--------------------------------------------------------

#Translating Parent and Child Elements Into Indices

# importing heap class
from min_heap import MinHeap 

# an instance of MinHeap to use
min_heap = MinHeap()

# the internal list for our example
min_heap.heap_list = [None, 10, 13, 21, 61, 22, 23, 99]
print(min_heap.heap_list)


# example of how to use the helper methods:
#print("the parent index of 4 is:")
#print(min_heap.parent_idx(4))
#print("the left child index of 3 is:")
#print(min_heap.left_child_idx(3))

# now it's your turn!
# replace 'None' below using the correct helper methods and indexes
idx_2_left_child_idx = min_heap.left_child_idx(2)
print("The left child index of index 2 is:")
print(idx_2_left_child_idx)
print("The left child element of index 2 is:")
# uncomment the line below to see the result in your console!
print(min_heap.heap_list[idx_2_left_child_idx])

idx_3_parent_idx = min_heap.parent_idx(3)
print("The parent index of index 3 is:")
print(idx_3_parent_idx)
print("The parent element of index 3 is:")
# uncomment the line below to see the result in your console!
print(min_heap.heap_list[idx_3_parent_idx])

idx_3_right_child_idx = min_heap.right_child_idx(3)
print("The right child index of index 3 is:")
print(idx_3_right_child_idx)
print("The right child element of index 3 is:")
# uncomment the line below to see the result in your console!
print(min_heap.heap_list[idx_3_right_child_idx])


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  # END OF HEAP HELPER METHODS
  
  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()
    
  def heapify_up(self):
    print("Heapifying up...")
-------------------------------------------------------

#Adding an Element: Heapify Up I

# import heap class
from min_heap import MinHeap 

min_heap = MinHeap()
print(min_heap.heap_list)

# testing out .add()
min_heap.add(42)
print(min_heap.heap_list)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # define .add() below...
  def add(self, element):
    print("Adding {} to {}".format(element, self.heap_list))
    self.count +=1
    self.heap_list.append(element)
    self.heapify_up()


  # define .heapify_up() below...
  def heapify_up(self):
    print("Restoring the heap property...")

--------------------------------------------------------------

#Defining Min-Heap

# import heap class
from min_heap import MinHeap 

# Make an instance of MinHeap and assign it to the variable heap
heap = MinHeap()


# Print out the internal list
print(heap.heap_list)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Define MinHeap below...
class MinHeap:
  def __init__(self):
    
   #1. assign a list containing None to self.heap_list and 0 to self.count
    self.heap_list = [None]
    self.count = 0

-------------------------------------------------------

#Min-Heaps of Fun

# import random number generator
from random import randrange
# import heap class
from min_heap import MinHeap 

# make an instance of MinHeap
min_heap = MinHeap()

# populate min_heap with random numbers
random_nums = [randrange(1, 101) for n in range(6)]
for el in random_nums:
  min_heap.add(el)

# remove minimum until min_heap is empty
while min_heap.count != 0:
  min_heap.retrieve_min()

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


class MinHeap:
  def __init__(self):
    self.heap_list = [None]
    self.count = 0

  # HEAP HELPER METHODS
  # DO NOT CHANGE!
  def parent_idx(self, idx):
    return idx // 2

  def left_child_idx(self, idx):
    return idx * 2

  def right_child_idx(self, idx):
    return idx * 2 + 1

  def child_present(self, idx):
    return self.left_child_idx(idx) <= self.count

  # END OF HEAP HELPER METHODS
  

  def retrieve_min(self):
    if self.count == 0:
      print("No items in heap")
      return None
    
    min = self.heap_list[1]
    print("Removing: {0} from {1}".format(min, self.heap_list))
    self.heap_list[1] = self.heap_list[self.count]
    self.count -= 1
    self.heap_list.pop()
    print("Last element moved to first: {0}".format(self.heap_list))    
    self.heapify_down()
    return min

  def add(self, element):
    self.count += 1
    print("Adding: {0} to {1}".format(element, self.heap_list))
    self.heap_list.append(element)
    self.heapify_up()


  def get_smaller_child_idx(self, idx):
    if self.right_child_idx(idx) > self.count:
      print("There is only a left child")
      return self.left_child_idx(idx)
    else:
      left_child = self.heap_list[self.left_child_idx(idx)]
      right_child = self.heap_list[self.right_child_idx(idx)]
      if left_child < right_child:
        print("Left child is smaller")
        return self.left_child_idx(idx)
      else:
        print("Right child is smaller")
        return self.right_child_idx(idx)
    
  def heapify_up(self):
    idx = self.count
    while self.parent_idx(idx) > 0:
      if self.heap_list[self.parent_idx(idx)] > self.heap_list[idx]:
        tmp = self.heap_list[self.parent_idx(idx)]
        print("swapping {0} with {1}".format(tmp, self.heap_list[idx]))
        self.heap_list[self.parent_idx(idx)] = self.heap_list[idx]
        self.heap_list[idx] = tmp
      idx = self.parent_idx(idx)
    print("HEAP RESTORED! {0}".format(self.heap_list))
    print("")
      
  def heapify_down(self):
    idx = 1
    while self.child_present(idx):
      smaller_child_idx = self.get_smaller_child_idx(idx)
      if self.heap_list[idx] > self.heap_list[smaller_child_idx]:
        tmp = self.heap_list[smaller_child_idx]
        print("swapping {0} with {1}".format(self.heap_list[idx], tmp))
        self.heap_list[smaller_child_idx] = self.heap_list[idx]
        self.heap_list[idx] = tmp

      idx = smaller_child_idx
    print("HEAP RESTORED! {0}".format(self.heap_list))
    print("")    
    