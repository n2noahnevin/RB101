# What will this code return?

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# The inner arr.map will return new arrays [2, 4] and [6, 8].
# The outer .map will return a new array [[2, 4], [6, 8]].