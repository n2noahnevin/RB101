# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values
# are the positions in the array.

hash = {}
flintstones.each_with_index do |item, index|
  hash[item] = index
end

p hash