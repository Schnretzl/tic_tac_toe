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
end