=begin
- [checked] Adicionar tratamento de entradas válidas.
- Permitir a seleção da modalidade de jogo: fácil, médio ou
difícil
(hoje está sempre no difícil).
- Permitir a seleção do tipo de jogo: computador vs computador,
 player vs player ou computador vs player.

O objetivo do desafio então é melhorar o código e adicionar
o maior número de features possíveis, incluindo as mencionadas
anteriormente e quaisquer outras que você julgue necessária
para evoluir e melhorar o jogo. Qualquer melhoria ou feature
que julgue ser necessária será muito bem vinda.
=end

class Game
  def initialize
    # @board = (1..9).to_a # Removed box
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
  end

  def print_board
    puts "\n\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts "Your turn \n\n"
  end

  def start_game
    # start by printing the board
    puts "\nChoose and empty box from [0-8]:\n\n"
    print_board
    # loop through until the game was won or tied
    until game_over?
      get_human_spot
      eval_board unless (game_over?)
      print_board
    end
    puts 'Is a tie' if tie?
    puts "Game over"
  end

  def user_input_valid?(user_input)
    available_spaces.include?(user_input)
  end

  def get_valid_user_input(user_input)
    if user_input_valid?(user_input)
      return user_input
    else
      until user_input_valid?(user_input)
        puts "'#{user_input}'Is not a valid cell option \nPlease try again"
        user_input = gets.chomp
      end
    return user_input
    end
  end

  def get_human_spot
    @board[get_valid_user_input(gets.chomp).to_i] = @hum
  end

  def draw_center
    if available_spaces.include?(@board[4])
      @board[4] = @com
    else
      return false
    end
  end

  def eval_board
    spot = nil
    until spot
      if @board[4] == "4"
        spot = 4
        @board[spot] = @com
      else
        spot = get_best_move(@com)
        if @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = @com
        else
          spot = nil
        end
      end
    end
  end

  def available_spaces
    spaces = []
    @board.each do |s|
      if s != "X" && s != "O"
        spaces << s
      end
    end
    return spaces
  end

  def find_winning_move
    available_spaces.each do |as|
      @board[as.to_i] = @com
      return as.to_is if winner?
    end
    false
  end

  def block_oponent
    available_spaces.each do |as|
      @board[as.to_i] = @hum
      return as.to_is if winner?
    end
    false
  end

  def random_move
    available_spaces.sample.to_i
  end




  def get_best_move(next_player, depth = 0, best_score = {})
    best_move = nil

    available_spaces.each do |as|
      @board[as.to_i] = @com
      if winner?
        best_move = as.to_i
        @board[as.to_i] = as
        return best_move
        else
        @board[as.to_i] = @hum
        if winner?
          best_move = as.to_i
          @board[as.to_i] = as
          return best_move
        end
      end
    end

    if best_move
      return best_move
    else
      random_move
    end
  end

  def winner?
    [@board[0], @board[1], @board[2]].uniq.length == 1 ||
    [@board[3], @board[4], @board[5]].uniq.length == 1 ||
    [@board[6], @board[7], @board[8]].uniq.length == 1 ||
    [@board[0], @board[3], @board[6]].uniq.length == 1 ||
    [@board[1], @board[4], @board[7]].uniq.length == 1 ||
    [@board[2], @board[5], @board[8]].uniq.length == 1 ||
    [@board[0], @board[4], @board[8]].uniq.length == 1 ||
    [@board[2], @board[4], @board[6]].uniq.length == 1
  end


  def game_is_over(b=@board)
    winner? || tie?
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
