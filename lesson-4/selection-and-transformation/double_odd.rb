# input: array
# output: array (different array)
# Requirements:
# Write a method, double_odd_indices, that takes in an array of numbers, and
# doubles every number at an odd index, returning all the numbers in a 
# different array.
# Algorithm:
# 1. Define new method, double_odd_indices, that takes in an array.
# 2. Start a loop, and initialize a counter variable to 0, and a new 
# array to [].
# 3. Break the loop if the counter == array.size
# 4. Put array[counter] * 2 if counter % 2 != 0.
# 5. Return the new array.

def double_odd_indices(arr)
  new_arr = []
  counter = 0
  loop do
    break if counter == arr.size
    current_number = arr[counter]
    current_number *= 2 if counter % 2 != 0
    new_arr << current_number
    counter += 1
  end
  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]