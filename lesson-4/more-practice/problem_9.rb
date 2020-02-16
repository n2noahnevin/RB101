# Write your own version of the rails titleize method.

words = 'the flintstones rock'

p words.split.map { |word| word.capitalize }.join(' ')
