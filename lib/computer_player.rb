class ComputerPlayer
  COLOR_CODE = {'0': "blue", '1': "red", '2': "yellow", '3': "orange", '4': "green", '5': "purple"}

  attr_accessor :guesses, :secret_code, :feedback, :options

  def initialize
    @secret_code = self.generate_secret_code
    @guesses = []
    @feedback = []
    @options = ["0", "1", "2", "3", "4", "5"]
  end

  def get_guess
    if self.guesses == []
      self.guesses.push(generate_secret_code)
    else
      guess = Array.new(4)
      unavailable = Array.new
      feedback = self.feedback.last
      feedback.each_index do |index|
        guess[index] = self.retain_correct(feedback, index)
        if guess[index] != nil
          unavailable.push(index)
        end
        self.remove_options(feedback, index)
      end
      wrong_location_guesses = retain_wrong_location(feedback, unavailable)
      wrong_location_guesses.each do |element|
        guess[element[0]] = element[1]
      end
      guess.each_index do |index|
        if guess[index] == nil
          guess[index] = check_random_option(index)
        end
      end
      self.guesses.push(guess)
    end
  end

  def retain_wrong_location(feedback, unavailable)
    guesses = Array.new
    new_unavailable = unavailable.clone
    feedback.each_index do |index|
      if feedback[index] == "+"
        value = self.guesses.last[index]
        self.guesses.last.each_index do |index|
          available = [0, 1, 2, 3]
          available = available.difference(new_unavailable)
          if self.guesses.last[index] == value
            available = available.difference([index])
          end
          if available.length > 0 && guesses.flatten.include?(value) == false && check_duplicate_guess(index, value) == false
            new_index = available[number_generator(available.length)]
            if double_check_new_index(new_index, value) == false
              guesses.push([new_index.to_i, value])
              new_unavailable.push(new_index)
            end
          end
        end
      end
    end
    return guesses
  end

  def double_check_new_index(new_index, value)
    self.guesses.each do |element|
      if element[new_index] == value
        return true
      end
    end
    return false
  end

  def check_random_option(index)
    options = self.options.clone
    value = number_generator(options.length).to_s
    while check_duplicate_guess(index, value) == true
      options.delete(value)
      value = options[number_generator(options.length)]
    end
    return value
  end

  def check_duplicate_guess(index, value)
    self.guesses.each do |element|
      if element[index] == value
        return true
      end
    end
    return false
  end

  def remove_options(feedback, index)
    if feedback[index] == "x"
      self.options.delete(self.guesses.last[index])
    end
  end

  def retain_correct(feedback, index)
    if feedback[index] == "="
      return self.guesses.last[index]
    end
  end

  def number_generator(n)
    if n > 0
      return Random.rand(n)
    else
      return nil
    end
  end

  def generate_secret_code
    array = Array.new
    i = 0
    while i < 4
      array.push(Random.rand(6).to_s)
      i += 1
    end
    return array
  end

  def convert_to_color(array)
    array.each_index do |index|
      array[index] = COLOR_CODE[:"#{array[index]}"]
    end
    return array
  end
end