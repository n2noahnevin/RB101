# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# Reject returns a new array containing items for which the given block
# is not true. A puts statement is nil, which Ruby sees as false, so
# reject will return a new array of every element, [1, 2, 3].