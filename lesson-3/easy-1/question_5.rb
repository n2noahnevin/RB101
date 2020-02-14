# Programmatically determine if 42 lies between 10 and 100.

if 42.between?(10, 100)
  puts "42 is between 10 and 100."
else
  puts "42 is not between 10 and 100."
end

# Or...

(10..100).cover?(42)
