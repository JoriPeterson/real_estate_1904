class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def area
    @rooms.map do |room|
      room.area
    end.sum
  end

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def rooms_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_by_category
    list = {}
    @rooms.each do |room|
      if list[room.category] == nil
        list[room.category] = [room]
      else
        list[room.category] << room
      end
    end
    list
  end
end
