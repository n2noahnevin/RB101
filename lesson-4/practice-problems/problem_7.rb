# What is the block's return value in the following code? How is it 
# determined? Also, what is the return value of any? in this code and 
# what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The block's return value is a boolean, because num.odd? is the last
# statement in the block. .any? returns true if any element returns true.
# 1 will be printed, then return true, and then the block is over.