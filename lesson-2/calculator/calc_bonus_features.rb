# Add even more bonus features onto the refactored calculator code.

# 1. Better integer validation.
# The current method of validating the input for a number is very weak. 
# It's also not fully accurate, as you cannot enter a 0. Come up with a 
# better way of validating input for integers.

# ANSWER: Changing the valid_number? method to turning the number from
# a string to an integer and back to a string is a better solution, 
# since it works for 0 as well.

# 2. Number validation.
# Suppose we're building a scientific calculator, and we now need to 
# account for inputs that include decimals. How can we build a validating 
# method, called number?, to verify that only valid numbers -- integers 
# or floats -- are entered?

# ANSWER: The new number? method will now change the number into either
# a float or an integer for calculation.

# 3. Our operation_to_message method is a little dangerous, because we're 
# relying on the case statement being the last expression in the method. 
# What if we needed to add some code after the case statement within the 
# method? What changes would be needed to keep the method working with 
# the rest of the program?

# ANSWER: Either add returns onto all of our strings in the cases, or 
# make the case a variable and call that variable at the last line.



def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  if number.to_i.to_s == number
    return true
  elsif number.to_f.to_s == number
    return true
  else
    return false
  end
end

def number?(number)
  if number.to_i.to_s == number
    return number.to_i
  else
    return number.to_f
  end
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to the calculator! Please enter your name.")

name = ''

loop do
  name = gets.chomp

  if name.empty?
    prompt("Please use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # Main loop
  number1 = 0
  number2 = 0

  loop do
    prompt("Please enter your first number:")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Invalid input, please enter a number.")
    end
  end

  loop do
    prompt("Please enter your second number:")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Invalid input, please enter a number.")
    end
  end

  operation_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  # The letters MSG can be anything, they're just delimiters.

  prompt(operation_prompt)

  operation = 0

  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Please enter a valid number for operation.")
    end
  end

  number1 = number?(number1)
  number2 = number?(number2)

  prompt("#{operation_to_message(operation)} numbers...")

  result = case operation
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}.")

  prompt("Would you like to do another calculation? (Y to calculate again.)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # End of main loop

prompt("Thank you for using calculator!")
