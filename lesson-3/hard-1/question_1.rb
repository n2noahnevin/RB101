# What do you expect to happen when the greeting variable is referenced
# in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# The program will return nil. Even though the if block isn't executed,
# the local variable initialized in it will be set to nil.