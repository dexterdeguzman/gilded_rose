class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      process(item)
    end
  end

  def process(item)
    decrement(item)

    case item.name.downcase
    when /sulfuras/
      item.quality = 80
    when /aged brie/
      item.quality += 1 if item.sell_in <= 50
      item.quality += 1 if item.sell_in < 0
    when /backstage passes/
      if item.sell_in < 0 
        item.quality = 0
      elsif item.sell_in <= 50
        item.quality += 1 if item.sell_in <=50
        item.quality += 1 if item.sell_in <= 10
        item.quality += 1 if item.sell_in <= 5
      end
    when /conjured/
      item.quality -= 2 if item.sell_in <= 50
      item.quality -= 2 if item.sell_in < 0
    end

    validate(item)
  end

  private

  def validate(item)
    if item.quality < 0
      item.quality = 0
    end
  end

  def decrement(item)
    item.sell_in -= 1 unless item.name.downcase.include?("sulfuras")
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
