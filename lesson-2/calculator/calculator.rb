# Build a command line calculator program that does the following:
# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or 
# divide
# displays the result

puts "Welcome to the calculator!"

puts "Please enter your first number:"
number1 = gets.chomp.to_i

puts "Please enter your second number:"
number2 = gets.chomp.to_i

puts "What operation would you like to do?"
puts "1 for addition, 2 for subtraction, 3 for multiplication, 4 for division."
operation = gets.chomp.to_i

case operation
when 1
  puts "Your answer is #{number1 + number2}."
when 2
  puts "Your answer is #{number1 - number2}."
when 3 
  puts "Your answer is #{number1 * number2}."
when 4
  puts "Your answer is #{number1.to_f / number2.to_f}." # Will change to floats to get decimal answers.
end