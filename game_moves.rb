require_relative 'game_readings'
#  Makes the next move decisions
class GameMoves < GameReadings

  private

  def find_winning_move(player)
    play = player == @player1 ? @player1.marker : @player2.marker
    available_spaces.each do |as|
      @board[as.to_i] = play
      if game_won?
        @board[as.to_i] = as
        return  as.to_i
      else
        @board[as.to_i] = as
      end
    end
    false
  end

  def block_oponent(player)
    play = player == @player1 ? @player2.marker : @player1.marker
    available_spaces.each do |as|
      @board[as.to_i] = play
      if game_won?
        @board[as.to_i] = as
        return as.to_i
      else
        @board[as.to_i] = as
      end
    end
    false
  end

  def draw_corner
    available_corners.empty? ? false : available_corners.sample.to_i
  end

  def random_move
    available_spaces.sample.to_i
  end

  def draw_center
    4
  end
end
