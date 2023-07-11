require_relative 'board'

class Player
  attr_reader :name, :symbol

  def initialize(player_number, name = "", symbol)
    @name = name.empty? ? "Player #{player_number}" : name
    @symbol = symbol
  end

  def play(coordinate, board)
    board.squares[coordinate].played_symbol = symbol
  end
end
