# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# This will return [1, nil, nil]. 1 will go into the array first from the
# else block, and then 2 and 3 will both activate the if block. The if 
# block contains a puts statement, which will return two nils to the 
# array.