# What is returned here?

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# puts arr.first will print 1 and 3, and return nil both times.
# arr.first will return 1 and then 3.
# map will use arr.first's returns, the return of the block, and return
# the new array [1, 3]