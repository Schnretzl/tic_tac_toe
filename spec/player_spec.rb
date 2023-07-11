require_relative '../lib/player'
require_relative '../lib/board'

describe Player do  
  let(:name) { String.new('Wes') }

  describe '#initialize' do
    it 'Makes the player the provided name' do
      player = described_class.new(1, name, 'X')
      expect(player.instance_variable_get(:@name)).to eq(name)
    end

    it 'Makes the player name \'Player {player number}\' when no name is provided' do
      player = described_class.new(1, 'X')
      expect(player.instance_variable_get(:@name)).to eq('Player 1')
    end
  end

  describe '#play' do
    it 'Changes the square on the board object' do
      player1 = described_class.new(1, 'X')
      player2 = described_class.new(2, 'O')
      game_board = Board.new(player1, player2)
      square_a = game_board.squares['A']
      
      expect(square_a.played_symbol).to be_nil
      player1.play('A', game_board)
      expect(square_a.played_symbol).to eq('X')
    end
  end
end