# RADIX SORT: PYTHON
# Review (and Bug Fix!)

def radix_sort(to_be_sorted):
  maximum_value = max(to_be_sorted)
  max_exponent = len(str(maximum_value))
  being_sorted = to_be_sorted[:]

  for exponent in range(max_exponent):
    position = exponent + 1
    index = -position

    digits = [[] for i in range(10)]

    for number in being_sorted:
      number_as_a_string = str(number)
      try:
        digit = number_as_a_string[index]
        digit = int(digit)
      except IndexError:
        digit = 0

      digits[digit].append(number)

    being_sorted = []
    for numeral in digits:
      being_sorted.extend(numeral)

  return being_sorted

unsorted_list = [830, 921, 163, 373, 961, 559, 89, 199, 535, 959, 40, 641, 355, 689, 621, 183, 182, 524, 1]

print(radix_sort(unsorted_list))


--------------------------------------------
#1. define a function which takes 1 parameter
def radix_sort(to_be_sorted):

	#2. declare 2 new variables and assign it to
	  maximum_value = max(to_be_sorted)
	  max_exponent = len(str(maximum_value))
	  #return max_exponent

	  # create copy of to_be_sorted here
	  # 1.We dont want anyone out there to have to deal with the surprise of having their precious list of integers mangled. So create a copy
	  being_sorted = to_be_sorted[:]

	  # Add new for-loop here:
	  #1. 
	  for exponent in range(max_exponent):
	    #3. create a variable which keeps track of what exponent we're looking at
	    position = exponent + 1
	    
	    #4. using index into each number. This index is going to be roughly the same as position, but since we're going to be indexing the string in reverse it needs to be negative!
	    index = - position
	  
		#2. create a list of ten empty lists and assign the result to a variable called digits
		digits = [[] for i in range(10)]
		#return digits

		  # create for loop here:
		  #1. need to iterate over being_sorted. Grab each value of being_sorted and save it as the temporary variable number. Convert it to a string
		for number in being_sorted:
		number_as_a_string = str(number)

			#2. take a last element in string by using a negative index. 
			#digit = number_as_a_string[-1]

			#5. update, get the digit at the given index
			digit = number_as_a_string[index]

			#3. Using digit as an list index for digits
			digit = int(digit)

			#4. add our number to a corresponding list
			digits[digit].append(number)

			#6. break out of the for loop and return
			#return digits


			# reassign being_sorted here:
			#1. Since we know that all of our input numbers are in digits we can safely clear out being_sorte
			being_sorted = []

		#2. create a for loop that iterates through each of our lists in digits. Call each of these lists numberal because they each correspond to one specific numberal from 0 to 9
		for numeral in digits:

			#3. use the extend() method to appends all the elements of a list to add the elements of numeral to being_sorted
			being_sorted.extend(numeral)

		#4.Unindent out of the for loop and return being_sorted


	return being_sorted
	  

	    

