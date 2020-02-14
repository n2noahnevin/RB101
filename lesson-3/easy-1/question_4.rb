# The Ruby Array class has several methods for removing items from the
# array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the
# original array between method calls)?

numbers.delete_at(1)
# This will delete the value at index 1, or the value 2 in this case.
numbers.delete(1)
# This will delete the value 1 from the array.