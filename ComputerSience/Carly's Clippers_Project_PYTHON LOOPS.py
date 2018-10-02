Carly's Clippers                                                                             
You are the Data Analyst at Carly's Clippers, the newest hair salon on the block. Your job is to go through the lists of data that have been collected in the past couple of weeks. You will be calculating some important metrics that Carly can use to plan out the operation of the business for the rest of the month.

You have been provided with three lists:

hairstyles: the names of the cuts offered at Carly's Clippers                                     
prices: the price of each hairstyle in the hairstyles list
last_week: the number of each hairstyle in hairstyles that was purchased last week
Let's get started!                                                                                                                                                                    


---------------------------------------------------

hairstyles = ["bouffant", "pixie", "dreadlocks", "crew", "bowl", "bob", "mohawk", "flattop"]

prices = [30, 25, 40, 20, 20, 35, 50, 35]

last_week = [2, 3, 5, 8, 4, 4, 6, 2]

#Prices and Cuts:
# 1.Create a variable total_price, and set it to 0.
total_price = 0

#2.Iterate through the prices list and add each price to the variable total_price
for item in prices:
  total_price += item
  
#3. After your loop, create a variable called average_price that is the total_price divided by the number of prices. You can get the number of prices by using the len() function.
average_price = total_price/len(prices)
print("Average Haircut Price: " + str(average_price))

#5.That average price is more expensive than Carly thought it would be! She wants to cut all prices by 5 dollars.Use a list comprehension to make a list called new_prices, which has each element in prices minus 5.
new_prices = [item-5 for item in prices]
print(new_prices)

#Revenue:
#7.Carly really wants to make sure that Carly's Clippers is a profitable endeavor. She first wants to know how much revenue was brought in last week. Create a variable called total_revenue and set it to 0
total_revenue = 0

#8.Use a for loop to create a variable i that goes from 0 to len(hairstyles). Hint: You can use range() to do this!
#9. Add the product of prices[i] (the price of the haircut at position i) and last_week[i] (the number of people who got the haircut at position i) to total_revenue at each step.
for index in range(0,len(hairstyles)):
  total_revenue += prices[index] * last_week[index]
  
print(total_revenue)  

#11. Find the average daily revenue by dividing total_revenue by 7. Call this number average_daily_revenue and print it out.
average_daily_revenue = total_revenue/7
print(average_daily_revenue)

#12.Carly thinks she can bring in more customers by advertising all of the haircuts she has that are under 30 dollars. Use a list comprehension to create a list called cuts_under_30 that has the entry hairstyles[i] for each i for which new_prices[i] is less than 30. You can use range() in your list comprehension to make i go from 0 to len(new_prices) - 1
cuts_under_30 = [
  # expression
  hairstyles[index]
  # for statement	
  for index in range(0, len(hairstyles) )
  #coditional statement
  if new_prices[index]<30]
print(cuts_under_30)

lst1 = [3,2,6,8]
lst2 = [1,4,6,8]
lst3 = [5,3,4,6]
lst2_multipli_lst3_1 = [
  lst2[index]*lst3[index]
  for index in range(0,len(lst2))
]
print(lst2_multipli_lst3_1)

lst2_multipli_lst3_2 = []
for element in lst2:
  for item in lst3:
    combine = element*item
    lst2_multipli_lst3_2.append(combine)
print(lst2_multipli_lst3_2)  

lst2_multipli_lst3_3 = []
for index in range(0,len(lst2)):
  combine = lst2[index] * lst3[index]
  lst2_multipli_lst3_3.append(combine)
print(lst2_multipli_lst3_3)  
  
  
  















