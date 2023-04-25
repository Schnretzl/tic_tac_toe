class Square
  attr_reader :coordinate
  attr_accessor :played_symbol

  def initialize(coordinate, played_symbol = nil)
    @coordinate = coordinate
    @played_symbol = nil
  end
end

class Player
  def initialize(player_number, name = "", symbol)
    @name = name.empty? ? "Player #{player_number}" : name
    @symbol = symbol
  end

  attr_reader :name, :symbol

  def play(coordinate, board)
    board.squares[coordinate].played_symbol = symbol
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
end

def check_line(board)
  ['ABC', 'DEF', 'GHI', 'ADG', 'BEH', 'CFI', 'AEI', 'CEG'].each do |line|
    state = board.squares[line[0]].played_symbol
    next if state.nil?

    return state if board.squares[line[1]].played_symbol == state && board.squares[line[2]].played_symbol == state
  end

  return nil
end

def display_board_moves(board)
  a_symbol = board.squares['A'].played_symbol.nil? ? board.squares['A'].coordinate : ' '
  b_symbol = board.squares['B'].played_symbol.nil? ? board.squares['B'].coordinate : ' '
  c_symbol = board.squares['C'].played_symbol.nil? ? board.squares['C'].coordinate : ' '
  puts "#{a_symbol.center(3)} | #{b_symbol.center(3)} | #{c_symbol.center(3)}"
  puts '----+-----+----'
  d_symbol = board.squares['D'].played_symbol.nil? ? board.squares['D'].coordinate : ' '
  e_symbol = board.squares['E'].played_symbol.nil? ? board.squares['E'].coordinate : ' '
  f_symbol = board.squares['F'].played_symbol.nil? ? board.squares['F'].coordinate : ' '
  puts "#{d_symbol.center(3)} | #{e_symbol.center(3)} | #{f_symbol.center(3)}"
  puts '----+-----+----'
  g_symbol = board.squares['G'].played_symbol.nil? ? board.squares['G'].coordinate : ' '
  h_symbol = board.squares['H'].played_symbol.nil? ? board.squares['H'].coordinate : ' '
  i_symbol = board.squares['I'].played_symbol.nil? ? board.squares['I'].coordinate : ' '
  puts "#{g_symbol.center(3)} | #{h_symbol.center(3)} | #{i_symbol.center(3)}"
end

def display_board(board)
  a_symbol = board.squares['A'].played_symbol || ''
  b_symbol = board.squares['B'].played_symbol || ''
  c_symbol = board.squares['C'].played_symbol || ''
  puts "#{a_symbol.center(3)} | #{b_symbol.center(3)} | #{c_symbol.center(3)}"
  puts '----+-----+----'
  d_symbol = board.squares['D'].played_symbol || ''
  e_symbol = board.squares['E'].played_symbol || ''
  f_symbol = board.squares['F'].played_symbol || ''
  puts "#{d_symbol.center(3)} | #{e_symbol.center(3)} | #{f_symbol.center(3)}"
  puts '----+-----+----'
  g_symbol = board.squares['G'].played_symbol || ''
  h_symbol = board.squares['H'].played_symbol || ''
  i_symbol = board.squares['I'].played_symbol || ''
  puts "#{g_symbol.center(3)} | #{h_symbol.center(3)} | #{i_symbol.center(3)}"
end

puts 'Name of player 1?'
p1 = Player.new(1, gets.chomp, 'X')
puts 'Name of player 2?'
p2 = Player.new(2, gets.chomp, 'O')
board = Board.new(p1, p2)
current_player = p1
loop do
  puts "#{current_player.name}, where do you want to play?"
  display_board_moves(board)
  coordinate = STDIN.gets.chomp.upcase
  until /[A-I]/ =~ coordinate && board.squares[coordinate].played_symbol.nil?
    puts 'Please enter a valid square'
    coordinate = STDIN.gets.chomp.upcase
  end
  # board.squares[coordinate].played_symbol = current_player.symbol
  current_player.play(coordinate, board)
  winner = check_line(board)
  display_board(board)
  unless winner.nil?
    puts "#{current_player.name} wins!"
    break
  end
  current_player = current_player == p1 ? p2 : p1
end