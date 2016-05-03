class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Sulfuras"
        item.quality
      when "Aged Brie"
        item.sell_in -=1
        item.quality += 1 if item.sell_in <= 50
        item.quality += 1 if item.sell_in < 0
      when "Backstage passes"
        item.sell_in -=1
        if item.sell_in < 0 
          item.quality = 0
        elsif item.sell_in <= 50
          item.quality += 1 if item.sell_in <=50
          item.quality += 1 if item.sell_in <= 10
          item.quality += 1 if item.sell_in <= 5
        end
      when "Conjured"
        if item.sell_in < 0
          item.quality -= 2
        elsif item.sell_in <= 50
          item.quality += 2
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
