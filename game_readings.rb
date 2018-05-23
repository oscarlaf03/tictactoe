# Class that understand the current state of the board
class GameReadings

  private

  # READING CURRENT BOARD
  def available_spaces
    spaces = []
    @board.each do |s|
      spaces << s if s != 'X' && s != 'O'
    end
    spaces
  end

  def center
    @board[4]
  end

  def available?(box)
    available_spaces.include?(box)
  end

  def center_free?
    available?(center)
  end

  def corners
    [@board[0], @board[2], @board[6], @board[8]]
  end

  def available_corners
    corners.find_all { |as| available?(as) }
  end

  # GAME OUTCOME

  def winning_sets
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
    winning_sets.find { |set| set.uniq.length == 1 }
  end

  def game_won?
    find_winning_set ? true : false
  end

  def winner
    find_winning_set[0] == @player1.marker ? @player1 : @player2
  end

  def tie?
    !game_won? && available_spaces.empty?
  end

  def game_over?
    game_won? || tie?
  end
end
