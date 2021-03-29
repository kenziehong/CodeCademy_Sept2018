#1.Review

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key, count_collisions=0):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code + count_collisions

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    current_array_value = self.array[array_index]

    if current_array_value is None:
      self.array[array_index] = [key, value]
      return

    if current_array_value[0] == key:
      self.array[array_index] = [key, value]
      return

    # Collision!

    number_collisions = 1

    while(current_array_value[0] != key):
      new_hash_code = self.hash(key, number_collisions)
      new_array_index = self.compressor(new_hash_code)
      current_array_value = self.array[new_array_index]

      if current_array_value is None:
        self.array[new_array_index] = [key, value]
        return

      if current_array_value[0] == key:
        self.array[new_array_index] = [key, value]
        return

      number_collisions += 1

    return

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    possible_return_value = self.array[array_index]

    if possible_return_value is None:
      return None

    if possible_return_value[0] == key:
      return possible_return_value[1]

    retrieval_collisions = 1

    while (possible_return_value != key):
      new_hash_code = self.hash(key, retrieval_collisions)
      retrieving_array_index = self.compressor(new_hash_code)
      possible_return_value = self.array[retrieving_array_index]

      if possible_return_value is None:
        return None

      if possible_return_value[0] == key:
        return possible_return_value[1]

      retrieval_collisions += 1

    return
hash_map = HashMap(15)
hash_map.assign('gabbro', 'igneous')
hash_map.assign('sandstone', 'sedimentary')
hash_map.assign('gneiss', 'metamorphic')

print(hash_map.retrieve("gabbro"))
print(hash_map.retrieve("sandstone"))
print(hash_map.retrieve("gneiss"))

------------------------------------------------------------------------------

#Open Addressing in the Getter

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key, count_collisions=0):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code + count_collisions

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    current_array_value = self.array[array_index]

    if current_array_value is None:
      self.array[array_index] = [key, value]
      return

    if current_array_value[0] == key:
      self.array[array_index] = [key, value]
      return

    # Collision!

    number_collisions = 1

    while(current_array_value[0] != key):
      new_hash_code = self.hash(key, number_collisions)
      new_array_index = self.compressor(new_hash_code)
      current_array_value = self.array[new_array_index]

      if current_array_value is None:
        self.array[new_array_index] = [key, value]
        return

      if current_array_value[0] == key:
        self.array[new_array_index] = [key, value]
        return

      number_collisions += 1

    return

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    possible_return_value = self.array[array_index]

    if possible_return_value is None:
      return None

    if possible_return_value[0] == key:
      return possible_return_value[1]

    #1.In .retrieve() if possible_return_value has a different key than the one we're looking for, we should continue searching. Define a new variable called retrieval_collisions and set it equal to 1.
    retrieval_collisions = 1

    while (possible_return_value != key):
      new_hash_code = self.hash(key, retrieval_collisions)
      retrieving_array_index = self.compressor(new_hash_code)
      possible_return_value = self.array[retrieving_array_index]

      if possible_return_value is None:
        return None

      if possible_return_value[0] == key:
        return possible_return_value[1]

      number_collisions += 1

    return

---------------------------------------------------------

#Open Addressing in the Setter

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key, count_collisions=0):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code + count_collisions

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    current_array_value = self.array[array_index]

    if current_array_value is None:
      self.array[array_index] = [key, value]
      return

    if current_array_value[0] == key:
      self.array[array_index] = [key, value]
      return

    # Collision!
    
		#1.Now that we have a hash function that uses the number of collisions to determine the hash code, we can update where we set a key in the event of a collision. When we notice that the key we're trying to set is different from the key at our hash code's address, create a new variable called number_collisions, set that equal to 1.
    number_collisions = 1
    
    
		#2.After defining number_collisions, create a new while loop that checks if current_array_value[0] != key.
    while(current_array_value[0] != key):
      
      #3.In the while loop, you want to replicate our setting logic while incrementing the number of collisions. Call .hash() with both the key and number_collisions. Save that result into new_hash_code.
      new_hash_code = self.hash(key, number_collisions)
      
      #4.Plug new_hash_code into .compressor(). Save that result into new_array_index.
      new_array_index = self.compressor(new_hash_code)
      current_array_value = self.array[new_array_index]

      if current_array_value is None:
        self.array[new_array_index] = [key, value]
        return

      if current_array_value[0] == key:
        self.array[new_array_index] = [key, value]
        return

      number_collisions += 1

    return

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    possible_return_value = self.array[array_index]

    if possible_return_value is None:
        return None

    if possible_return_value[0] == key:
        return possible_return_value[1]

    # possible_return_value holds different key
    return

---------------------------------------------------------------------
#Open Addressing

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]
    
	#1.Give HashMap.hash() a second parameter: count_collisions. This will be the number of times the .hash() has hit a collision. Have count_collisions default to 0
  def hash(self, key, count_collisions =0):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code + count_collisions

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    current_array_value = self.array[array_index]

    if current_array_value is None:
      self.array[array_index] = [key, value]
      return

    if current_array_value[0] == key:
      self.array[array_index] = [key, value]
      return

    # current_array_value currently holds different key
    return

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    possible_return_value = self.array[array_index]

    if possible_return_value is None:
        return None

    if possible_return_value[0] == key:
        return possible_return_value[1]

    # possible_return_value holds different key
    return

----------------------------------------------------
#Handling Collisions in the Getter

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    current_array_value = self.array[array_index]

    if current_array_value is None:
      self.array[array_index] = [key, value]
      return

    if current_array_value[0] == key:
      self.array[array_index] = [key, value]
      return

    # current_array_value currently holds different key
    return

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    
    #1.In our .retrieve() method, after finding the array index, we want to check to make sure that the index corresponds to the key were looking for. Save the array value at our compressed hash code into possible_return_value
    possible_return_value = self.array[array_index]

    if possible_return_value is None:
        return None

    if possible_return_value[0] == key:
        return possible_return_value[1]

    # possible_return_value holds different key
    return

---------------------------------------------------------------
#Handling Collisions in the Setter

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    
    #1.We're going to overwrite the functionality for .assign(). After finding the array_index, we want to do a check of the content that's currently at self.array[array_index].In order to avoid overwriting the wrong key, check the existing value in the array at self.array[array_index]. Save this into current_array_value
    current_array_value = self.array[array_index]
    
    #2.There are three possibilities for current_array_value:It has the same key as key.It has a different key than key.It's None.If current_array_value already has contents, check if the saved key is different from the key we are currently processing. If the keys are the same, overwrite the array value. If the keys are different, were going to implement a way to find the next array index where our key should go. We'll get to handling different keys later.

    if current_array_value is None:
      self.array[array_index] = [key, value]
      return

    if current_array_value[0] == key:
      self.array[array_index] = [key, value]
      return

    # current_array_value currently holds different key
    return

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    return self.array[array_index]

------------------------------------------------------------
#Creating an Instance

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    self.array[array_index] = value

  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    return self.array[array_index]

  #1.Outside the HashMap class (completely unindented below the class definition) create a new hash map called hash_map. Give it an array size of 20.
hash_map = HashMap(20)
hash_map.assign("gneissa", "metamorphic")
print(hash_map.retrieve("gneissa"))
print(hash_map.hash("gneissa"))
print(hash_map.compressor(hash_map.hash("gneissa")))
  
---------------------------------------------------------------------

#Defining the Getter

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code

  def compressor(self, hash_code):
    return hash_code % self.array_size

  def assign(self, key, value):
    array_index = self.compressor(self.hash(key))
    self.array[array_index] = value
    
  #1.Define a .retrieve()method for HashMap. It should take two parameters: self and key
  def retrieve(self, key):
    array_index = self.compressor(self.hash(key))
    return self.array[array_index]
  
-------------------------------------------------------------------

#Defining the Setter

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code

  def compressor(self, hash_code):
    return hash_code % self.array_size
  
  #1.Create a .assign() method for the hash map. It should take three parameters: self, key, and value
  def assign(self, key, value):
    
    #2.Save the value (just the value for now) to the maps array at the index determined by plugging the key into the .hash() method and plugging the hash code into the .compressor() method.
    self.array = value
    index = self.compressor(self.hash(key))
    
----------------------------------------------------------

#Creating the Compression Function

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]

  def hash(self, key):
    key_bytes = key.encode()
    hash_code = sum(key_bytes)
    return hash_code
  
  #1. Create a .compressor() method for your hash map. It should take two parameters: self and hash_code.
  def compressor(self, hash_code):
    
    #2.Take the modulus of the hash code by the maps array_size in order to reduce the hash code to a possibe index for the array. Return the modulus.
    return hash_code % self.array_size 

-------------------------------------------------------

#Creating the Hashing Function

class HashMap:
  def __init__(self, array_size):
    self.array_size = array_size
    self.array = [None for item in range(array_size)]
    
  #1. Create a method for HashMap called .hash(). This method should take two arguments: self and key
  def hash(self, key):
    
    #2. Turn the key into a list of bytes by calling key.encode(). Save this into a variable called key_bytes. .encode() is a string method that converts a string into its corresponding bytes, a list-like object with the numerical representation of each character in the string.
    self.key_bytes = key.encode()
    
    #3.Turn the bytes object into a hash code by calling sum() on key_bytes. Save the result from that into a variable called hash_code
    self.hash_code = sum(key_bytes)
    return hash_code
    
-----------------------------------------------------
#Creating the Hash Map Class

class HashMap:
  
  #1. Give HashMap a constructor which takes both self and array_size as parameters. array_size should be assigned to an instance variable of the same name (.array_size), and represents the size of the array.
  def __init__(self, array_size):
    self.array_size = array_size
    
    #3.Create an instance variable called .array, which is a list of size array_size. Make each element of .array equal to None. You can use a list comprehension to create a list of array_size
    self.array = [None for i in range(self.array_size)]          
