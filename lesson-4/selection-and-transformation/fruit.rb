# input: hash
# output: hash (new hash)

# Requirements:
# Select all the key-value pairs whew the value is "Fruit".
# Return a new hash of these key-value pairs.

# Algorithm:
# 1. Define a method, select_fruit, that takes in a hash.
# 2. Create a local variable called fruit_pairs, and initialize it to an
# empty hash.
# 3. Use hash.each {|key, value| fruit_pairs << hash[key] if hash[key] == 'Fruit'
# Return the fruit_pairs hash.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  fruit_pairs = {}

  hash.each do |key, value| 
    fruit_pairs[key] = hash[key] if hash[key] == 'Fruit'
  end

  fruit_pairs
end



p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}