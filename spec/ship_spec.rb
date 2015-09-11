require 'ship'

describe 'Ship' do
  context 'making a new ship' do
    it 'creates a new ship' do
      expect(ship=Ship.new(2)).to be_an_instance_of Ship
    end
    it 'creates a new ship with length 3' do
      expect(Ship.new(3).length).to eq 3
    end
    it 'creates a ship with no hits' do
      expect(Ship.new(3).hits).to eq []
    end
    it 'creates a ship that is not sunk' do
      expect(Ship.new(4).sunk).to eq false
    end
  end

  context 'placing a ship' do
    it 'makes the correct number of coords' do
      expect( Ship.new(3).make_possible_coords([0,0], :E)).to eq([[0,0], [1,0], [2,0]])
    end
    it 'can be placed' do
      place=[[0, 0], [1, 0], [2, 0]]
      expect(Ship.new(3).position_ship(place)).to eq place
    end
    it 'doesn\'t place ship of wrong length' do
      place=[[0, 0], [1, 0], [2, 0], [3,0]]
      expect(Ship.new(3).position_ship(place)).to eq []
    end
  end

  context 'reponds to attacks' do
    it 'reports a hit' do
      ship = Ship.new(3)
      ship.position_ship([[0, 0], [1, 0], [2, 0]])
      coord=[0,0]
      expect(ship.shoot([0,0])).to eq :hit
    end
    it 'reports a miss' do
      ship = Ship.new(3)
      ship.position_ship([[0, 0], [1, 0], [2, 0]])
      expect(ship.shoot([0,1])).to eq :miss
    end
    it 'reports sunk' do
      ship = Ship.new(1)
      ship.position_ship([1, 0])
      ship.shoot([1,0])
      expect(ship.sunk?).to eq true
    end
  end
end
