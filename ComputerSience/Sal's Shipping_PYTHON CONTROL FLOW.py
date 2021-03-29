
def ground_shipping(weight):    
  if (weight<=2): 
    cost_per_pound = 1.5
  elif (weight<=6):
    cost_per_pound  = 3
  elif (weight<=10):
    cost_per_pound  = 4
  else:
    cost_per_pound = 4.75
  return cost_per_pound*weight + 20  
#print(ground_shipping(5)) 
premium_ground_shipping = 125
def drone_shipping(weight):
  if weight<=2:
    cost_per_pound = 4.5
  elif weight<=6:
    cost_per_pound = 9
  elif weight<=10:
    cost_per_pound =12
  else:
    cost_per_pound = 14.2
  return weight*cost_per_pound  
#print(drone_shipping(8))  
def cheapest_shipping(weight):
  ground = ground_shipping(weight)
  premium = premium_ground_shipping
  drone = drone_shipping(weight)
  
  if(ground<premium and ground<drone):
    return "You should ship using ground shipping, it will cost $" + str(ground)
  elif(premium<ground and premium<drone):
    return "You should ship using premium ground shipping, it will cost $" + str(premium)
  else:
    return "You should ship using drone shipping, it will cost $" + str(drone)
  
print(cheapest_shipping(4.8))
print(cheapest_shipping(41.5))
  
  
