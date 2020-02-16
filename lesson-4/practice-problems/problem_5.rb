# What does shift do in the following code? How can we find out?

  hash = { a: 'ant', b: 'bear' }
  hash.shift

# shift will remove the first key-value pair and return it as a two item
# array.
# hash.shift #=> [:a, 'ant']
# hash #=> { b: 'bear' }