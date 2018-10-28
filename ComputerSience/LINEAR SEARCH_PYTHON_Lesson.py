# define your linear_search() below...
#1. declare a function called ...in Python with 2 parameters
def linear_search(search_list, target_value):
  
  #2. create a for loop that iterates over the list
  for index in range(len(search_list)):
    #print(search_list[index])
    if search_list[index] == target_value:
      return index
  #4. if it is not in the list  
  raise ValueError("{} not in list".format(target_value))  


# uncomment the lines below to test...
values = [54, 22, 46, 99]
print(linear_search(values, 22))

----------------------------------------------------------


number_list = [ 10, 14, 19, 26, 27, 31, 33, 35, 42, 44]
target_number = 100

def linear_search(search_list, target_value):
  for idx in range(len(search_list)):
    if search_list[idx] == target_value:
      return idx
  raise ValueError("{0} not in list".format(target_value))



try:
  # Call the function below...
  result = linear_search(number_list, target_number)
  print(result)

except ValueError as error_message:
  print("{0}".format(error_message))

--------------------------------------------------

# Search list and target value
tour_locations = [ "New York City", "Los Angeles", "Bangkok", "Istanbul", "London", "New York City", "Toronto"]
target_city = "New York City"

#Linear Search Algorithm
def linear_search(search_list, target_value):
  
  #2. declare a variable which can save every matching occurence  
  matches = []
  for idx in range(len(search_list)):
    if search_list[idx] == target_value:
      #return idx
      matches.append(idx)
  
  #4. rewrite the code
  if len(matches)>0:
    return matches
  raise ValueError("{0} not in list".format(target_value))

#Function call
tour_stops = linear_search(tour_locations, target_city)
print(tour_stops)

---------------------------------------------------------------

# Search list
test_scores = [88, 93, 75, 100, 80, 67, 71, 92, 90, 83]

#Linear Search Algorithm
#1. change the function to find the largest value
def linear_search(search_list):
  
  #2. create a variable which will track the highest value visited during the search
  maximum_score_index = None
  for idx in range(len(search_list)):
    if not maximum_score_index or search_list[idx] > search_list[maximum_score_index]:
      
      #3. update the maximum_score_index
      maximum_score_index = idx
  return maximum_score_index

# Function call
highest_score = linear_search(test_scores)

#Prints out the highest score in the list
print(highest_score)


---------------------------------------------------

# A list of the ingredients for tuna sushi
recipe = ["nori", "tuna", "soy sauce", "sushi rice"]
target_ingredient = "avocado"

def linear_search(search_list, target_value):
  for idx in range(len(search_list)):
    if search_list[idx] == target_value:
      return idx
  raise ValueError("{0} not in list".format(target_value))

print(linear_search(recipe, target_ingredient))