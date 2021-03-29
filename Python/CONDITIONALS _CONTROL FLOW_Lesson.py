# Complete the if and elif statements!
def grade_converter(grade):
    if grade >=90 :
        return "A"
    elif grade>=80 and grade<=89:
        return "B"
    elif grade>=70 and grade<=79:
        return "C"
    elif grade>=65 and grade<=69:
        return "D"
    else:
        return "F"
      
# This should print an "A"      
print grade_converter(92)

# This should print a "C"
print grade_converter(70)

# This should print an "F"
print grade_converter(61)