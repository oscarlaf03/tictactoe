Code improvements:
  -Refactored code
  -Split game functions into separate Parent classes with private methods for security
  - Created the class player to instantiate  player's attributes

New features:
  -User can set his/hers name
  -User can choose his marker either ('x' or 'o')
  -All user inputs are validated and inforced in-game
  - User can choose between three difficulty levels
  - Difficulty levels based on the computer's next move decision making process:
    Lazy: just random moves

    Normal: prioritize blocking the oponent over iterating a winning move for it self if neither a blocking or winning move is evident it moves randomly

    Grandmaster: it always aims first for the center box then prioritize to find a winning move over blocking the oponent if neither a winning or blocking move is evident it looks for an available corner of the board, if there is none it moves randomly by the way I played several times and I pretty much think the grandmaster machine is unbeatable you are to secure a tie at best.

  -User can delegate his game strategy to the computer (computer vs computer)
  - Game shows the results at the end of the game (Did someone won or was it a tie?)
  -Results show who the winner was and if the winner was aided by the computer

