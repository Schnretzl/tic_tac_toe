require_relative '../lib/player'

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
end