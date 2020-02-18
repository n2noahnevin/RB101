# What will this code return?

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# 18, 7, and 12 will be printed. puts will return nil.
# The block return is not used by each. 
# each returns the original array, so my_arr = [[18, 7], [3, 12]].