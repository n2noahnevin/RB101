# Describe the difference between ! and ? in Ruby. And explain what would
# happen in the following scenarios:

# what is != and where should you use it?
# != is 'not equal to', and you should use it as a conditional when you
# don't want your variable to equal a value.

# put ! before something, like !user_name
# This returns the opposite of the value, so if user_name is true, this
# will return false.

# put ! after something, like words.uniq!
# This uses a new method that's destructive, so words.uniq! will change 
# the original words array.

# put ? before something
# This does nothing.

# put ? after something
# Usually the name of a new method that returns true or false.

# put !! before something, like !!user_name
# Turns an object into its boolean equivalent.