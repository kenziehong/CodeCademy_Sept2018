LEARN PYTHON: DICTIONARIES
Scrabble
In this project, you will process some data from a group of friends playing scrabble. You will use dictionaries to organize players, words, and points.

There are many ways you can extend this project on your own if you finish and want to get more practice!
-------------------------------

letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
points = [1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 4, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10]

#1. We have provided you with two lists, letters and points. We would like to combine these two into a dictionary that would map a letter to its point value. Using a list comprehension and zip, create a dictionary called letter_to_points that has the elements of letters as the keys and the elements of points as the values.
letter_to_points = {key: value for key, value in zip(letters, points)}
print(letter_to_points)
test=zip(letters, points)
print(list(test))

#2. Our letters list did not take into account blank tiles. Add an element to the letter_to_points dictionary that has a key of " " and a point value of 0 
# my_dict[key_to_add] = value_of_key
letter_to_points[" "] = 0

#3. We want to create a function that will take in a word and return how many points that word is worth. Define a function called score_word that takes in a parameter word
def score_word(word):
  
  #4. Inside score_word, create a variable called point_total and set it to 0
  point_total = 0
  
  #5.After defining point_total, create a for loop that goes through the letters in word and adds the point value of each letter to point_total. You should get the point value from the letter_to_points dictionary. If the letter you are checking for is not in letter_to_points, add 0 to the point_total
  upper_word = word.upper()
  for element in upper_word:
    #if element in letter_to_points:
      #point_total += letter_to_points[element]
    #else:
      #point_total +=0
     
    point_total += letter_to_points.get(element,0) 
  return point_total

brownie_points = score_word("BROWNIE")
print(brownie_points)

#Score a Game

#9. Create a dictionary called player_to_words that maps players to a list of the words they have played. This table represents the data to transcribe into your dictionary:
player_to_words = {
  "player1": ["BLUE", "TENNIS", "EXIT"],
  "wordNerd": ["EARTH", "EYES", "MACHINE"],
  "Lexi Con": ["ERASER", "BELLA", "HUSKY"],
  "Prof Reader": ["ZAP", "COMA", "PERIOD"]
}

#15. If you want extended practice, try to implement some of these ideas with the Python you've learned:
# *play_word() — a function that would take in a player and a word, and add that word to the list of words they've played
# *update_point_totals() — turn your nested loops into a function that you can call any time a word is played
# *make your letter_to_points dictionary able to handle lowercase inputs as well
def play_word(player,word):
  letter_to_points = word.upper()
  player_to_words[player].append(letter_to_points)
play_word("player1","blue") 

player_to_points = {}

#11. Iterate through the items in player_to_words. Call each player player and each list of words words. Within your loop, create a variable called player_points and set it to 0.
for key,value in player_to_words.items():
  player_points = 0
  
  #12. Within the loop, create another loop that goes through each word in words and adds the value of score_word() with word as an input.
  for element in value:
    player_points +=score_word(element)
    
  #13.After the inner loop ends, set the current player value to be a key of player_to_points, with a value of player_points
  #To set a key:value pair in a dictionary, use the syntax: my_dict[key_to_add] = value_to_add
  player_to_points[key] = player_points 
  
#14.  
print(player_to_points)  

# str, 'int' object has no attribute 'append'
#hong ={"a": 5}
#hong["a"].append("hoa") 
#print(hong)


  
  
    
    
  

