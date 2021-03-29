from random import randrange, shuffle

def quicksort(list, start, end):
  # this portion of list has been sorted
  if start >= end:
    return
  print("Running quicksort on {0}".format(list[start: end + 1]))
  # select random element to be pivot
  pivot_idx = randrange(start, end + 1)
  pivot_element = list[pivot_idx]
  print("Selected pivot {0}".format(pivot_element))
  # swap random element with last element in sub-lists
  list[end], list[pivot_idx] = list[pivot_idx], list[end]

  # tracks all elements which should be to left (lesser than) pivot
  less_than_pointer = start
  
  for i in range(start, end):
    # we found an element out of place
    if list[i] < pivot_element:
      # swap element to the right-most portion of lesser elements
      print("Swapping {0} with {1}".format(list[i], pivot_element))
      list[i], list[less_than_pointer] = list[less_than_pointer], list[i]
      # tally that we have one more lesser element
      less_than_pointer += 1
  # move pivot element to the right-most portion of lesser elements
  list[end], list[less_than_pointer] = list[less_than_pointer], list[end]
  print("{0} successfully partitioned".format(list[start: end + 1]))
  # recursively sort left and right sub-lists
  quicksort(list, start, less_than_pointer - 1)
  quicksort(list, less_than_pointer + 1, end)


    
  
list = [5,3,1,7,4,6,2,8]
shuffle(list)
print("PRE SORT: ", list)
print(quicksort(list, 0, len(list) -1))
print("POST SORT: ", list)

------------------------------------------------------
# use randrange to produce a random index
from random import randrange

def quicksort(list, start, end):
  if start >= end:
    return list
	# Define your pivot variables below
  pivot_idx = randrange(start, end)
  pivot_element = list[pivot_idx]
  
  # Swap the elements in list below
  #Random is great because it protects our algorithm against inefficient runtimes,  but our code will be simplier for the remainder of the algorithm if we know the pivot will always be in the same place. 
  #Swap so we know the pivot element will always be located at the end of the list
  temp = list[end]
  list[end] = list[pivot_idx]
  list[pivot_idx] = temp  

   # Create the lesser_than_pointer
  lesser_than_pointer = start
  
  # Start a for loop, use 'idx' as the variable
  #2. create a for loop that iterates from start to end. This will track our progress through the list we're partitioning
  for idx in range(start, end):
    
    # Check if the value at idx is less than the pivot
    if list[idx] < pivot_element:
      # If so: 
        # 1) swap lesser_than_pointer and idx values
        list[lesser_than_pointer], list[idx] = list[idx], list[lesser_than_pointer]
                
        # 2) increment lesser_than_pointer
        lesser_than_pointer +=1
  
  # After the loop is finished...
  # swap pivot with value at lesser_than_pointer
  list[lesser_than_pointer], list[end] = list[end], list[lesser_than_pointer]

  # Call quicksort on the "left" and "right" sub-lists
  left_sub_list = quicksort(list, start, less_than_pointer -1)
  right_sub_list = quicksort(list, less_than_pointer +1, end)
  
  
  # Leave these lines for testing
  print(list[start])
  start += 1
  return quicksort(list, start, end)


my_list = [32, 22, 35, 24, 76]
print("BEFORE: ", my_list)
sorted_list = quicksort(my_list, 0, len(my_list) - 1)
print("AFTER: ", sorted_list)