# define binary_search()
#1. define a function which takes 2 parameters
def binary_search(sorted_list, target):
  if len(sorted_list) == 0:
    return "value not found"
  #2. set up our recursive steps. Declare two variable
  mid_idx = len(sorted_list)//2
  mid_val = sorted_list[mid_idx]
  return mid_idx, mid_val

# For testing:
sorted_values = [13, 14, 15, 16, 17]
print(binary_search([], 42))
print(binary_search(sorted_values, 42))

----------------------------------------------------

# define binary_search()
def binary_search(sorted_list, target):
  if not sorted_list:
    return 'value not found'
  mid_idx = len(sorted_list)//2
  mid_val = sorted_list[mid_idx]
  
  if mid_val == target:
    return mid_idx


# For testing:
sorted_values = [13, 14, 15, 16, 17]
print(binary_search([], 42))
print(binary_search(sorted_values, 42))
print(binary_search(sorted_values, 15))

---------------------------------------------

# define binary_search()
def binary_search(sorted_list, target):
  if not sorted_list:
    return 'value not found'
  mid_idx = len(sorted_list)//2
  mid_val = sorted_list[mid_idx]
  
    #check for whether mid_val == target
  if mid_val == target:
    return mid_idx
  
    #check whether the middle value is greater than the target
  if mid_val > target:
    left_half = sorted_list[:mid_idx]
    
        #return a recursive call to binary_search() given left_half and target as arguments. We know we can disgard every element at an index greater than mid_idx
    return binary_search(left_half, target)
  
  if mid_val < target:
    right_half = sorted_list[mid_idx+1:]
    
        #3. we're storing this in a variable to make a smaller copy of the sorted list each recursive call, so our indices for the same values change: We can count for the missing indices by returning the result plus the index segments of the lists we've discarded
    result = binary_search(right_half, target)
    if result == "value not found":
      return result
    else:
      return result + mid_idx + 1
# For testing:
sorted_values = [13, 14, 15, 16, 17]
print(binary_search(sorted_values, 16))


----------------------------------------------------

def binary_search(sorted_list, left_pointer, right_pointer, target):
  # this condition indicates we've reached an empty "sub-list"
  if left_pointer >= right_pointer:
    return "value not found"
	
  # We calculate the middle index from the pointers now
  mid_idx = (left_pointer + right_pointer) // 2
  mid_val = sorted_list[mid_idx]

  if mid_val == target:
    return mid_idx
  if mid_val > target:
    # we reduce the sub-list by passing in a new right_pointer
    return binary_search(sorted_list, left_pointer, mid_idx, target)
  if mid_val < target:
    # we reduce the sub-list by passing in a new left_pointer
    return binary_search(sorted_list, mid_idx + 1, right_pointer, target)
  
values = [77, 80, 102, 123, 288, 300, 540]
start_of_values = 0
end_of_values = len(values)
result = binary_search(values, start_of_values, end_of_values, 288)

print("element {0} is located at index {1}".format(288, result))

------------------------------------------------------------
BINARY SEARCH: PYTHON
Iterative Binary Search

def binary_search(sorted_list, target):
  left_pointer = 0
  right_pointer = len(sorted_list)
  
  # fill in the condition for the while loop
  while left_pointer < right_pointer:
    # calculate the middle index using the two pointers
    mid_idx = (left_pointer + right_pointer) //2
    mid_val = sorted_list[mid_idx]
    if mid_val == target:
      return mid_idx
    if target < mid_val:
      # set the right_pointer to the appropriate value
      right_pointer = mid_idx
    if target > mid_val:
      # set the left_pointer to the appropriate value
      left_pointer = mid_idx + 1
  
  return "Value not in list"

# test cases
print(binary_search([5,6,7,8,9], 9))
print(binary_search([5,6,7,8,9], 10))
print(binary_search([5,6,7,8,9], 8))
print(binary_search([5,6,7,8,9], 4))
print(binary_search([5,6,7,8,9], 6))