def sparse_search(data, search_val):
  print("Data: " + str(data))
  print("Search Value: " + str(search_val))
  
  #1.Create two variables, first and last, and set them equal to the first and last positions in the dataset.
  first = 0
  last = len(data)-1
  
  #2. Next, we will keep iterating until we find our search value. Create a while loop that checks if first is less than or equal to last
  while first <= last:
    
    #3.Within the while loop, create a variable called mid and set it to the average of first and last
    mid = (first + last)//2   
    
    #4.Now, we will check if the middle is empty. If so, we will search surrounding values. In the while loop, create an if statement that checks the following: mid of the data is empty
    if not data[mid]:
      
      #5. Now, we will check the surrounding values.Within the if statement, do the following: #Create a variable, left, and set it equal to the position directly left of the mid.
#Create a variable, right, and set it equal to the position directly right of the mid
      left = mid - 1
      right = mid + 1   
    
    #6 .Within the if statement, create a while(True) loop. In this loop, we will be checking if the surrounding values are empty and will break once we find a non-empty value.
      while(True):
        
        #7.First, we will check if we have iterated through the entire dataset and have not found a non-empty value.
        #In the new inner while loop, check if both of the following conditions are met:left is less than first, right is greater than last.If so, do the following:Print the statement: "{0} is not in the dataset". {0} corresponds to the search_val. return from the function        
        if left < first and right > last:
          print("{0} is not in the dataset".format(search_val))
          return
        
        #9.Now, we will check the value to the right.right is the less than or equal to last data[right] is not empty. If so, do the following: Set mid equal to right, break out of the inner while loop
        elif right <=last and data[right]:
          mid = right
          break
        elif left >=first and data[left]:
          mid = left
          break
          
        #11. If none of the statements are true, then we will move our pointers. In the inner while loop, after the conditional statements, do the following: Increment right by 1, Decrement left by 1
        right +=1
        left -=1
    
    #12. Now that we handled the empty data, let's continue with regular binary search. We will first check if the middle of the data is equal to our search value.
    #Outside the inner while loop and below its encompassing if statement, check if the following is true:mid of the data is equal to the search_val. If so, do the following: Print the statement: "{0} found at position {1}". {0} corresponds to the search_val and {1} corresponds to the mid, return from the function.
    if data[mid] == search_val:
      print("{0} found at position {1}".format(search_val, mid))
      return
    if search_val < data[mid]:
      last = mid - 1
    if search_val > data[mid]:
      first = mid + 1
  
  print("{0} is not in the dataset".format(search_val))
      
        