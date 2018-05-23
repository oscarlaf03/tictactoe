require_relative 'game_strategy'
# Checks  and inforces user valid inputs
class GameInputValidations < GameStrategy

  private

  def valid_user_level_input?(input)
    (1..3).cover?(input.to_i)
  end

  def get_valid_user_level_input(input)
    if valid_user_level_input?(input)
      input
    else
      until valid_user_level_input?(input)
        puts "'#{input}'Is not a valid difficultylevel\nPlease try again"
        input = gets.chomp
      end
      input
    end
  end

  def get_valid_user_box_input(input)
    if available?(input)
      input
    else
      until available?(input)
        puts "'#{input}'Is not a valid cell option \nPlease try again"
        input = gets.chomp
      end
      input
    end
  end

  def valid_marker?(input)
    %w[X O].include?(input.upcase)
  end

  def get_valid_marker(input)
    if valid_marker?(input)
      input
    else
      until valid_marker?(input)
        puts "'#{input}'Is not a valid marker\nPlease try again"
        input = gets.chomp
      end
      input
    end
  end

  def valid_game_type?(input)
    %w[Y N].include?(input.upcase)
  end

  def get_valid_game_type(input)
    if valid_game_type?(input)
      input
    else
      until valid_game_type?(input)
        puts "'#{input}'Is not a valid answer\nPlease try again"
        input = gets.chomp
      end
      input
    end
  end
end
