def play_game(code_guesser, code_maker, game)
  if code_guesser.class == HumanPlayer
    puts "Try to guess the 4-color code in 12 guesses or fewer"
    puts "Make your guesses in this format:"
    puts "color, color, color, color"
    puts "ex: blue, green, yellow, red"
    puts "Clue Key:"
    puts "'=': Correct color, correct location"
    puts "'+': Correct color, wrong location"
    puts "'x': Code does not contain this color"
  else
    code_maker.get_secret_code
  end
  while game.turn_number < 12
    play_turn(code_guesser, code_maker, game)
  end
  if code_guesser.class == HumanPlayer
    puts "Game Over!"
    puts "The code was #{code_maker.convert_to_color(code_maker.secret_code)}"
    play_again?
  else
    puts "You Win!"
    play_again?
  end
end

def play_turn(code_guesser, code_maker, game)
  if code_guesser.class == HumanPlayer
    puts "Possible colors: Red, Green, Blue, Yellow, Purple, Orange"
    puts "Guess the code"
    code_guesser.get_guess
    game.check_for_win(code_guesser, code_maker)
    game.turn_number += 1
  else
    code_guesser.get_guess
    game.check_for_win(code_guesser, code_maker)
    game.turn_number += 1
    puts "press enter to continue"
    pause = gets.chomp.to_s.downcase
    if pause == pause
    end
  end
end

def type_of_game?
  puts "Would you like to guess the computer's code,"
  puts "or have the computer guess your code?"
  puts "Enter 'Guess' or 'Make'"
  game_type = gets.chomp.to_s.downcase
  if game_type == "guess"
    start_new_game_guess
  elsif game_type == "make"
    start_new_game_make
  else
    puts "Not a valid game mode. Try again."
    type_of_game?
  end
end

def start_new_game_make
  game = Game.new
  code_guesser = ComputerPlayer.new
  code_maker = HumanPlayer.new
  play_game(code_guesser, code_maker, game)
end

def start_new_game_guess
  game = Game.new
  code_guesser = HumanPlayer.new
  code_maker = ComputerPlayer.new
  play_game(code_guesser, code_maker, game)
end

def play_again?
  puts "Would you like to play again?"
  puts "Enter Y to start a new game, or anything else to exit"
  answer = gets.chomp.to_s.downcase
  if answer == "y"
    type_of_game?
  else
    exit
  end
end