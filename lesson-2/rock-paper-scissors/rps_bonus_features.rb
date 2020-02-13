# Bonus features for the rock paper scissors program.

# 1. Lizard Spock
# Add Lizard and Spock to the code.

# ANSWER: When two more possibilities are included, the number of possible
# checks needed when comparing the player's and computer's values goes up
# greatly. Rubocop complains that the win? method is then too complex. A
# seamless solution is to make a hash that includes a symbol of each
# choice as a key, and the corresponding value be what that choice beats.

# 2. Typing the full word "rock" or "lizard" is tiring. Update the
# program so the user can type "r" for "rock," "p" for "paper," etc.
# Note that if you do bonus #1, you'll have two words that start with "s."
# How do you resolve that?

# ANSWER: I created another hash with the keys as the abbreviations, and
# the values as the complete word. I created a method called
# transmute_choice that, if the choice given is an abbreviation, changes
# the choice to the complete word. If the complete word is given at the
# beginning, then the method just returns the original choice.

# 3. Keep score of the player's and computer's wins. When either the
# player or computer reaches five wins, the match is over, and the winning
# player becomes the grand winner. Don't add your incrementing logic to
# display_results. Keep your methods simple; they should perform one
# logical task, no more, no less.

# ANSWER: This was a fun one. I had many issues when it came to the
# scope of my methods and variables. First, I tried to save the wins for
# both the player and computer in separate variables that would then be
# modified in methods, but I forgot about how methods cannot see local
# variables. So instead of passing two more local variables in, I created
# another hash called score and passed that in. The instructions said not
# to display prompts while also updating in the same method, and that
# confuses me, because the single method seems a lot more easy to
# understand to me, but I of course do plead ignorance about best
# practice.

VALID_CHOICES = %w(rock r paper p scissors sc lizard l spock sp)

WINNERS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['scissors', 'rock']
}

ABBREVIATIONS = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  l: 'lizard',
  sp: 'spock'
}

score = { player: 0, computer: 0 }

rounds = 0

def prompt(message)
  puts "=> #{message}"
end

def transmute_choice(choice)
  if ABBREVIATIONS.key?(choice.to_sym)
    ABBREVIATIONS[choice.to_sym]
  else
    choice
  end
end

def win?(first, second)
  WINNERS[first.to_sym].include?(second)
end

def update_results(score, player, computer)
  if win?(player, computer)
    score[:player] += 1
    prompt("You won this round!")
  elsif win?(computer, player)
    score[:computer] += 1
    prompt("You lost this round!")
  else
    prompt("This round's a tie!")
  end
end

prompt("Welcome to Rock Paper Scissors Lizard Spock!")
prompt("First to 5 wins.")

loop do # Main loop
  choice = ''
  rounds += 1
  prompt("This is round #{rounds}.")
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  choice = transmute_choice(choice)

  computer_choice = transmute_choice(VALID_CHOICES.sample)

  prompt("You chose #{choice}, computer chose #{computer_choice}.")

  update_results(score, choice, computer_choice)

  prompt("You have #{score[:player]} wins.")
  prompt("The computer has #{score[:computer]} wins.")

  if score[:player] == 5
    prompt("You win!")
    break
  elsif score[:computer] == 5
    prompt("The computer has won.")
    break
  end
end

prompt("Thank you for playing, goodbye!")
