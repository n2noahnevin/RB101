# input: array
# output: array (same array)
# Requirements:
# Write a method, double_numbers, that takes in an array of numbers, and
# doubles every number, returning the doubled numbers in the same array.
# Algorithm:
# 1. Define new method, double_numbers, that takes in an array.
# 2. Start a loop, and initialize a counter variable to 0.
# 3. Break the loop if the counter == array.size
# 4. Put array[counter] * 2 into the same array.
# 5. Return the array.

def double_numbers(arr)
  counter = 0
  loop do
    break if counter == arr.size
    
    arr[counter] = arr[counter] * 2

    counter += 1
  end

  arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]



