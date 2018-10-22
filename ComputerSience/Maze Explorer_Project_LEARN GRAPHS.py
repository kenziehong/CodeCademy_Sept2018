LEARN GRAPHS
Maze Explorer
Welcome Ancient Ruins Explorer!

We've identified a mysterious chamber deep underground our excavation site. The artifacts held within this chamber would be a considerable addition to the local museum...

Unfortunately, the chamber lies at the heart of a twisted maze. We're using a graph data structure to model the ruins. We'll need your expertise to map out the chambers as we move through them.

With your help, we'll find the optimal path to the chamber before our torch burns out.

-------------------------------------
#script.py

# import classes
from graph import Graph, build_graph
from vertex import Vertex

#1. make an excavation_site varibale and assign it to the build_graph function (NoneType object has no attribute explore if not return graph in function)excavation_site = build_graph()
excavation_site = build_graph()

#20.
excavation_site.explore()


------------------------------------
# vertex.py

class Vertex:
  def __init__(self, value):
    self.value = value
    self.edges = {}

  def add_edge(self, adjacent_value, weight = 0):
    self.edges[adjacent_value] = weight

  def get_edges(self):
    return self.edges.keys()

---------------------------------------

#graph.py

from vertex import Vertex

class Graph:
  def __init__(self):
    self.graph_dict = {}

  def add_vertex(self, node):
    self.graph_dict[node.value] = node

  def add_edge(self, from_node, to_node, weight = 0):
    self.graph_dict[from_node.value].add_edge(to_node.value, weight)
    self.graph_dict[to_node.value].add_edge(from_node.value, weight)

  def explore(self):
    print("Exploring the graph....\n")
    #FILL IN EXPLORE METHOD BELOW
    #17. how to get to treasure_room from entrance? this method to help you out. create a variable called current_room and set it equal to "entrance". Next, create a variable called path_total and set it equal to 0
    current_room = "entrance"
    path_total = 0
    print("\nStarting off at the {}\n".format(current_room))
    
    #21. We want to keep navigating the maze until we find the "treasure room". Make a while loop that checks if the current_room is NOT equal to "treasur room". In the while loop, we first want to retrieve all the data of the current_room. 
    # Create a variable call node and set it equal to the values corresponding to the current_room in the graph dictionary
    while current_room != "treasure room":
      node = self.graph_dict[current_room]
           
      #23. After entering a room, we want to check the adjacent rooms. Create a for loop that iterates through the items of the node's edges and retrieves each connected_room and weight
      for connected_room, weight in node.edges.items():
        
        #. 24. In this for loop, we will show the user all the choices of rooms they can move to and their respective costs. 
        key = connected_room[0]
        print("enter {0} for {1}: {2} cost".format(key, connected_room, weight))
      
      #26. we want to now gather the user's input. Create a variable called valid_choices and set it equal to a list of all the first letters of the keys of the node's edges. Try using a list comprehension.
      valid_choices = [room[0] for room in node.edges.keys()]
      print("\nYou have accumulated: {0} cost".format(path_total))
      
      #28. Now, we want to see what room the user wants to move to.
      choice = input("\nWhich room do you move to? ")
      if choice not in valid_choices:
        print("please select from these letters: {}".format(valid_choices))
      else:
        
        #31. create a for loop that iterates through the keys of the node's edges and retrieves each room
        for room in node.edges.keys():
          
          #32. checks if the first letter of the room is the user's choice
          if room.startswith(choice):
            current_room = room
            path_total += node.edges[room]
        
        #35. Outside the for loop, but still within the else clause, print the following:
        print("\n*** You have chosen: {0} ***\n".format(current_room))
      
      #37.outside the while loop, print the following: 
      print("Made it to the treasure room with {0} cost".format(path_total))
          
 
      
  
  def print_map(self):
    print("\nMAZE LAYOUT\n")
    for node_key in self.graph_dict:
      print("{0} connected to...".format(node_key))
      node = self.graph_dict[node_key]
      for adjacent_node, weight in node.edges.items():
        print("=> {0}: cost is {1}".format(adjacent_node, weight))
      print("")
    print("")

def build_graph():
  graph = Graph()
  
  # MAKE ROOMS INTO VERTICES BELOW...
  #3. make vertices for each room in the maze. We know there's an entrance, make a variable and set it to an instance of Vertex with argument
  entrance = Vertex("entrance")
  ante_chamber = Vertex("ante-chamber")
  kings_room = Vertex("king's room")
  grand_gallery = Vertex("grand gallery")
  treasure_room = Vertex("treasure room")
  


  # ADD ROOMS TO GRAPH BELOW...
  #4. add it to our graph by using method add.vertex()
  graph.add_vertex(entrance)
  graph.add_vertex(ante_chamber)
  graph.add_vertex(kings_room)
  graph.add_vertex(grand_gallery)
  graph.add_vertex(treasure_room)
  
  
  

  # ADD EDGES BETWEEN ROOMS BELOW...
  #9. each room is a vertex. If we can travel from one to another, that means an edge exist!. use add_edge method to set up these connections
  graph.add_edge(entrance, ante_chamber, 7)
  graph.add_edge(entrance, kings_room, 3)
  graph.add_edge(kings_room, ante_chamber, 1)
  graph.add_edge(grand_gallery, ante_chamber, 2)
  graph.add_edge(grand_gallery, kings_room, 2)
  graph.add_edge(treasure_room, ante_chamber, 6)
  graph.add_edge(treasure_room, grand_gallery, 4)

  # DON'T CHANGE THIS CODE
  graph.print_map()
  return graph


