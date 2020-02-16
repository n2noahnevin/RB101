# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The return value of this select method is [1, 2, 3], which is a NEW 
# array. Select will see 'hi' as its last line, which is always true, so
# every element of the array will be moved into the new one and returned.