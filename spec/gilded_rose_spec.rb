require 'spec_helper'
 
describe GildedRose do

  let!(:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros", 10, 50) }
  let!(:aged_brie) { Item.new("Aged Brie", 10, 10) }
  let!(:aged_brie2) { Item.new("Aged Brie", -1, 10) }
  let!(:backstage) { Item.new("Backstage passes", 15, 15) }
  let!(:backstage2) { Item.new("Backstage passes", 9, 15) }
  let!(:backstage3) { Item.new("Backstage passes", 5, 15) }
  let!(:backstage4) { Item.new("Backstage passes", -1, 15) }
  let!(:conjured) { Item.new("Conjured", 10, 10) }
  let!(:conjured2) { Item.new("Conjured", -4, 10) }

  describe "#update_quality" do
    context "Sulfuras" do
      it "does never had to be sold" do
        gilded_rose = GildedRose.new([sulfuras])
        gilded_rose.update_quality

        expect(sulfuras.sell_in).to eq sulfuras.sell_in
      end

      it "does never decreases in quality" do
        gilded_rose = GildedRose.new([sulfuras])
        gilded_rose.update_quality

        expect(sulfuras.quality).to eq 80 
      end
    end

    context "Aged Brie" do
      it "actually increases in quality the older it gets" do
        gilded_rose = GildedRose.new([aged_brie])
        gilded_rose.update_quality
      
        expect(aged_brie.quality).to eq 11
      end

      it "degrade quality twice as fast after the sell in date" do
        gilded_rose = GildedRose.new([aged_brie2])
        gilded_rose.update_quality
      
        expect(aged_brie2.quality).to eq 12
      end
    end

    context "Backstage passes" do
      it "increases quality as its sellin value approaches" do
        gilded_rose = GildedRose.new([backstage])
        gilded_rose.update_quality
      
        expect(backstage.quality).to eq 16
      end

      it "increases quality  by 2 when there are 10 days or less" do
        gilded_rose = GildedRose.new([backstage2])
        gilded_rose.update_quality
      
        expect(backstage2.quality).to eq 17
      end

      it "increases quality  by 3 when there are 5 days or less" do
        gilded_rose = GildedRose.new([backstage3])
        gilded_rose.update_quality
      
        expect(backstage3.quality).to eq 18
      end

      it "quality drops to 0 after the concert" do
        gilded_rose = GildedRose.new([backstage4])
        gilded_rose.update_quality
      
        expect(backstage4.quality).to eq 0
      end
    end

    context "Conjured" do
      it "degrade in quality twice as fast as normal items" do
        gilded_rose = GildedRose.new([conjured])
        gilded_rose.update_quality
      
        expect(conjured.quality).to eq 8
      end

      it "degrades twice as fast after the sell in date" do
        gilded_rose = GildedRose.new([conjured])
        gilded_rose.update_quality
      
        expect(conjured.quality).to eq 8
      end
    end

  end

end