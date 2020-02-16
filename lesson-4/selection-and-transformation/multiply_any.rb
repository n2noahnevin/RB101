# input: array
# output: array (different array)
# Requirements:
# Write a method, multiply, that takes in an array of numbers and an
# integer, and multiplies all numbers in the array by the given integer.
# This will be a new array returned. 
# Algorithm:
# 1. Define new method, multiply, that takes in an array and an integer.
# 2. Start a loop, and initialize a counter variable to 0, and a new 
# array to [].
# 3. Break the loop if the counter == array.size
# 4. Put new_array << array[counter] * argument_integer
# 5. Return the new array.

def multiply(arr, number)
  new_arr = []
  counter = 0
  loop do
    break if counter == arr.size
    new_arr << arr[counter] * number
    counter += 1
  end
  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]