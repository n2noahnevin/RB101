# Blackjack

# Start with a 52-card deck consisting of the 4 suits (hearts, diamonds,
# clubs, and spades) and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack,
# queen, king, ace).

# Goal is to get as close to 21 as possible, without going over. If you
# go over 21, you "bust" and lose.

# The game consists of the player and the "dealer", which is the computer.
# Both are dealt two cards. Player can see both of their cards, and only
# one of the dealer's cards.

# Numbers 2 through 10 are worth face value. Jack, Queen, King each worth
# 10. Ace is either worth 1 or 11. If a hand consists of a 2, ace, and a
# 5, then the ace is 11 because the sum doesn't exceed 21. If another ace
# is drawn, then (2 + 11 + 5 + 11) exceeds 21. So the new ace is only 
# worth 1, for (2 + 11 + 5 + 1) = 19.

# Player goes first, and either "hits" or "stays". A hit means the player
# gets another card. Turn is over when the player either stays or busts.

# When the player stays, it's then the dealer's turn. The dealer must
# follow a strict rule for deciding to hit or stay: hit until the total is
# at least 17. If dealer busts, then player wins.

# When both the player and dealer stay, compare total value of cards and
# see who has highest value.

require 'pry'

def prompt(sentence)
  puts "=> #{sentence}"
end

def initialize_deck
  card_arr = []
  suit_arr = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
  num_arr = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  suit_counter = 0
  num_counter = 0
  loop do
    14.times do |time|
      card_arr[num_counter] = []
      card_arr[num_counter][0] = suit_arr[suit_counter]
      card_arr[num_counter][1] = num_arr[time]
      card_arr[num_counter][2] = 'unused'
      num_counter += 1
    end
    suit_counter += 1
    break if suit_counter == 4
  end
  card_arr
end

def pick_card(deck)
  card = ''
  loop do
    card = deck.sample
    break if card[2] == 'unused'
  end
  card
end

def create_dealer_hand(deck)
  dealer_arr = []
  2.times do |time|
    card = pick_card(deck)
    card[2] = 'used'
    dealer_arr[time] = card
  end
  dealer_arr
end

def create_player_hand(deck)
  player_arr = []
  2.times do |time|
    card = pick_card(deck)
    card[2] = 'used'
    player_arr[time] = card
  end
  player_arr
end

def show_cards(d_hand, p_hand)
  prompt "Dealer has: "
  print "#{d_hand[0][1]} of #{d_hand[0][0]} and unknown card.\n"
  num = 0

  prompt "Player has: "
  until num == p_hand.size
    print "#{p_hand[num][1]} of #{p_hand[num][0]}"
    print ", " if num < p_hand.size - 2
    print " and " if num == p_hand.size - 2
    num += 1
  end
  puts "\n"
end

def update_player_hand(deck, p_hand)
  card = pick_card(deck)
  p_hand[p_hand.size] = card
end

def reveal_final_cards(d_hand, p_hand)
  prompt "Dealer has: "
  print "#{d_hand[0][1]} of #{d_hand[0][0]} and #{d_hand[1][1]} of #{d_hand[1][0]}.\n"
  num = 0

  prompt "Player has: "
  until num == p_hand.size
    print "#{p_hand[num][1]} of #{p_hand[num][0]}"
    print ", " if num < p_hand.size - 2
    print " and " if num == p_hand.size - 2
    num += 1
  end
  puts "\n"
end

def check_winner(d_hand, p_hand)
  d_total = convert_to_value(d_hand)
  p_total = convert_to_value(p_hand)
  case
  when p_total > 21
    prompt "I'm sorry, you busted!"
  when d_total > 21
    prompt "Congratulations, the dealer busted!"
  when p_total > d_total 
    prompt "Congratulations, you won!"
  when d_total > p_total
    prompt "I'm sorry, you lost!"
  when p_total == d_total
    prompt "It's a tie!"
  end
end

def convert_to_value(hand)
  face_cards = ['Jack', 'Queen', 'King']
  counter = 0
  total = 0
  until counter == hand.size do
    if face_cards.include?(hand[counter][1])
      total += 10
    elsif hand[counter][1] == 'Ace'
      total += 11
    else
      total += hand[counter][1].to_i
    end
    counter += 1
  end
  total = ace_convert(total, hand)
end

def ace_convert(total_num, p_hand)
  counter = 0
  if total_num > 21
    until counter == p_hand.size || total_num <= 21 do
      if p_hand[counter][1] == 'Ace'
        total_num -= 10 # Same as take away 11, and add 1
      end
      counter += 1
    end
  end
  total_num
end

deck = initialize_deck

prompt "Welcome to Blackjack!"

dealer_hand = create_dealer_hand(deck)
player_hand = create_player_hand(deck)

show_cards(dealer_hand, player_hand)

loop do
  prompt "Would you like to hit or stay?"
  answer = gets.chomp
  break if answer.downcase == 'stay'
  if answer.downcase == 'hit'
    update_player_hand(deck, player_hand)
    break if convert_to_value(player_hand) > 21
  else
    prompt "Invalid input, please enter hit or stay."
  end
  show_cards(dealer_hand, player_hand)
end

reveal_final_cards(dealer_hand, player_hand)

check_winner(dealer_hand, player_hand)
