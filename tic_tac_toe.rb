class Player  
  def initialize(player_number, name = "", symbol)
    @name = name.empty?? "Player #{player_number}" : name
    @symbol = symbol
  end

  attr_reader :name, :symbol

  def play(coordinate)

  end
end

class Square
  attr_reader :coordinate
  attr_accessor :played_symbol
  
  def initialize(coordinate, played_symbol = nil)
    @coordinate = coordinate
    @played_symbol = nil
  end
end

class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @squares = Array.new(3) { |i| Array.new { |j| Square.new((i * 3 + j + 65).chr) } }
  end

  attr_accessor :player1, :player2, :squares
  
  def player

  end

end


puts 'Name of player 1?'
p1 = Player.new(1, gets.chomp, 'X')
puts 'Name of player 2?'
p2 = Player.new(2, gets.chomp, 'O')
board = Board.new(p1, p2)
p p1.name
p p2.name