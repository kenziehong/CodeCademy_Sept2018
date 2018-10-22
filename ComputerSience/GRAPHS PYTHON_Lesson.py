
#Graph Review
#script.py


from random import randrange
from graph import Graph
from vertex import Vertex

def print_graph(graph):
  for vertex in graph.graph_dict:
    print("")
    print(vertex + " connected to")
    vertex_neighbors = graph.graph_dict[vertex].edges
    if len(vertex_neighbors) == 0:
      print("No edges!")
    for adjacent_vertex in vertex_neighbors:
      print("=> " + adjacent_vertex)


def build_graph(directed):
  g = Graph(directed)
  vertices = []
  for val in ['a', 'b', 'c', 'd', 'e', 'f', 'g']:
    vertex = Vertex(val)
    vertices.append(vertex)
    g.add_vertex(vertex)

  for v in range(len(vertices)):
    v_idx = randrange(0, len(vertices) - 1)
    v1 = vertices[v_idx]
    v_idx = randrange(0, len(vertices) - 1)
    v2 = vertices[v_idx]
    g.add_edge(v1, v2, randrange(1, 10))

  print_graph(g)

build_graph(False)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#vertex.py

class Vertex:
  def __init__(self, value):
    self.value = value
    self.edges = {}

  def add_edge(self, vertex, weight = 0):
    self.edges[vertex] = weight

  def get_edges(self):
    return list(self.edges.keys())

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#graph.py

class Graph:
  def __init__(self, directed = False):
    self.graph_dict = {}
    self.directed = directed

  def add_vertex(self, vertex):
    self.graph_dict[vertex.value] = vertex

  def add_edge(self, from_vertex, to_vertex, weight = 0):
    self.graph_dict[from_vertex.value].add_edge(to_vertex.value, weight)
    if not self.directed:
      self.graph_dict[to_vertex.value].add_edge(from_vertex.value, weight)

  def find_path(self, start_vertex, end_vertex):
    start = [start_vertex]
    seen = {}
    while len(start) > 0:
      current_vertex = start.pop(0)
      seen[current_vertex] = True
      print("Visiting " + current_vertex)
      if current_vertex == end_vertex:
        return True
      else:
        vertices_to_visit = set(self.graph_dict[current_vertex].edges.keys())
        start += [vertex for vertex in vertices_to_visit if vertex not in seen]
    return False

---------------------------------------------------------------------------
#Refactoring Path-Finding

# script.py
from graph import Graph
from vertex import Vertex

railway = Graph()

callan = Vertex('callan')
peel = Vertex('peel')
ulfstead = Vertex('ulfstead')
harwick = Vertex('harwick')

railway.add_vertex(callan)
railway.add_vertex(peel)
railway.add_vertex(harwick)
railway.add_vertex(ulfstead)

railway.add_edge(peel, harwick)
railway.add_edge(harwick, callan)
railway.add_edge(callan, peel)

# Uncomment the code below when you're done refactoring!

peel_to_ulfstead_path_exists = railway.find_path('peel', 'ulfstead')
harwick_to_peel_path_exists = railway.find_path('harwick', 'peel')

print("A path exists between peel and ulfstead:")
print(peel_to_ulfstead_path_exists)
print("A path exists between harwick and peel:")
print(harwick_to_peel_path_exists)


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#vertex.py

class Vertex:
  def __init__(self, value):
    self.value = value
    self.edges = {}

  def add_edge(self, vertex, weight = 0):
    self.edges[vertex] = weight

  def get_edges(self):
    return list(self.edges.keys())

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
#graph.py

class Graph:
  def __init__(self, directed = False):
    self.graph_dict = {}
    self.directed = directed

  def add_vertex(self, vertex):
    self.graph_dict[vertex.value] = vertex

  def add_edge(self, from_vertex, to_vertex, weight = 0):
    self.graph_dict[from_vertex.value].add_edge(to_vertex.value, weight)
    if not self.directed:
      self.graph_dict[to_vertex.value].add_edge(from_vertex.value, weight)

  def find_path(self, start_vertex, end_vertex):
    start = [start_vertex]
    # Checkpoint 1, replace these comments:
    # Use a dictionary to track which
    # vertices we've already visited
    seen = {}
    while len(start) > 0:
      current_vertex = start.pop(0)
      # Checkpoint 2, replace these comments:
      # Update the `seen` variable
      # now that we've visited current_vertex
      seen[current_vertex] = True
      print("Visiting " + current_vertex)
      if current_vertex == end_vertex:
        return True
      else:
        vertex = self.graph_dict[current_vertex]
        next_vertices = vertex.get_edges()
        
        # Filter next_vertices so it only
        # includes vertices NOT IN seen
        
        # Checkpoint 3, uncomment and replace the question marks:
        next_vertices = [vertex for vertex in next_vertices if vertex not in seen]
        start.extend(next_vertices)
        
    return False

------------------------------------------------------------------

#Finding a Path II
#script.py

from graph import Graph
from vertex import Vertex

no_path_exists = True


directed_railway = Graph(True)

callan_station = Vertex('callan')
peel_station = Vertex('peel')
ulfstead_station = Vertex('ulfstead')
harwick_station = Vertex('harwick')

directed_railway.add_vertex(callan_station)
directed_railway.add_vertex(peel_station)
directed_railway.add_vertex(harwick_station)
directed_railway.add_vertex(ulfstead_station)

directed_railway.add_edge(harwick_station, peel_station)
directed_railway.add_edge(peel_station, callan_station)


path_exists = directed_railway.find_path('harwick', 'harwick')
print(path_exists)

#Uncomment for final checkpoint

print("\n\n\nFinding path from harwick to callan\n")
new_path_exists = directed_railway.find_path('harwick', 'callan')
print(new_path_exists)
print("\n\nTrying to find path from harwick to ulfstead\n")
no_path_exists = directed_railway.find_path('harwick', 'ulfstead')
print(no_path_exists)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# vertex.py

class Vertex:
  def __init__(self, value):
    self.value = value
    self.edges = {}

  def add_edge(self, vertex, weight = 0):
    self.edges[vertex] = weight

  def get_edges(self):
    return list(self.edges.keys())
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# graph.py

class Graph:
  def __init__(self, directed = False):
    self.graph_dict = {}
    self.directed = directed

  def add_vertex(self, vertex):
    self.graph_dict[vertex.value] = vertex

  def add_edge(self, from_vertex, to_vertex, weight = 0):
    self.graph_dict[from_vertex.value].add_edge(to_vertex.value, weight)
    if not self.directed:
      self.graph_dict[to_vertex.value].add_edge(from_vertex.value, weight)

  def find_path(self, start_vertex, end_vertex):
    start = [start_vertex]
    while len(start) > 0:
      current_vertex = start.pop(0)
      print("Visiting " + current_vertex)
      #START CODE HERE
     #1. check current_vertex against the given argument end_vertex. if it matchs, then you've found a path and can return True
      if current_vertex == end_vertex:
        return True
      else:
        vertex = self.graph_dict[current_vertex]
        next_vertices = vertex.get_edges()
        start += next_vertices
    return False    
---------------------------------------------------------------------

#Finding a Path I

# script.py

from graph import Graph
from vertex import Vertex

undirected_railway = Graph()

callan_station = Vertex('callan')
peel_station = Vertex('peel')
ulfstead_station = Vertex('ulfstead')
harwick_station = Vertex('harwick')

undirected_railway.add_vertex(callan_station)
undirected_railway.add_vertex(peel_station)
undirected_railway.add_vertex(harwick_station)
undirected_railway.add_vertex(ulfstead_station)

undirected_railway.add_edge(peel_station, harwick_station)
undirected_railway.add_edge(peel_station, callan_station)


undirected_railway.find_path('harwick', 'callan')

@@@@@@@@@@@@@@@@@@@@@@@@@@222

# vertex.py

class Vertex:
  def __init__(self, value):
    self.value = value
    self.edges = {}

  def add_edge(self, vertex, weight = 0):
    self.edges[vertex] = weight

  def get_edges(self):
    return list(self.edges.keys())

@@@@@@@@@@@@@@@@@@@@@@@@@@222

#graph.py

class Graph:
  def __init__(self, directed = False):
    self.graph_dict = {}
    self.directed = directed

  def add_vertex(self, vertex):
    self.graph_dict[vertex.value] = vertex

  def add_edge(self, from_vertex, to_vertex, weight = 0):
    self.graph_dict[from_vertex.value].add_edge(to_vertex.value, weight)
    if not self.directed:
      self.graph_dict[to_vertex.value].add_edge(from_vertex.value, weight)
      
#1. define a method
  def find_path(self, start_vertex, end_vertex):
    print("you are searching from start_vertex {} to end_vertex {}".format(start_vertex, end_vertex))
    
    #2. declare a variable and assign it to a list containing start_vertex. We'll use this list to keep track of the vertices as we search
    start = [start_vertex]
    
    #3. make a while loop that runs as long as start has elements inside the list. Inside the loop, declare a variable and set it equal to the first element in start. You should remove that element from start or the loop won't terminate
    while len(start)>0:
      current_vertex = start.pop(0)
      print(current_vertex)

---------------------------------------------------

#Adding Weight

#Building the Graph II

#graph.py

class Graph:
  def __init__(self, directed = False):
    self.graph_dict = {}
    self.directed = directed

  def add_vertex(self, vertex):
    self.graph_dict[vertex.value] = vertex
    
 #1. define a method which takes self, from_vertex and to_vertex as arguments
  def add_edge(self, from_vertex, to_vertex):
    print("Adding edge from_vertex.value {} to to_vertex.value {}".format(from_vertex.value, to_vertex.value))
    
    #2. key into self.graph_dict with from_vertex.value and pass to_vertex.value as an argument
    self.graph_dict[from_vertex.value].add_edge(to_vertex.value)
    #3. if the graph is not directed, do the following: 
    if self.directed == False: # if not  self.directed
      self.graph_dict[to_vertex.value].add_edge(from_vertex.value)
 
    
    
-------------------------------------------------------------------------
#Import Interlude

#script.py

#import Vertex below....
from vertex import Vertex 
#import Graph below...
from graph import Graph 
#Make the Graph instance here #2. and assign it to the variable railway
railway = Graph()

#Make the Vertex instance here
station = Vertex("Ballahoo")


#Call .add_vertex() here on railway and pass station as the argument
railway.add_vertex(station)


-------------------------------------------------------------------------
#Building the Graph I

#graph.py

# Bring in the Vertex class from vertex.py
from vertex import Vertex


# Define Graph below...
#1. define a class
class Graph():
  def __init__(self, directed = False):
    
    # set directed as a property on self and set self.graph_dict to be an empty dictionary
    self.directed = directed
    self.graph_dict = {}
    
  #2. define a method
  def add_vertex(self, vertex):
    print("Adding " + vertex.value)
    
    #after printing, modify self.graph_dict so it has a key of the vertex's value poiting to the vertex itself
    self.graph_dict[vertex.value] = vertex
    
grand_central = Vertex("Grand Central Station")

# Uncomment this code after you've defined Graph
railway = Graph()

# Uncomment these lines after you've completed .add_vertex()
print(railway.graph_dict)
railway.add_vertex(grand_central)
print(railway.graph_dict)


------------------------------------------------------------
#Building the Vertex II

#script.py

class Vertex:
  def __init__(self, value):
    self.value = value
    self.edges = {}

  # define .add_edge() here
  
  #1. define the method that takes self, vertex argument-it will be the value of another instance of Vertex
  def add_edge(self, vertex):
    print("Adding edge to " + vertex)
    
    #2. use the vertex as a key within self.edges and set it to True -- add value to key in dictionary
    self.edges[vertex] = True

  def get_edges(self):
    return list(self.edges.keys())

  
grand_central = Vertex('Grand Central Station')
forty_second_street = Vertex('42nd Street Station')

print(grand_central.get_edges()) #return list of key

# call .add_edge() below here
#3. use .add_edge() to assign forty_second_street.value as an edge of grand_central
grand_central.add_edge(forty_second_street.value)


print(grand_central.get_edges()) 


------------------------------------------------------
#Building the Vertex

# script
#1. define a class Vertex
class Vertex:
  def __init__(self, value):    
    self.value = value
    self.edges = {}
    
 #2. define a method, return a list of keys in self.edges dictionary
  def get_edges(self):
    return list(self.edges.keys())
  
#3. make an instance of Vertex with the argument "Cronk" and assign it to the variable station
station = Vertex("Cronk")

  
------------------------------------------------------------------------

#Introduction to Graphs

