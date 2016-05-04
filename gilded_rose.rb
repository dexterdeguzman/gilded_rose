class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      validate(item)
      decrement(item)
      case item.name
      when "Sulfuras"
        item.quality = 80
      when "Aged Brie"
        item.quality += 1 if item.sell_in <= 50
      when "Backstage passes"
        if item.sell_in < 0 
          item.quality = 0
        elsif item.sell_in <= 50
          item.quality += 1 if item.sell_in <=50
          item.quality += 1 if item.sell_in <= 10
          item.quality += 1 if item.sell_in <= 5
        end
      when "Conjured"
        item.quality -= 2 if item.sell_in <= 50
        item.quality -= 2 if item.sell_in < 0
      end
    end
  end

  private

  def validate(item)
    if item.quality < 0
      item.quality
    end
  end

  def decrement(item)
    item.sell_in -= 1 unless item.name == "Sulfuras"
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
