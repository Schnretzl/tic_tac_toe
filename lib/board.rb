require_relative 'square'
require_relative 'player'

class Board
  attr_accessor :player1, :player2, :squares

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @squares = {}
    ('A'..'I').each do |letter|
      @squares[letter] = Square.new(letter)
    end
  end
end
