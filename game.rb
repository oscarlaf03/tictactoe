require_relative 'game_services'
require_relative 'player'
# Functions for the game
class Game < GameServices
  def initialize
    @board = %w[0 1 2 3 4 5 6 7 8]
    @player1 = Player.new
    @player2 = Player.new(false)
    @difficulty_level = set_difficulty_level
    @machine_vs_machine = set_game_type
    set_player2_marker
  end

  #  START GAME
  def start_game
    # start by printing the board
    puts "\nChoose and empty box from [0-8]:\n"
    print_board
    # loop through until the game was won or tied
    until game_over?
      player1_move
      player2_move unless game_over?
      print_board
    end
    game_over_message
  end

  private

  # GAME INPUTS
  def player1_move
    if @machine_vs_machine
      @board[next_move(@player1)] = @player1.marker
    else
      @board[get_valid_user_box_input(gets.chomp).to_i] = @player1.marker
    end
  end

  def player2_move
    @board[next_move(@player2)] = @player2.marker
  end

  # GAME SETTINGS
  def set_player2_marker
    @player1.marker == 'X' ? @player2.marker = 'O' : @player2.marker = 'X'
  end

  def set_difficulty_level
    puts "Chose your Difficulty Level"
    puts "Type '1' for Lazy"
    puts "Type '2' for Normal"
    puts "Type '3' for Grandmaster"
    get_valid_user_level_input(gets.chomp).to_i
  end

  def set_game_type
    puts "Allow the machine to play on your behalf?\n 'Y' or 'N'"
    get_valid_game_type(gets.chomp).casecmp?('Y') ? true : false
  end

  # COMPUTER NEXT MOVE
  def next_move(player)
    case @difficulty_level
    when 1 then random_only
    when 2 then block_win_random(player)
    when 3 then center_win_block_corner_random(player)
    end
  end
end
