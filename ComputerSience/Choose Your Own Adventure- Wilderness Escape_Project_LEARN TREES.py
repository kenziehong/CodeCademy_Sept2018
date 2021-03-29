LEARN TREES
Choose Your Own Adventure: Wilderness Escape
Welcome to Wilderness Escape, an online Choose-Your-Own-Adventure. Our users get a unique story experience by picking the next chapter of their adventure. We use the tree data structure to keep track of the different paths a user may choose. Let's get started!

######
# TREENODE CLASS
print("Once upon a time...")

class TreeNode:
  def __init__(self, story_piece):
    self.story_piece = story_piece
    self.choices = []
    
  def add_child(self, node):
    self.choices.append(node)
  
  #19. add some functionality to our TreeNode class so we can move through the story
  def traverse(self):
    
    #20. this variable will track the current portion of the story
    story_node = self
    print(story_node.story_piece)
    while len(story_node.choices)>0:
      choice = input("Enter 1 or 2 to continue the story: ")
      if choice not in ["1", "2"]:
        print("Your choice is invalid, please enter a valid choice")
      else:
        chosen_index = int(choice)
        chosen_index -=1
        chosen_child = story_node.choices[chosen_index]
        print(chosen_child.story_piece)
        
        #30. our while loop will keep checking story_node to see if there are more choices to be made in our story
        story_node = chosen_child
  
######

######
# VARIABLES FOR TREE
story_root = TreeNode("""
You are in a forest clearing. There is a path to the left.
A bear emerges from the trees and roars!
Do you: 
1 ) Roar back!
2 ) Run to the left...
""")

#14. add a few more pieces of the story
choice_a = TreeNode("""
The bear is startled and runs away.
Do you:
1 ) Shout 'Sorry bear!'
2 ) Yell 'Hooray!'
""")
choice_b = TreeNode("""
You come across a clearing full of flowers. 
The bear follows you and asks 'what gives?'
Do you:
1 ) Gasp 'A talking bear!'
2 ) Explain that the bear scared you.
""")
choice_a_1 = TreeNode("""
The bear returns and tells you it's been a rough week. After making peace with
a talking bear, he shows you the way out of the forest.

YOU HAVE ESCAPED THE WILDERNESS.
""")
choice_a_2 = TreeNode("""
The bear returns and tells you that bullying is not okay before leaving you alone
in the wilderness.

YOU REMAIN LOST.
""")
choice_b_1 = TreeNode("""
The bear is unamused. After smelling the flowers, it turns around and leaves you alone.

YOU REMAIN LOST.
""")
choice_b_2 = TreeNode("""
The bear understands and apologizes for startling you. Your new friend shows you a 
path leading out of the forest.

YOU HAVE ESCAPED THE WILDERNESS.
""")
#16. call add_child() on story_root and pass choice_a as an argument
story_root.add_child(choice_a)
story_root.add_child(choice_b)
#34.
choice_a.add_child(choice_a_1)
choice_a.add_child(choice_a_2)
#38.
choice_b.add_child(choice_b_1)
choice_b.add_child(choice_b_2)
######

######
# TESTING AREA
#print(story_root.story_piece)
story_root.traverse()

######
