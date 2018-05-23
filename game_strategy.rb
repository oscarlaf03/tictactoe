require_relative 'game_moves'
# Creates strategies with e 'move' priority
class GameStrategy < GameMoves

  private

  # GAME STRATEGIES
  def center_win_block_corner_random(player)
    if center_free?
      draw_center
    elsif find_winning_move(player)
      find_winning_move(player)
    elsif block_oponent(player)
      block_oponent(player)
    elsif draw_corner
      draw_corner
    else
      random_move
    end
  end

  def block_win_random(player)
    if block_oponent(player)
      block_oponent(player)
    elsif find_winning_move(player)
      find_winning_move(player)
    else
      random_move
    end
  end

  def random_only
    random_move
  end
end
