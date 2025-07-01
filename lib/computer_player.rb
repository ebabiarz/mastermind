class ComputerPlayer
  COLOR_CODE = {'0': "blue", '1': "red", '2': "yellow", '3': "orange", '4': "green", '5': "purple"}

  attr_accessor :guesses, :secret_code

  def initialize
    @secret_code = self.generate_secret_code
    @guesses = []
  end

  def get_guess
    self.guesses.push(generate_secret_code)
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