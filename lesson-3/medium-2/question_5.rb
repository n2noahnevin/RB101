# Depending on a method to modify its arguments can be tricky:

# Whether the above "coincidentally" does what we think we wanted 
# "depends" upon what is going on inside the method.

# How can we refactor this practice problem to make the result easier to 
# predict and easier for the next programmer to maintain?

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]

my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Now, the method does nothing destructive, and both new objects are 
# returned from the method and passed into the original local variables.
# Much more easy to understand.

