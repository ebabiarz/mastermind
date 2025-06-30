class Game

  attr_accessor :turn_number
  
  def initialize
    @turn_number = 0
  end

  def check_for_win(player, comp)
    feedback = compare_guess(player, comp)
    if feedback == ["=", "=", "=", "="]
      puts "You win!"
      play_again?
    else
      puts "#{feedback.join(", ")}"
    end
  end

  def compare_guess(player, comp)
    feedback = Array.new
    player.guesses.last.each_index do |index|
      value = player.guesses.last[index]
      if comp.secret_code.include?(value)
        locations = Array.new
        comp.secret_code.each_index do |index|
          if comp.secret_code[index] == value
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