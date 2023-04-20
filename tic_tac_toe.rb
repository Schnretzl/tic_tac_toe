class Player
  def initialize
    @name = name
    @symbol = symbol
  end

  attr_reader :name, :symbol

  def play(coordinate)

  end
end

class Square
  def initialize
    @coordinate = coordinate
    @played_symbol = nil
  end
end

class Board
  def initialize(players, squares)
    @players = players
    @squares = squares
  end
  # @squares = [[A, B, C],
  #             [D, E, F],
  #             [G, H, I]]
  attr_reader :players, :squares

  def player

  end

end


puts 'Name of player 1?'
p1 = Player.new(gets.chomp, 'X')
puts 'Name of player 2?'
p2 = Player.new(gets.chomp, 'O')
board = Board.new(p1, p2)