# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# .map will always return an array. If the value in the hash has a size 
# greater than 3, then it will be put in the new returned array. 
# 'ant' is not bigger than 3, and when no conditions in an if statement
# evaluate to true, it returns nil. So an array will be returned here
# of [nil, 'bear'].