#books_large.csv

#books_small.csv

title,author
Adventures of Huckleberry Finn,Mark Twain
Best Served Cold,Joe Abercrombie
Dear Emily,Fern Michaels
Collected Poems,Robert Hayden
End Zone,Don DeLillo
Forrest Gump,Winston Groom
Gravity,Tess Gerritsen
Hiromi's Hands,Lynne Barasch
Norwegian Wood,Haruki Murakami
Middlesex: A Novel (Oprah's Book Club),Jeffrey Eugenides

--------------------------------------------------
#sorts.py

import random

def bubble_sort(arr, comparison_function):
  swaps = 0
  sorted = False
  while not sorted:
    sorted = True
    for idx in range(len(arr) - 1):
      #if arr[idx] > arr[idx + 1]:
      if comparison_function(arr[idx], arr[idx + 1]):
        sorted = False
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swaps += 1
  print("Bubble sort: There were {0} swaps".format(swaps))
  return arr

def quicksort(list, start, end, comparison_function):
  if start >= end:
    return
  pivot_idx = random.randrange(start, end + 1)
  pivot_element = list[pivot_idx]
  list[end], list[pivot_idx] = list[pivot_idx], list[end]
  less_than_pointer = start
  for i in range(start, end):
    #if pivot_element > list[i]:
    if comparison_function(pivot_element, list[i]):
      list[i], list[less_than_pointer] = list[less_than_pointer], list[i]
      less_than_pointer += 1
  list[end], list[less_than_pointer] = list[less_than_pointer], list[end]
  
  #quicksort(list, start, less_than_pointer - 1)
  #quicksort(list, less_than_pointer + 1, end)
  quicksort(list, start, less_than_pointer - 1, comparison_function)
  quicksort(list, less_than_pointer + 1, end, comparison_function)
  

------------------------------------------------------
#sorts.pyc

�
K{�[c@s
d�ZdS(cCs�d}t}x�|s�t}xztt|�d�D]b}|||�|||d�kr2t}||d||||<||d<|d7}q2q2WqWdj|�GH|S(NiisThere were {0} swaps(tFalsetTruetrangetlentformat(tarrt
sort_functiontswapstsortedtidx((s./home/ccuser/workspace/sorted-tale-ws/sorts.pytbubble_sorts	$%N(R
(((s./home/ccuser/workspace/sorted-tale-ws/sorts.pyt<module>s

------------------------------------------------
#utils.py

import csv

# This code loads the current book
# shelf data from the csv file
def load_books(filename):
  bookshelf = []
  with open(filename) as file:
      shelf = csv.DictReader(file)
      for book in shelf:
          # add your code here
          print(book['title'])
          book['author_lower'] = book['author'].lower()
          book['title_lower'] = book['title'].lower()
          
          bookshelf.append(book)
  return bookshelf


----------------------------------------------
#utils.pyc  

�
K{�[c@sddlZd�ZdS(i����NcCsLg}t|��4}tj|�}x|D]}|j|�q+WWdQX|S(N(topentcsvt
DictReadertappend(tfilenamet	bookshelftfiletreadertrow((s./home/ccuser/workspace/sorted-tale-ws/utils.pyt
load_bookss
(RR	(((s./home/ccuser/workspace/sorted-tale-ws/utils.pyt<module>s

--------------------------------------------
#script.py

import utils
import sorts

bookshelf = utils.load_books('books_small.csv')

#print(ord("a"))
#print(ord(" "))
#print(ord("A"))

def by_title_ascending(book_a, book_b):
  return book_a['title_lower'] > book_b['title_lower']

sort_1 = sorts.bubble_sort(bookshelf, by_title_ascending)
for book in sort_1:
  print(book['title'])
  
def by_author_ascending(book_a, book_b):
  return book_a['author_lower'] > book_b['author_lower']  

bookshelf_v1 = bookshelf.copy()
sort_2 = sorts.bubble_sort(bookshelf_v1, by_author_ascending)
for book in sort_2:
  print(book['author'])

#14.Within script.py create another copy of bookshelf as bookshelf_v2.  
bookshelf_v2 = bookshelf.copy()

#15.Perform quicksort on bookshelf_v2 using by_author_ascending. This implementation operates on the input directly, so does not return a list.
#Print the authors in bookshelf_v2 to ensure they are now sorted correctly.
sorts.quicksort(bookshelf_v2, 0, len(bookshelf_v2) - 1, by_author_ascending)
for book in bookshelf_v2:
  print(book['author'])

def by_total_length(book_a, book_b):
  return len(book_a['author_lower']) + len(book_a['title_lower']) > len(book_b['author_lower']) + len(book_b['title_lower'])

long_bookshelf = utils.load_books('books_large.csv')
sort_3 = sorts.bubble_sort(long_bookshelf, by_total_length)
for book in sort_3:
  print(book['author'])



