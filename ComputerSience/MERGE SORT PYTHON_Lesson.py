#1. define a function called merge_sort(). Give it one parameter
def merge_sort(items):
  
  #2. check the length of items. If it has length one or less, return items
  if len(items)<2:
    return items

  #1. create a variable middle_index which is the index to the middble element in the list
  middle_index = len(items)//2
  
  #2. create another variable called left_split. This should be a list of all elements in the input list starting at the first up but not including the middle_index element
  #left_split = [items[index] for index in range(len(items)) if index < middle_index]
  left_split = items[:middle_index]
  
  #3. create one more variable called right_split which includes all elements in items from middle_index to the end of the list
  right_split = items[middle_index:]
  
  #4. 
  #return middle_index, left_split, right_split

  #1. create 2 variables. left_sorted should be the result of calling merge_sort() recursively on left_split
  # merge_sort() continues to break down an input list until it only has one element 
  # and then it joins that with other single element lists to create sorted 2-element lists. 
  # Then it combines 2-element sorted lists into 4-element sorted lists. 
  # It continues that way until all the items of the lists are sorted!
  left_sorted = merge_sort(left_split)
  right_sorted = merge_sort(right_split)
  
  return merge(left_sorted, right_sorted)
  
#1. define a function which is going to take care of merging our two (sorted) lists together
def merge(left, right):
  
  #2. instantiate a new empty list
  result = []

  #1. create a loop that will continue iterating while both left and right have elements
  while (left and right):
    if left[0] < right[0]:
      result.append(left[0])
      left.pop(0)
    else:
      result.append(right[0])
      right.pop(0)

    #1. above, we've only technically depleted one of our two inputs. so check if there are any element still in left or right
  if left:
    result += left
  if right:
    result += right    
  
  return result  

unordered_list1 = [356, 746, 264, 569, 949, 895, 125, 455]
unordered_list2 = [787, 677, 391, 318, 543, 717, 180, 113, 795, 19, 202, 534, 201, 370, 276, 975, 403, 624, 770, 595, 571, 268, 373]
unordered_list3 = [860, 380, 151, 585, 743, 542, 147, 820, 439, 865, 924, 387]

ordered_list1 = merge_sort(unordered_list1)
ordered_list2 = merge_sort(unordered_list2)
ordered_list3 = merge_sort(unordered_list3)
print (ordered_list1)
print (ordered_list2)
print (ordered_list3)

--------------------------------------------------------------

def merge_sort(items):
  if len(items) <= 1:
    return items

  middle_index = len(items) // 2
  left_split = items[:middle_index]
  right_split = items[middle_index:]

  left_sorted = merge_sort(left_split)
  right_sorted = merge_sort(right_split)
  
  return merge(left_sorted, right_sorted)

def merge(left, right):
  result = []

  while (left and right):
    if left[0] < right[0]:
      result.append(left[0])
      left.pop(0)
    else:
      result.append(right[0])
      right.pop(0)

  if left:
    result += left
  if right:
    result += right

  return result

