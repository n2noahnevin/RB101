# Given the following data structure, return a new array containing the 
# same sub-arrays as the original but ordered logically by only taking 
# into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end

p new_arr