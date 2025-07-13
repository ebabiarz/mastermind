class Game

  attr_accessor :turn_number
  
  def initialize
    @turn_number = 0
  end

  def check_for_win(code_guesser, code_maker)
    feedback = compare_guess(code_guesser, code_maker)
    if code_guesser.class == HumanPlayer
      if feedback == ["=", "=", "=", "="]
        puts "You win!"
        play_again?
      else
        return feedback.join(", ")
      end
    else
      if feedback == ["=", "=", "=", "="]
        last_guess = code_guesser.guesses.last.clone
        puts "The computer guessed #{code_guesser.convert_to_color(last_guess).join(", ")}. You lose!"
        play_again?
      else
        return feedback
      end
    end
  end

  def compare_guess(code_guesser, code_maker)
    feedback = Array.new
    code_guesser.guesses.last.each_index do |index|
      value = code_guesser.guesses.last[index]
      if code_maker.secret_code.include?(value)
        locations = Array.new
        code_maker.secret_code.each_index do |index|
          if code_maker.secret_code[index] == value
            locations.push(index)
          end
        end
        if locations.include?(index)
          feedback[index] = "="
        else
          feedback[index] = "+"
        end
      else
        feedback[index] = "x"
      end
    end
    return feedback
  end
end