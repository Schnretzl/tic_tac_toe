class Square
  attr_reader :coordinate
  attr_accessor :played_symbol

  def initialize(coordinate, played_symbol = nil)
    @coordinate = coordinate
    @played_symbol = nil
  end
end