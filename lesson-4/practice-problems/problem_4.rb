# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# This will return { "a" => "ant", "b" => "bear", "c" => "cat" }, because
# each_with_object will return the updated hash given in the argument.
