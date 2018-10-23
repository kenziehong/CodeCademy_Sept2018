nums = [5, 2, 9, 1, 5, 6]

# Define swap() below:
#1. define a function which has 3 parameters
def swap(arr, index_1, index_2):
  
  #2. create a varibale and assign to it the value located at index_1 of arr
  temp = arr[index_1]
  
  #3. After declaring, set the value at index_1 of arr to be the value at index_2 of arr
  arr[index_1] = arr[index_2]
  arr[index_2] = temp

swap(nums, 3, 5)
print(nums)

# define bubble_sort():
  #1. define a new function which has 1 parameters
def bubble_sort(arr):
  
  #3. One loop through the list is only sufficient to move the largest value to its correct placement. Create another loop which iterates for each element in arr
  #for el in arr:
  for index in range(len(arr)):  
    
     #2. create a for loop that iterates up until the last element of the list. 
    for index in range(len(arr) -1):
      if arr[index] > arr[index +1]:
        #print("Elements are out of order!")
        swap(arr, index, index +1 )
      #else:
        #print("Elements are in order!")  

##### test statements

print("Pre-Sort: {0}".format(nums))      
bubble_sort(nums)
print("Post-Sort: {0}".format(nums))

-----------------------------------------------------------

nums = [9, 8, 8, 6, 5, 8, 3, 2, 1, 5]
print("PRE SORT: {0}".format(nums))

def swap(arr, index_1, index_2):
  temp = arr[index_1]
  arr[index_1] = arr[index_2]
  arr[index_2] = temp

def bubble_sort_unoptimized(arr):
  iteration_count = 0
  for el in arr:
    for index in range(len(arr) - 1):
      iteration_count += 1
      if arr[index] > arr[index + 1]:
        swap(arr, index, index + 1)

  print("PRE-OPTIMIZED ITERATION COUNT: {0}".format(iteration_count))

def bubble_sort(arr):
  iteration_count = 0
  for i in range(len(arr)):
    # iterate through unplaced elements
    for idx in range(len(arr) - i - 1):
      iteration_count += 1
      if arr[idx] > arr[idx + 1]:
        # replacement for swap function
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        
  print("POST-OPTIMIZED ITERATION COUNT: {0}".format(iteration_count))

bubble_sort_unoptimized(nums.copy())
bubble_sort(nums)
print("POST SORT: {0}".format(nums))