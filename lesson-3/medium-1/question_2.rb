# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# You cannot concatenate a string with a number.

puts "the value of 40 + 2 is " + (40 + 2).to_s

# Or... 

puts "the value of 40 + 2 is #{40 + 2}"

