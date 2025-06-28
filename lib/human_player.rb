class HumanPlayer

  attr_accessor :guesses
  
  def initialize
    @guesses = []
  end

  def get_guess
    guess = gets.chomp.to_s.downcase
    guess_array = guess.split(", ")
    return guess_array
  end
end