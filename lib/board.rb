
class Board

  attr_reader:width
  attr_reader:height

  def initialize(columns,rows)
    @width=columns
    @height=rows
  end

  def ship_within_board?(ship)
    possible_position = ship.make_possible_coords
    possible_position.each do |coord|
      x = coord[0]
      y = coord[1]
      fail 'Outside x range' unless (0..(@width-1)).include?(x)
      fail 'Outside y range' unless (0..(@height-1)).include?(y)
    end
    return true
  end

  def have_ships_overlapped
  end

end
