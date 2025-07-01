class HumanPlayer

  COLOR_CODE = {'0': "blue", '1': "red", '2': "yellow", '3': "orange", '4': "green", '5': "purple"}

  attr_accessor :guesses, :secret_code
  
  def initialize
    @secret_code = []
    @guesses = []
  end

  def get_secret_code
    puts "Enter your secret code"
    puts "Make your code in this format:"
    puts "color, color, color, color"
    puts "ex: blue, green, yellow, red"
    code_array = gets.chomp.to_s.downcase.split(", ")
    if check_valid_guess(code_array) == false
      puts "Not a valid code. Try again"
      self.get_secret_code
    else
      self.secret_code = self.convert_guess(code_array)
    end
  end

  def get_guess
    guess_array = gets.chomp.to_s.downcase.split(", ")
    if check_valid_guess(guess_array) == false
      puts "Not a valid guess. Try again."
      self.get_guess
    else
      guess_converted = convert_guess(guess_array)
      if check_duplicate_guess(guess_converted) == "duplicate"
        puts "You have already guessed that code"
        self.get_guess
      else
        self.guesses.push(guess_converted)
        return guess_converted
      end
    end
  end

  def check_valid_guess(guess)
    if guess.length != 4
      return false
    else
      guess.each do |element|
        if COLOR_CODE.values.include?(element) == false
          return false
        end
      end
      return true
    end
  end

  def convert_guess(array)
    array.each_index do |index|
      array[index] = COLOR_CODE.key(array[index]).to_s
    end
    return array
  end

  def check_duplicate_guess(guess)
    if self.guesses.include?(guess) == true
      return "duplicate"
    end
  end
end