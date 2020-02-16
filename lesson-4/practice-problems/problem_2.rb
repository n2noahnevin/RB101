# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# The Ruby Docs tell us that if a block is given for count, then count 
# only returns values that amount to true in the block. So this will 
# return 2.