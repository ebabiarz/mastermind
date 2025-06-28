class Game

  attr_accessor :turn_number
  
  def initialize
    @turn_number = 1
  end

  def check_for_win(player, comp)
    if compare_guess(player, comp) == ["=", "=", "=", "="]
      puts "You win!"
    else
      puts "#{compare_guess(player, comp).join(", ")}"
    end
  end

  def compare_guess(player, comp)
    feedback = Array.new
    player.guesses.last.each_index do |index|
      if comp.secret_code.include?(player.guesses.last[index])
        if comp.secret_code.index(player.guesses.last[index]) == index
          feedback.push("=")
        else
          feedback.push("+")
        end
      else
        feedback.push("x")
      end
    end
    return feedback
  end
end