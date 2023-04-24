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
    @squares = {}
    ('A'..'I').each do |letter|
      @squares[letter] = Square.new(letter)
    end
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

p board.squares['A'].played_symbol