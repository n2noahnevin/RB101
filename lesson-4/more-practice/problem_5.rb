# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

be_index = 0
flintstones.each_with_index { |name, index| be_index = index if name.start_with?("Be") }

p be_index

# Or...

p flintstones.index { |name| name[0, 2] == "Be" }