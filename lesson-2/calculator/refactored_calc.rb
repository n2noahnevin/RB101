# Refactor the calculator to add additional features.

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
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
    number1 = gets.chomp.to_i

    if valid_number?(number1)
      break
    else
      prompt("Invalid input, please enter a number.")
    end
  end

  loop do
    prompt("Please enter your second number:")
    number2 = gets.chomp.to_i

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
