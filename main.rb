require_relative 'lib/human_player'
require_relative 'lib/computer_player'
require_relative 'lib/game'




=begin
computer creates code:
  - random number generated pushed to an array 4 times
  - possible numbers are 1-6
  - convert each number to a color(?)
human guesses code:
  - formatting?
    - if just using numbers: 1234. convert to array with "" delimiter
    - if using colors: blue, red, green, purple. add to array with ", " delimiter.
      convert each element to corresponding number
compare human guess to computer code:
  - computer_code_array.difference(human_code_array)
    - Use to find exact match?
 *- human_code_array.each {|element| computer_code_array.include?(element)
    - Use to compare each element to computer code.
    - If index matches, red peg. If not, but included, white peg.
provide feedback:
  - formatting?
    - + for correct color/number and position
    - - for correct color/number, wrong position
    - O for incorrect color/number
classes:
  - ComputerPlayer
    - secret code
  - HumanPlayer
    - guesses
  - Game
    - Number of guesses
other considerations:
  - count number of turns. Once it reaches 12, game over
  - can I use that color gem to make it more interesting?
=end