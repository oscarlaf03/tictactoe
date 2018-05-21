require_relative 'index'
class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    set_markers
    @difficulty_level = set_difficulty_level
    @machine_vs_machine = set_game_type

  end

  #   START GAME
  def start_game
    # start by printing the board
    puts "\nChoose and empty box from [0-8]:\n\n"
    print_board
    # loop through until the game was won or tied
    until game_over?
      player1_move
      player2_move
      print_board
    end
    puts "It's a tie" if tie?
    puts "#{winner_is.capitalize} wins!!" if winner?
    puts "Game over"
  end

  private

  #GAME INPUTS
  def player1_move
    if @machine_vs_machine
      @board[next_move] = @player1
    else
      @board[get_valid_user_box_input(gets.chomp).to_i] = @player1
    end
  end

  def player2_move
    @board[next_move] = @player2
  end

  #GAME SERVICES
  def set_markers
    puts "Chose a Marker for player 1 'X' OR 'O'"
    @player1 = get_valid_maker(gets.chomp).upcase
    @player1 == 'X'? @player2 = 'O' : @player2 = 'X'
  end

  def print_board
    puts "\n\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts "Your turn \n\n" unless game_over?
  end

  def set_difficulty_level
    puts "Chose your Difficulty Level"
    puts "Type '1' for Lazy"
    puts "Type '2' for Normal"
    puts "Type '3' for Grandmaster"
    level = get_valid_user_level_input(gets.chomp).to_i
  end

  def set_game_type
    puts "Allow the machine to play for you?\n 'Y' or 'N'"
    answer = get_valid_game_type(gets.chomp).upcase
    answer == 'Y' ? true : false
  end

  # READING THE CURRENT BOARD
  def available_spaces
    spaces = []
    @board.each do |s|
      spaces << s if s != "X" && s != "O"
    end
    return spaces
  end

  def center_free?
    available_spaces.include?(@board[4])
  end

  # ACTIONS
  def draw_center
    4
  end

  def find_winning_move
    available_spaces.each do |as|
      @board[as.to_i] = @player2
      if winner?
        @board[as.to_i] = as
        return  as.to_i
      else
        @board[as.to_i] = as
      end
    end
    false
  end

  def block_oponent
    available_spaces.each do |as|
      @board[as.to_i] = @player1
      if winner?
        @board[as.to_i] = as
        return as.to_i
      else
        @board[as.to_i] = as
      end
    end
    false
  end

  def random_move
    available_spaces.sample.to_i
  end

  # GAME STRATEGIES
  def win_block_random
    if center_free?
      draw_center
    elsif find_winning_move
      find_winning_move
    elsif block_oponent
      block_oponent
    else
      random_move
    end
  end

  def block_win_random
    if block_oponent
      block_oponent
    elsif find_winning_move
      find_winning_move
    else
      random_move
    end
  end

  def random_only
    random_move
  end

  # SETTING GAME STRATEGY ACCORDING TO DIFFICULTY LEVEL
  def next_move
    case @difficulty_level
    when 1
      random_only
    when 2
      block_win_random
    when 3
      win_block_random
    end
  end

  # GAME OUTCOME
  def winning_combinations
    row1 = [@board[0], @board[1], @board[2]]
    row2 = [@board[3], @board[4], @board[5]]
    row3 = [@board[6], @board[7], @board[8]]
    col1 = [@board[0], @board[3], @board[6]]
    col2 = [@board[1], @board[4], @board[7]]
    col3 = [@board[2], @board[5], @board[8]]
    cross1 = [@board[0], @board[4], @board[8]]
    cross2 = [@board[2], @board[4], @board[6]]
    [col1, col2, col3, row1, row2, row3, cross1, cross2]
  end

  def find_winning_set
    winning_combinations.each do |set|
      return set if set.uniq.length == 1
    end
    false
  end

  def winner?
    find_winning_set ? true : false
  end

  def winner_is
    find_winning_set[0] == @player1 ? 'player1' : 'player2'
  end

  def tie?
    !winner? && available_spaces.length == 0
  end

  def game_over?
    winner? || tie?
  end
end

game = Game.new
game.start_game
