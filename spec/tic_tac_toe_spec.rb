require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/square'
require_relative '../lib/tic_tac_toe'

describe '#check_line' do
  subject(:player1) { Player.new(1, 'X') }
  subject(:player2) { Player.new(2, 'O') }
  subject(:game_board) { Board.new(player1, player2)}

  it 'Returns nil if there is no winner' do
    expect(check_line(game_board)).to be_nil
  end

  it 'Returns \'X\' when there is an \'X\' across the top row' do
    ['A', 'B', 'C'].each do |letter|
      game_board.squares[letter].played_symbol = 'X'
    end

    expect(check_line(game_board)).to eq 'X'
  end

  it 'Returns \'O\' when there is an \'O\' down the middle column' do
    ['B', 'E', 'H'].each do |letter|
      game_board.squares[letter].played_symbol = 'O'
    end

    expect(check_line(game_board)).to eq 'O'
  end

  it 'Returns \'X\' when there is an \'X\' across the top left to bottom right diagonal' do
    ['A', 'E', 'I'].each do |letter|
      game_board.squares[letter].played_symbol = 'X'
    end

    expect(check_line(game_board)).to eq 'X'
  end
end