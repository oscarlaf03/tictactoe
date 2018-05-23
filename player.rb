require_relative 'game_input_validations'
# Creates the attributes for the players of the game
class Player < GameInputValidations
  attr_reader :name, :human
  attr_accessor :marker

  def initialize(human = true)
    @human = human
    @name = set_name
    @marker = set_marker
  end

  private

  def set_name
    if human
      puts "Welcome\nPlease enter your name:"
      gets.chomp
    else
      'Computer'
    end
  end

  def set_marker
    puts "Please choose your marker: 'X' OR 'O'" if human
    get_valid_marker(gets.chomp).upcase if human
  end
end
