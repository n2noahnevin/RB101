# Using the each method, write some code to output all of the vowels 
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowel_string = "aeiouAEIOU"

hsh.each do |key, value|
  value.each do |word|
    arr = word.split('')
    arr.each do |letter|
      if vowel_string.include?(letter)
        p letter
      end
    end
  end
end

# Or...

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end