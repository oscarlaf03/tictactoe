require_relative 'game_input_validations'
# For puts messages to the user
class GameServices < GameInputValidations

  private

  def print_board
    puts "\n\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts "Your turn \n\n" unless game_over?
  end

  def game_over_message
    puts "It's a tie" if tie?
    puts "#{winner.name.capitalize} wins!!" if game_won?
    puts 'Aided by Computer' if game_won? && winner == @player1 && @machine_vs_machine
    puts 'Game over'
  end
end
