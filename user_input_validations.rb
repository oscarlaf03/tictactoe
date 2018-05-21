# GET VALID USER INPUTS DATA
def valid_user_level_input?(input)
  (1..3).include?(input.to_i)
end

def get_valid_user_level_input(input)
  if valid_user_level_input?(input)
    input
  else
    until valid_user_level_input?(input)
      puts "'#{input}'Is not a valid difficultylevel\nPlease try again"
      input = gets.chomp
    end
  return input
  end
end

def user_box_input_valid?(user_input)
  available_spaces.include?(user_input)
end

def get_valid_user_box_input(user_input)
  if user_box_input_valid?(user_input)
    return user_input
  else
    until user_box_input_valid?(user_input)
      puts "'#{user_input}'Is not a valid cell option \nPlease try again"
      user_input = gets.chomp
    end
  return user_input
  end
end

def valid_marker?(input)
  %w[X O].include?(input.upcase)
end

def get_valid_maker(input)
  if valid_marker?(input)
    input
  else
    until valid_marker?(input)
      puts "'#{input}'Is not a valid marker\nPlease try again"
      input = gets.chomp
    end
  return input
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
  return input
  end
end
