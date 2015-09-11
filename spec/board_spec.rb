require 'board'

describe 'Board' do
  context 'makes a board' do
    it 'makes a board with dimensions' do
      board=Board.new(3,2)
      expect(board.width).to eq 3
      expect(board.height).to eq 2
    end

    it 'ship is within the size of the board' do
        ship = double(:ship, make_possible_coords:[[0,0],[0,1]])
        board=Board.new(3,2)
        expect(board.ship_within_board?(ship)).to eq(true)
    end
    it 'ship is within the size of the board' do
        ship = double(:ship, make_possible_coords:[[-1,0],[0,0]])
        board=Board.new(3,2)
        expect{board.ship_within_board?(ship)}.to raise_error('Outside x range')
    end
    it 'ship is within the size of the board' do
        ship = double(:ship, make_possible_coords:[[0,0],[0,5]])
        board=Board.new(3,2)
        expect{board.ship_within_board?(ship)}.to raise_error('Outside y range')
    end

    xit 'have ships overlapped'

    xit 'list ships'




  end

end
