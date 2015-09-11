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

  def make_possible_coords(coord, direction)
    possible_ship_place = []
    @length.times do
      possible_ship_place << coord
      coord = convert_direction(coord[0],coord[1],direction)
    end
    possible_ship_place
  end

  def convert_direction(x,y,direction)
    step ={ N: ->(x,y){[x, y-=1]}, S: ->(x,y){[x, y+=1]},
            E: ->(x,y){[x+=1, y]}, W: ->(x,y){[x-=1, y]} }
    step[direction].call(x,y)
  end


  def position_ship(place)
    place.length == @length ? @ship_position=place : @ship_position=[]
  end

  def shoot(coord)
    if @ship_position.include?(coord)
      @ship_position.map!{|xy| xy == coord ? xy = :hit : xy } 
      :hit
    else :miss
    end
  end

  def sunk?
    @ship_position - [:hit] == [] ? @sunk=true : @sunk=false
  end
end
