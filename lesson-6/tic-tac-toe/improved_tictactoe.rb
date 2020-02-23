require 'pry'

FIRST_MOVE = "choose"
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(sentence)
  puts "=> #{sentence}"
end

def joinor(array, punctuation = ', ', word = 'or') 
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(punctuation)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, p_wins, c_wins)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "Player wins: #{p_wins}. Computer wins: #{c_wins}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = ''
  if immediate_win(brd)
    square = immediate_win(brd)
  elsif immediate_threat(brd)
    square = immediate_threat(brd)
  elsif empty_squares(brd).include?(5)
    square = 5
  else
  square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def immediate_win(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      return offense(brd, line, brd.values_at(*line))
    end
  end
  false
end

def immediate_threat(brd)
  WINNING_LINES.each do |line|
    binding.pry
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      return defense(brd, line, brd.values_at(*line))
    end
  end
  false
end

def offense(brd, line, marker)
  case 
  when marker[0] != COMPUTER_MARKER && empty_squares(brd).include?(line[0])
    return line[0]
  when marker[1] != COMPUTER_MARKER && empty_squares(brd).include?(line[1])
    return line[1]
  when marker[2] != COMPUTER_MARKER && empty_squares(brd).include?(line[2])
    return line[2]
  end
end

def defense(brd, line, marker)
  case 
  when marker[0] != PLAYER_MARKER && empty_squares(brd).include?(line[0])
    return line[0]
  when marker[1] != PLAYER_MARKER && empty_squares(brd).include?(line[1])
    return line[1]
  when marker[2] != PLAYER_MARKER && empty_squares(brd).include?(line[2])
    return line[2]
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # Turn into boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 # *line is "splat line", returns the array elements.
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_wins = 0
computer_wins = 0

prompt "Welcome to Tic Tac Toe! First to five wins."
sleep(1.5)

answer = ''
loop do
  prompt "Who would you like to go first? Player or Computer?"
  answer = gets.chomp
  if answer.downcase == 'player'
    PLAYER_MARKER = 'X'
    COMPUTER_MARKER = 'O'
    break
  elsif answer.downcase == 'computer'
    PLAYER_MARKER = 'O'
    COMPUTER_MARKER = 'X'
    break
  else
    prompt "Invalid input, please enter Player or Computer."
  end
end



loop do
  board = initialize_board

  loop do
    display_board(board, player_wins, computer_wins)
    sleep(0.75)

    if PLAYER_MARKER == 'X'
      player_places_piece!(board)
    else
      computer_places_piece!(board)
    end
    
    break if someone_won?(board) || board_full?(board)

    display_board(board, player_wins, computer_wins)
    sleep(0.75)

    if PLAYER_MARKER == 'X'
      computer_places_piece!(board)
    else
      player_places_piece!(board)
    end

    break if someone_won?(board) || board_full?(board)

    display_board(board, player_wins, computer_wins)
    sleep(0.75)
  end

  display_board(board, player_wins, computer_wins)

  if someone_won?(board)
    if detect_winner(board) == 'Player'
      prompt "Player won!"
      player_wins += 1
    else
      prompt "Computer won!"
      computer_wins += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "You now have #{player_wins} wins. The computer has #{computer_wins} wins."
  if player_wins == 5
    prompt "Congratulations! You are the Tic Tac Toe Champion!"
    break
  elsif computer_wins == 5
    prompt "I'm sorry, you have lost the game."
    break
  end
  sleep(3)
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"