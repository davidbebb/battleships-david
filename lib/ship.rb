class Ship

  attr_reader:length
  attr_reader:hits
  attr_reader:sunk

  def initialize(length)
    @length=length
    @hits = []
    @sunk = false
    @ship_position = []
  end

  def make_possible_coords(origin, direction)
    x,y = origin[0], origin[1]
    possible_ship_place = []
    @length.times do
      possible_ship_place << [x, y]
      step ={ N: ->(x,y){[x, y-=1]},
              S: ->(x,y){[x, y+=1]},
              E: ->(x,y){[x+=1, y]},
              W: ->(x,y){[x-=1, y]} }
      new_coord = step[direction].call(x,y)
      x,y = new_coord[0],new_coord[1]
    end
    possible_ship_place
  end

  def position_ship(place)
    if place.length == @length
      @ship_position=place
    else
      @ship_position=[]
    end
  end

  def shoot(coord)
    if @ship_position.include?(coord)
      @ship_position.map! {|xy| xy == coord ? xy = :hit : xy }
      :hit
    else
      :miss
    end
  end

  def sunk?
    @ship_position - [:hit] == [] ? @sunk=true : @sunk=false
  end
end
