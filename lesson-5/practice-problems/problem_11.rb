# Given the following data structure use a combination of methods, 
# including either the select or reject method, to return a new array 
# identical in structure to the original but containing only the integers
# that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |array|
  array.select do |num|
    num % 3 == 0
  end
end

p new_arr

# Or...

arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
