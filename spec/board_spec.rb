require_relative '../lib/board'

describe Board do
  subject(:game) { Board.new }

  describe '#winner?' do
    context 'when top 3 are in a row' do
      before do
        game.instance_variable_set(:@grid, [
          ["X", "X", "X"],
          [" ", " ", " "],
          [" ", " ", " "]
        ])
      end

      it 'ends game with 3 in a row horizontally first row' do
        game.winner?
        expect(game.instance_variable_get(:@gameover)).to be true
      end
    end
  end

  describe 'not winner?' do
    context 'when top 3 are not a row' do
      subject(:game) { Board.new }

      before do
        game.instance_variable_set(:@grid, [
          ["X", "O", "X"],
          [" ", " ", " "],
          [" ", " ", " "]
        ])
      end

      it 'does NOT end game with 3 in a row horizontally first row' do
        game.winner?
        expect(game.instance_variable_get(:@gameover)).not_to be true
      end
    end
  end
end