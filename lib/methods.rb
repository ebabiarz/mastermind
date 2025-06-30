def play_game(player, comp, game)
  puts "Try to guess the 4-color code in 12 guesses or fewer"
  puts "Make your guesses in this format:"
  puts "color, color, color, color"
  puts "ex: blue, green, yellow, red"
  puts "Clue Key:"
  puts "'=': Correct color, correct location"
  puts "'+': Correct color, wrong location"
  puts "'x': Code does not contain this color"
  while game.turn_number < 12
    play_turn(player, comp, game)
  end
  puts "Game Over!"
  puts "The code was #{comp.secret_code}"
  play_again?
end

def play_turn(player, comp, game)
  puts "Possible colors: Red, Green, Blue, Yellow, Purple, Orange"
  puts "Guess the code"
  player.get_guess
  game.check_for_win(player, comp)
  game.turn_number += 1
end

def start_new_game
  game = Game.new
  player = HumanPlayer.new
  comp = ComputerPlayer.new
  play_game(player, comp, game)
end

def play_again?
  puts "Would you like to play again?"
  puts "Enter Y to start a new game, or anything else to exit"
  answer = gets.chomp.to_s.downcase
  if answer == "y"
    start_new_game
  else
    exit
  end
end