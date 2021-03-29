#Making the Menus
#1. define a class
class Menu:
  
  #2. give it a constructor with the six parameters
  def __init__(self, name, items, start_time, end_time):
    self.name = name
    self.items = items
    self.start_time = start_time
    self.end_time = end_time
    
  #7. give it a string representation method
  def __repr__(self):
    #return '%s menu available from %sam to %spm' % (self.name, self.start_time, self.end_time)
    return self.name +" menu available from " + str(self.start_time) +"-" +str(self.end_time)
  
  #9. 
  def calculate_bill(self, purchased_items):
    bill = 0
    
    for item in purchased_items:
      if item in self.items:
        bill += self.items[item]   
    
    return bill
    
#3. create a Menu object and save it into the variable bruch
brunch = Menu("brunch", {
  'pancakes': 7.50, 'waffles': 9.00, 'burger': 11.00, 'home fries': 4.50, 'coffee': 1.50, 'espresso': 3.00, 'tea': 1.00, 'mimosa': 10.50, 'orange juice': 3.50
}, 11, 16)

early_bird = Menu("early_bird", {
  'salumeria plate': 8.00, 'salad and breadsticks (serves 2, no refills)': 14.00, 'pizza with quattro formaggi': 9.00, 'duck ragu': 17.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 1.50, 'espresso': 3.00,
}, 15, 18)

dinner = Menu("dinner", {
  'crostini with eggplant caponata': 13.00, 'ceaser salad': 16.00, 'pizza with quattro formaggi': 11.00, 'duck ragu': 19.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 2.00, 'espresso': 3.00,
}, 17, 23)

kids = Menu("kids", {
  'chicken nuggets': 6.50, 'fusilli with wild mushrooms': 12.00, 'apple juice': 3.00
}, 11, 21)

#print(brunch.calculate_bill(['pancakes', 'home fries', 'coffee']))    

#print(early_bird.calculate_bill(['salumeria plate', 'mushroom ravioli (vegan)']))

#Creating the Franchises

class Franchise:
  def __init__(self, address, menus):
    self.address = address
    self.menus = menus
  def __repr__(self):
    return self.address
  def availabel_menus(self, time):
    available_menus =[]
    
    for menu in self.menus:
      if menu.start_time <= time <= menu.end_time:
         available_menus.append(menu)
    
    return available_menus
 
#14.create object
menus = [dinner, kids, brunch, early_bird]

flagship_store = Franchise("1232 West End Road", menus)
new_installment = Franchise("12 East Mulberry Street", menus)

print(flagship_store)
print(flagship_store.availabel_menus(20))
print("\n")
print(new_installment)
print(new_installment.availabel_menus(12))

#Creating Businesses!
#19
class Business:
  def __init__(self, name, franchises):
    self.name = name
    self.franchises = franchises

arepas_menu = Menu("Take a' Arepa", {
  'arepa pabellon': 7.00, 'pernil arepa': 8.50, 'guayanes arepa': 8.00, 'jamon arepa': 7.50
}, 10, 20)      
arepas_place = Franchise("189 Fitzgerald Avenue", [arepas_menu])
  
arepas_business = Business("Basta Fazoolin' with my Heart", [arepas_place])    
print("\n")  
print(arepas_business.franchises[0].menus[0])  
    
  